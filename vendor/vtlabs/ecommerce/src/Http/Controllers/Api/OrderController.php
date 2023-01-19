<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Vtlabs\Ecommerce\Models\Order;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Ecommerce\Events\NewOrder;
use Vtlabs\Payment\Models\PaymentMethod;
use Vtlabs\Ecommerce\Filters\OrderFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Events\UpdateOrderStatus;
use Vtlabs\Ecommerce\Services\CheckoutService;
use Vtlabs\Ecommerce\Http\Resources\OrderResource;
use Vtlabs\Payment\Http\Resources\PaymentResource;

class OrderController extends Controller
{
    public function __construct()
    {
        // since the store can be used with or without Authorization, we are applying auth middleware,
        // if Authorization header was present, so that we can get current user using Auth::user()
        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            $this->middleware('auth:api');
        }
    }

    public function index(Request $request)
    {
        $request->validate([
            'vendor' => 'sometimes',
            'delivery_profile' => 'sometimes',
            'user' => 'sometimes',
            'status' => 'sometimes',
            'id' => 'sometimes'
        ]);

        if (!$request->vendor && !$request->delivery_profile) {
            $request->merge([
                'current_user' => Auth::user()->id
            ]);
        }

        $orders = Order::filter($request->all(), OrderFilter::class)->ordered();

        return OrderResource::collection($orders->paginate());
    }

    public function store(Request $request)
    {
        $checkoutService = new CheckoutService($request->all(), Auth::user() ?? null);

        // validate create order request
        $checkoutService->validator()->validate();

        // check if we need to create a normal order or custom order, 
        // custom order is that order which isn't controlled by a vendor.
        // Communication happens between user and delivery profile only.
        if (
            $checkoutService->orderType() == Order::ORDER_TYPE_NORMAL
            || $checkoutService->orderType() == Order::ORDER_TYPE_TAKEAWAY
            || $checkoutService->orderType() == Order::ORDER_TYPE_DINEIN
        ) {
            $orderIds = $checkoutService->createOrder();
        } else {
            $orderIds = $checkoutService->createCustomOrder();
        }

        // handle multiple orders incase checkout contains products from multiple vendors
        $payment = null;
        if (count($orderIds) > 1) {
            // payment
            $payment = $checkoutService->createMultiOrderPayment($orderIds);
        }

        // if payment is null that means payment object inside order will be used, 
        // it implies that it's a single vendor order
        return response()->json([
            'payment' => $payment ? new PaymentResource($payment): null,
            'order' => new OrderResource(Order::find($orderIds[0]))
        ]);
    }

    public function show(Order $order)
    {
        return new OrderResource($order);
    }

    public function update(Order $order, Request $request)
    {
        $request->validate([
            'status' => ['sometimes', Rule::in(config('vtlabs_ecommerce.order.status_list', []))],
            'delivery_status' => ['sometimes', Rule::in(config('vtlabs_ecommerce.order_delivery.status_list', []))],
            // 'distance_in_metres' => 'sometimes|numeric', // this parameter is no longer in use, we calculate distance server side in UpdateOrderStatusListener
            'meta' => 'sometimes|json',
        ]);

        if ($request->status) {
            $lastStatus = $order->status;

            $order->setStatus($request->status);

            $order->save();

            event(new UpdateOrderStatus($order, 'order', $request->status, $lastStatus));
        }

        if ($request->delivery_status) {
            $lastStatus = $order->delivery->status;

            $order->delivery->setStatus($request->delivery_status);

            $order->save();

            event(new UpdateOrderStatus($order, 'delivery', $request->delivery_status, $lastStatus));
        }

        // if ($request->distance_in_metres) {
        //     $order->distance_travelled = $request->distance_in_metres;
        //     $order->save();
        // }

        if ($request->meta) {
            $order->meta = json_decode($request->meta); 
            $order->save();
        }

        return new OrderResource($order->fresh());
    }

    public function calculateDeliveryFee(Request $request)
    {
        $request->validate([
            'order_type' => 'required|in:CUSTOM,NORMAL',
            'vendor_id' => 'sometimes',
            'source_lat' => 'sometimes',
            'source_lng' => 'required_with:source_lat',
            'dest_lat' => 'required_with:source_lat',
            'dest_lng' => 'required_with:source_lat',
        ]);

        $vendor = $request->vendor_id ? Vendor::find($request->vendor_id) : null;

        $locations = [];

        if($request->source_lat) {
            $locations['source_lat'] = $request->source_lat;
            $locations['source_lng'] = $request->source_lng;
            $locations['dest_lat'] = $request->dest_lat;
            $locations['dest_lng'] = $request->dest_lng;
        }

        return response()->json(["delivery_fee" => CheckoutService::calculateDeliveryFee($vendor, null, $locations)]);
    }
}
