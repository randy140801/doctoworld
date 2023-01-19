<?php

namespace Vtlabs\Ecommerce\Listeners;

use Vtlabs\Core\Models\Setting;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\DB;
use Vtlabs\Ecommerce\Models\Order;
use Vtlabs\Ecommerce\Services\OrderService;
use Vtlabs\Ecommerce\Events\UpdateOrderStatus;
use Vtlabs\Core\Services\GoogleDistanceService;

class UpdateOrderStatusListener
{
    private $order;

    private $status;

    private $statusType;

    private $orderService;

    private $deliveryProfile;

    private $lastStatus;

    public function __construct()
    {
        //
    }

    public function handle(UpdateOrderStatus $event)
    {
        $this->order = $event->order;
        $this->status = $event->status;
        $this->lastStatus = $event->lastStatus;
        $this->statusType = $event->statusType;
        $this->orderService = new OrderService($this->order);
        $this->deliveryProfile = $this->order->delivery->delivery ?? null;

        if ($this->statusType == 'order') {
            $this->_onOrderStatusUpdate();
        }

        if ($this->statusType == 'delivery') {
            $this->_onOrderDeliveryStatusUpdate();
        }

        $orderService = new OrderService($this->order);
        $orderService->notifyFirebase();
    }

    private function _onOrderStatusUpdate()
    {
        if (
            in_array($this->status, Order::ACTIVE_ORDER_STATUS)
            && in_array($this->order->order_type, Order::DELIVERABLE_ORDER_TYPES)
        ) {

            // try assigning delivery profile to order
            if (!$this->order->delivery) {
                $this->orderService->sendDeliveryRequest();
            }
        }

        if ($this->status == 'complete') {
            $this->_onOrderComplete();
        }

        $this->notifyStatusUpdate();
    }

    private function _onOrderDeliveryStatusUpdate()
    {
        switch ($this->status) {
            case 'started':
                $this->order->setStatus('intransit');
                break;
            case 'complete':
                $this->order->setStatus('complete');
                $this->_onOrderComplete();
                $this->notifyStatusUpdate();
                break;
        }
    }

    private function _onOrderComplete()
    {
        if ($this->deliveryProfile) {
            // un assign delivery profile
            $this->deliveryProfile->assigned = false;
            $this->deliveryProfile->save();
        }

        // update distance travlled by delivery person for this order
        $sourceLat = $sourceLng = $destLat = $destLng = 0;

        // when it's a normal deliverable vendor based order e.g delivoo
        if ($this->order->vendor && $this->order->order_type == Order::ORDER_TYPE_NORMAL && $this->order->address) {
            $sourceLat = $this->order->vendor->latitude;
            $sourceLng = $this->order->vendor->longitude;
            $destLat = $this->order->address->latitude;
            $destLng = $this->order->address->longitude;
        }

        // when it's custom order e.g. courierone
        if ($this->order->order_type == Order::ORDER_TYPE_CUSTOM && $this->order->sourceAddress && $this->order->address) {
            $sourceLat = $this->order->sourceAddress->latitude;
            $sourceLng = $this->order->sourceAddress->longitude;
            $destLat = $this->order->address->latitude;
            $destLng = $this->order->address->longitude;
        }

        // try fetching actual distance between source and destination using google service
        $googleDistanceService = new GoogleDistanceService($sourceLat, $sourceLng, $destLat, $destLng);
        [$distance, $time] = $googleDistanceService->distanceAndTime();
        if (!$distance) {
            // we were not able to get the distance through google, now calculate using displacement
            $distances = DB::select(
                'SELECT ST_Distance_Sphere(Point(:source_lng,:source_lat),Point(:dest_lng,:dest_lat)) as distance',
                ['source_lng' => $sourceLng, 'source_lat' => $sourceLat, 'dest_lng' => $destLng, 'dest_lat' => $destLat,]
            );
            $distance = $distances[0]->distance;
        }
        $this->order->distance_travelled = $distance;
        $this->order->save();


        // handle payment
        if ($this->order->payment->paymentMethod->type == 'postpaid') {
            $this->order->payment->setStatus('paid');
            $this->order->payment->save();
        }

        $this->_distributeEarnings();
    }

