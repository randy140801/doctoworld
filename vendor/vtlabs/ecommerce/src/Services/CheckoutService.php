<?php

namespace Vtlabs\Ecommerce\Services;

use Carbon\Carbon;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\DB;
use Vtlabs\Ecommerce\Models\Order;
use Vtlabs\Payment\Models\Payment;
use Vtlabs\Core\Helpers\CoreHelper;
use Vtlabs\Ecommerce\Models\Coupon;
use Vtlabs\Ecommerce\Models\Vendor;
use Vtlabs\Ecommerce\Models\Address;
use Vtlabs\Ecommerce\Models\Product;
use Vtlabs\Ecommerce\Events\NewOrder;
use Vtlabs\Ecommerce\Models\Customer;
use Vtlabs\Ecommerce\Models\AddonChoice;
use Vtlabs\Payment\Models\PaymentMethod;
use Illuminate\Support\Facades\Validator;
use Vtlabs\Ecommerce\Models\DeliveryMode;
use Vtlabs\Ecommerce\Models\OrderAddress;
use Vtlabs\Ecommerce\Models\OrderProduct;
use Vtlabs\Ecommerce\Models\VendorProduct;
use Vtlabs\Ecommerce\Models\MultiOrderPayment;
use Vtlabs\Ecommerce\Models\OrderProductAddon;

class CheckoutService
{
    private $user;
    private $data;
    private $settings;

    public function __construct(array $data, ?User $user)
    {
        $this->data = $data;
        $this->user = $user;
        $this->settings = CoreHelper::settingsAsDictionary();
    }
    public function validator()
    {
        $validator = Validator::make($this->data, [
            'is_guest' => 'sometimes|boolean',
            'customer_mobile' => 'required_with:is_guest',
            'customer_name' => 'sometimes',
            'customer_email' => 'sometimes',

            'meta' => 'sometimes|json',
            'coupon_code' => 'sometimes',
            'notes' => 'string|nullable',
            'payment_method_slug' => 'required|exists:payment_methods,slug',
            'products' => 'sometimes|array',
            'products.*.id' => 'sometimes|exists:ecommerce_vendor_products,id',
            'products.*.quantity' => 'sometimes|integer|min:1',
            'products.*.addons' => 'sometimes|array',
            'products.*.addons.*.choice_id' => 'sometimes|exists:ecommerce_product_addon_choices,id',
            'type' => 'in:ASAP,LATER',
            'scheduled_on' => 'required_if:type,LATER|date_format:Y-m-d H:i:s',

            'address_id' => 'required_without_all:source_formatted_address,is_guest|exists:ecommerce_addresses,id',

            'source_formatted_address' => 'required_without_all:address_id,is_guest',
            'source_address_1' => 'sometimes',
            'source_address_2' => 'sometimes',
            'source_longitude' => 'required_with:source_formatted_address|numeric',
            'source_latitude' => 'required_with:source_formatted_address|numeric',
            'source_contact_name' => 'sometimes',
            'source_contact_number' => 'sometimes',
            'destination_formatted_address' => 'required_with:source_formatted_address',
            'destination_address_1' => 'sometimes',
            'destination_address_2' => 'sometimes',
            'destination_longitude' => 'required_with:source_formatted_address|numeric',
            'destination_latitude' => 'required_with:source_formatted_address|numeric',
            'destination_contact_name' => 'sometimes',
            'destination_contact_number' => 'sometimes',

            'delivery_mode_id' => 'sometimes|exists:ecommerce_delivery_modes,id',
            'vendor_id' => 'sometimes|exists:ecommerce_vendors,id', // required incase of custom order where vendor id cannot be identified from products
            'order_type' => 'sometimes|in:CUSTOM,NORMAL,TAKEAWAY,DINEIN'
        ]);

        return $validator;
    }

    public function orderType()
    {
        // in case the order type was given in request
        if (!empty($this->data['order_type'])) {
            return $this->data['order_type'];
        }

        // otherwise we detect the order type by following conditions
        if (empty($this->data['products']) && empty($this->data['address_id'])) {
            return Order::ORDER_TYPE_CUSTOM;
        }
        return Order::ORDER_TYPE_NORMAL;
    }

