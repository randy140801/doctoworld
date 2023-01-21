<?php

namespace Vtlabs\Ecommerce\Listeners;

use Vtlabs\Ecommerce\Models\Order;
use Vtlabs\Ecommerce\Events\NewOrder;
use Vtlabs\Ecommerce\Services\OrderService;

class NewOrderListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  NewOrder $event
     * @return void
     */
    public function handle(NewOrder $event)
    {
        $order = $event->order;

        $orderService = new OrderService($order);

        // only send delivery request if order is deliverable
        if (in_array($order->order_type, Order::DELIVERABLE_ORDER_TYPES)) {
            if(!$order->vendor) {
                // only send delivery request if this order is non vendor, in case of vendor related order
                // we wait for vendor to accept the order
                $orderService->sendDeliveryRequest();
            }
        }

        $orderService->notifyFirebase();

        if ($order->vendor) {
            $order->vendor->user->sendPushNotification(
                'vendor',
                __('vtlabs_ecommerce::messages.notification_new_order_vendor_title', ['id' => $order->id]),
                __('vtlabs_ecommerce::messages.notification_new_order_vendor_body')
            );
        }
    }
}