    private function _distributeEarnings()
    {
        $adminTotalEarning = 0;
        $vendorEarnings = $this->order->subtotal;

        # vendor earnings
        if ($this->order->vendor) {
            $adminShareInOrder = floatval(Setting::findByKey('admin_commision_value'));
            $vendorEarnings = $this->order->subtotal - ($this->order->subtotal * $adminShareInOrder) / 100;
            $adminTotalEarning = ($this->order->subtotal * $adminShareInOrder) / 100; // admin gets it's share of earning


            $this->order->vendor->user->deposit($vendorEarnings, 'deposit', [
                'description' => 'Order #' . $this->order->id,
                'type' => 'earnings',
                'source' => 'order',
                'source_id' => $this->order->id,
                'source_amount' => $this->order->total,
                'source_payment_type' => $this->order->payment->paymentMethod->type == 'postpaid' ? 'COD' : 'Online'
            ]);
        }

        # delivery profile earnings
        if ($this->deliveryProfile) {
            $deliveryFee = $this->order->delivery_fee;

            // for courier related applications
            $courierType = null;
            if (isset($this->order->meta['order_category'])) {
                $courierType  = $this->order->meta['order_category'];
            }

            $this->deliveryProfile->user->deposit(
                $deliveryFee,
                'deposit',
                [
                    'description' => 'Order #' . $this->order->id,
                    'type' => 'earnings',
                    'source_title' => 'Earning',
                    'source' => 'order',
                    'source_id' => $this->order->id,
                    'source_amount' => $this->order->total,
                    'source_payment_type' => $this->order->payment->paymentMethod->type == 'postpaid' ? 'COD' : 'Online',
                    'source_meta_courier_type' => $courierType
                ]
            );

            if ($this->order->payment->paymentMethod->slug == 'cod') {
                $this->deliveryProfile->user->forceWithdraw(
                    $this->order->total,
                    'withdraw',
                    [
                        'description' => 'Cash collected',
                        'type' => 'cash_collected',
                        'source' => 'order',
                        'source_id' => $this->order->id,
                        'source_amount' => $this->order->total,
                        'source_payment_type' => 'COD',
                        'source_meta_courier_type' => $courierType
                    ]
                );
            }
        }

        // if admin has earned something from this order, create a transaction for admin's earning
        if ($adminTotalEarning !== 0) {
            User::find(1)->deposit($adminTotalEarning, 'deposit', [
                'description' => 'Order #' . $this->order->id,
                'type' => 'earnings',
                'source' => 'order',
                'source_id' => $this->order->id,
                'source_amount' => $this->order->total,
                'source_payment_type' => $this->order->payment->paymentMethod->type == 'postpaid' ? 'COD' : 'Online'
            ]);
        }
    }

    private function notifyStatusUpdate()
    {
        if ($this->status == $this->lastStatus) {
            return;
        }

        if ($this->status == 'accepted' && $this->order->user) {
            $this->order->user->sendPushNotification(
                'customer',
                __('vtlabs_ecommerce::messages.notification_accept_order_user_title', ['id' => $this->order->id]),
                __('vtlabs_ecommerce::messages.notification_accept_order_user_body')
            );
        }

        if ($this->status == 'accepted' && $this->order->user) {
            $this->order->user->sendPushNotification(
                'customer',
                __('vtlabs_ecommerce::messages.notification_accept_order_user_title', ['id' => $this->order->id]),
                __('vtlabs_ecommerce::messages.notification_accept_order_user_body')
            );
        }

        if ($this->status == 'cancelled' && $this->order->vendor) {
            $this->order->vendor->user->sendPushNotification(
                'vendor',
                __('vtlabs_ecommerce::messages.notification_cancel_order_vendor_title', ['id' => $this->order->id]),
                __('vtlabs_ecommerce::messages.notification_cancel_order_vendor_body')
            );
        }

        if ($this->status == 'dispatched' && $this->order->user) {
            $this->order->user->sendPushNotification(
                'customer',
                __('vtlabs_ecommerce::messages.notification_dispatched_order_user_title', ['id' => $this->order->id]),
                __('vtlabs_ecommerce::messages.notification_dispatched_order_user_body')
            );
        }

        if ($this->status == 'complete') {
            if ($this->order->user) {
                $this->order->user->sendPushNotification(
                    'customer',
                    __('vtlabs_ecommerce::messages.notification_complete_order_user_title', ['id' => $this->order->id]),
                    __('vtlabs_ecommerce::messages.notification_complete_order_user_body')
                );
            }

            if ($this->order->vendor) {
                $this->order->vendor->user->sendPushNotification(
                    'vendor',
                    __('vtlabs_ecommerce::messages.notification_complete_order_vendor_title', ['id' => $this->order->id]),
                    __('vtlabs_ecommerce::messages.notification_complete_order_vendor_body')
                );
            }

            if ($this->deliveryProfile) {
                $this->deliveryProfile->user->sendPushNotification(
                    'delivery',
                    __('vtlabs_ecommerce::messages.notification_complete_order_delivery_title', ['id' => $this->order->id]),
                    __('vtlabs_ecommerce::messages.notification_complete_order_delivery_body')
                );
            }
        }
    }
}