    public function createOrder(): array
    {
        $orders = [];

        // for each diffrent vendor create a new order
        $vendors = $this->groupProductsByVendor();

        // check if has multiple vendors
        $multipleVendors = count($vendors) > 1 ? true : false;

        foreach ($vendors as $vendorId => $vendorOrderItems) {
            $vendor = Vendor::find($vendorId);
            $delivery_mode_id = null;

            // increment vendors order count for stats
            $vendor->orders_count += 1;
            $vendor->save();

            if (isset($this->data['delivery_mode_id'])) {
                $delivery_mode_id = $this->data['delivery_mode_id'];
            }

            $subtotal = 0;
            $subtotal = $vendorOrderItems['subtotal'];

            $locations = [];
            if (empty($this->data['is_guest']) && $this->orderType() == Order::ORDER_TYPE_NORMAL) {
                $selectedAddress = Address::find($this->data['address_id']);
                $locations['source_lat'] = $selectedAddress->latitude;
                $locations['source_lng'] = $selectedAddress->longitude;
                $locations['dest_lat'] = $vendor->latitude;
                $locations['dest_lng'] = $vendor->longitude;
            }

            // apply delivery fee only for deliverable orders
            $deliveryFee = $this->orderType() == Order::ORDER_TYPE_NORMAL ? CheckoutService::calculateDeliveryFee($vendor, $delivery_mode_id, $locations) : 0;
            
            $taxes = $this->calculateTax($vendor, $subtotal);
            // @TODO: handle coupon in case of multiple vendor
            // @TODO: handle coupon in case of guest user
            $discount = $this->calculateDiscount($vendor, $subtotal);
            $total = ($subtotal + $taxes + $deliveryFee) - $discount;

            // prepare order data
            $orderData = [
                'notes' => $this->data['notes'] ?? null,
                'subtotal' => $subtotal,
                'taxes' => $taxes,
                'delivery_fee' => $deliveryFee,
                'discount' => $discount,
                'total' => $total,
                'vendor_id' => $vendor->id,
                'delivery_mode_id' => $delivery_mode_id,
                'meta' => !empty($this->data['meta']) ? json_decode($this->data['meta']) : null,
                'order_type' => $this->orderType(),
                'type' => isset($this->data['type']) ? $this->data['type'] : 'ASAP',
                'scheduled_on' => isset($this->data['type']) && $this->data['type'] == 'LATER' ? $this->data['scheduled_on'] :  Carbon::now()
            ];

            // check if order is created by guest user
            if (!empty($this->data['is_guest'])) {
                $orderData = array_merge($orderData, [
                    'is_guest' => true,
                    'customer_name' => $this->data['customer_name'],
                    'customer_mobile' => $this->data['customer_mobile'],
                    'customer_email' => $this->data['customer_email'] ?? null,
                ]);
            } else {
                $orderData = array_merge($orderData, ['user_id' => $this->user->id]);
            }

            // create an order instance
            $order = Order::create($orderData);

            $this->saveOrderAddress($order);
            $this->saveOrderProducts($order, $vendorOrderItems['products']);

            // payment
            $this->makePayment($order, $total, $this->data['payment_method_slug']);

            array_push($orders, $order->id);
        }

        return $orders;
    }

    public function createCustomOrder(): array
    {
        $orders = [];

        $delivery_mode_id = null;

        if (isset($this->data['delivery_mode_id'])) {
            $delivery_mode_id = $this->data['delivery_mode_id'];
        }

        $subtotal = 0;
        $deliveryFee = CheckoutService::calculateDeliveryFee(null, $delivery_mode_id);
        $taxes = $this->calculateTax(null, $subtotal);
        // @TODO: handle coupon in case of multiple vendor
        $discount = $this->calculateDiscount(null, $subtotal);
        $total = ($subtotal + $taxes + $deliveryFee) - $discount;

        // create an order instance
        $order = Order::create([
            'notes' => $this->data['notes'] ?? null,
            'subtotal' => $subtotal,
            'taxes' => $taxes,
            'delivery_fee' => $deliveryFee,
            'discount' => $discount,
            'total' => $total,
            'user_id' => $this->user->id,
            'vendor_id' => $this->data['vendor_id'] ?? null,
            'delivery_mode_id' => $this->data['delivery_mode_id'] ?? null,
            'meta' => !empty($this->data['meta']) ? json_decode($this->data['meta']) : null,
            'order_type' => $this->orderType(),
            'type' => isset($this->data['type']) ? $this->data['type'] : 'ASAP',
            'scheduled_on' => isset($this->data['type']) && $this->data['type'] == 'LATER' ? $this->data['scheduled_on'] :  Carbon::now()
        ]);

        $this->saveCustomOrderAddress($order);

        // payment
        $this->makePayment($order, $total, $this->data['payment_method_slug']);

        array_push($orders, $order->id);


        return $orders;
    }

    private function makePayment($order, $total, $paymentMethodSlug)
    {
        $paymentMethod = PaymentMethod::where('slug', $paymentMethodSlug)->first();

        // if current is being placed on behalf of customer then use customer for makePayment,
        // otherwise use authenticated user
        if (!empty($order->is_guest)) {
            //retrive customer
            $customer = Customer::findByMobile($order->customer_mobile)->findByVendor($order->vendor_id)->first();
            $payment = $customer->createPayment($order, $total, $paymentMethodSlug);
        } else {
            $payment = $order->user->createPayment($order, $total, $paymentMethodSlug);
        }

        if ($paymentMethod->type == 'postpaid') {
            event(new NewOrder($order->fresh()));
        }
    }

    public function createMultiOrderPayment($orderIds): Payment
    {
        $paymentMethodSlug = $this->data['payment_method_slug'];
        $paymentMethod = PaymentMethod::where('slug', $paymentMethodSlug)->first();

        $total = 0;

        for ($i = 0; $i < count($orderIds); $i++) {
            $order = Order::find($orderIds[$i]);
            $total += $order['total'];
        }

        $multiOrderPayment = MultiOrderPayment::create(['total' => $total]);

        $multiOrderPayment->orders()->sync($orderIds);

        $payment = $this->user->createPayment($multiOrderPayment, $total, $paymentMethodSlug);

        return $payment;
    }

    private function groupProductsByVendor(): array
    {
        $vendors = [];
        $products = $this->data['products'];

        foreach ($products as $productItem) {
            $product = VendorProduct::find($productItem['id']);

            // check if vendor already in array, if not create an empty array for vendor
            $vendors[$product->vendor_id] = isset($vendors[$product->vendor_id])
                ? $vendors[$product->vendor_id]
                : ['subtotal' => 0, 'products' => []];

            $productPrice = $product->sale_price ? $product->sale_price : $product->price;
            $productTotal = $productItem['quantity'] * $productPrice;

            // handle menu item choices
            $orderProductAddons = [];
            if (array_key_exists('addons', $productItem)) {
                foreach ($productItem['addons'] as $addon) {
                    $addonChoice = AddonChoice::find($addon['choice_id']);
                    $productTotal += $addonChoice->price * $productItem['quantity']; // add the price of add-on(item choice) in product's total price

                    array_push($orderProductAddons, [
                        'product_addon_choice_id' => $addonChoice->id,
                        'total' => $addonChoice->price * $productItem['quantity']
                    ]);
                }
            }

            $vendors[$product->vendor_id]['subtotal'] = $vendors[$product->vendor_id]['subtotal'] + $productTotal;
            array_push($vendors[$product->vendor_id]['products'], [
                'vendor_product_id' => $productItem['id'],
                'quantity' => $productItem['quantity'],
                'total' => $productTotal,
                'addons' => $orderProductAddons
            ]);
        }

        return $vendors;
    }

    public static function calculateDeliveryFee($vendor, $deliveryModeId = null, $locations = null)
    {
        // calculate delivery fee on the basis of DeliveryMode if delivery_mode_id is available
        if ($deliveryModeId) {
            $deliveryMode = DeliveryMode::find($deliveryModeId);
            return $deliveryMode->price;
        }

        // otherwise calculate the fee on the basis of settings
        $settings = CoreHelper::settingsAsDictionary();

        $deliveryFeeSetBy = $settings['delivery_fee_set_by'] ?? 'admin';

        switch ($deliveryFeeSetBy) {
            case 'vendor':
                $deliveryFee = $vendor && $vendor->delivery_fee ? $vendor->delivery_fee : 0;
                break;
            case 'distance':
                if(empty($locations)) {
                    throw new \Exception("Missing locations: cannot compute delivery fee");
                }
                // calculate distance between vendor and user's location to calculate delivery charges
                $sourceLat = $locations['source_lat'];
                $sourceLng = $locations['source_lng'];
                $destLat = $locations['dest_lat'];
                $destLng = $locations['dest_lng'];

                $distances = DB::select(
                    'SELECT ST_Distance_Sphere(Point(:source_lng,:source_lat),Point(:dest_lng,:dest_lat)) as distance',
                    ['source_lng' => $sourceLng, 'source_lat' => $sourceLat, 'dest_lng' => $destLng, 'dest_lat' => $destLat,]
                );
                $distanceInKms = ceil($distances[0]->distance / 1000);
                $baseFee = floatval($settings['delivery_fee_per_km_base_charge']);
                $baseDistance = floatval($settings['delivery_fee_per_km_base_distance']);
                $deliveryChargePerKm = floatval($settings['delivery_fee_per_km_charge']) ? $settings['delivery_fee_per_km_charge'] : 0;
                $deliveryFee = $baseFee + (max($distanceInKms - $baseDistance, 0) * $deliveryChargePerKm);
                break;
            default:
                $deliveryFee = $settings['delivery_fee'] ?? 0;
        }

        return $deliveryFee;
    }

    private function calculateTax($vendor, $amount)
    {
        $tax = $this->settings['tax_in_percent'] ?? 0;
        return ($amount * $tax) / 100;
    }

    private function calculateDiscount($vendor, $amount)
    {
        $discount = 0;

        if (!isset($this->data['coupon_code'])) {
            return 0;
        }

        try {
            $coupon = Coupon::getCouponFromCode($this->data['coupon_code'], $this->user);
            if ($coupon !== null) {
                if ($coupon->type == 'fixed') {
                    $discount = $coupon->reward;
                }

                if ($coupon->type == 'percent') {
                    $discount = ($amount * $coupon->reward) / 100;
                }

                $coupon->users()->attach($this->user->id, [
                    'used_at' => Carbon::now(),
                ]);
            }
        } catch (\Exception $ex) {
            //
        }

        return $discount;
    }

    private function saveOrderProducts(Order $order, array $products)
    {
        // save order products
        foreach ($products as $productItem) {
            $orderProduct = OrderProduct::create([
                'total' => $productItem['total'],
                'quantity' => $productItem['quantity'],
                'vendor_product_id' => $productItem['vendor_product_id'],
                'order_id' => $order->id
            ]);

            // update product's sells count
            Product::updateSellsCount($productItem['vendor_product_id'], $productItem['quantity']);

            foreach ($productItem['addons'] as $addOn) {
                // save order product addons
                OrderProductAddon::create([
                    'total' => $addOn['total'],
                    'product_addon_choice_id' => $addOn['product_addon_choice_id'],
                    'order_product_id' => $orderProduct->id
                ]);
            }
        }
    }

    private function saveOrderAddress(Order $order)
    {
        if (!$order->is_guest) {
            $selectedAddress = Address::find($this->data['address_id']);
            OrderAddress::create([
                'order_id' => $order->id,
                'formatted_address' => $selectedAddress->formatted_address,
                'longitude' => $selectedAddress->longitude,
                'latitude' => $selectedAddress->latitude,
            ]);
        }
    }

    private function saveCustomOrderAddress(Order $order)
    {
        // save source address
        OrderAddress::create([
            'order_id' => $order->id,
            'formatted_address' => $this->data['source_formatted_address'],
            'address1' => isset($this->data['source_address_1']) ? $this->data['source_address_1'] : null,
            'address2' => isset($this->data['source_address_2']) ? $this->data['source_address_2'] : null,
            'longitude' => $this->data['source_longitude'],
            'latitude' => $this->data['source_latitude'],
            'type' => 'source',
            'name' => $this->data['source_contact_name'] ?? null,
            'mobile' => $this->data['source_contact_number'] ?? null,
        ]);

        // save destination address
        OrderAddress::create([
            'order_id' => $order->id,
            'formatted_address' => $this->data['destination_formatted_address'],
            'address1' => isset($this->data['destination_address_2']) ? $this->data['destination_address_1'] : null,
            'address2' => isset($this->data['destination_address_2']) ? $this->data['destination_address_2'] : null,
            'longitude' => $this->data['destination_longitude'],
            'latitude' => $this->data['destination_latitude'],
            'name' => $this->data['destination_contact_name'] ?? null,
            'mobile' => $this->data['destination_contact_number'] ?? null,
        ]);
    }
}
