<?php

namespace Vtlabs\Ecommerce\Listeners;

use Vtlabs\Core\Models\User\User;
use Vtlabs\Ecommerce\Models\Order;
use Vtlabs\Ecommerce\Models\Vendor;
use Rennokki\Plans\Models\PlanModel;
use Vtlabs\Ecommerce\Events\NewOrder;
use Vtlabs\Payment\Events\PaymentUpdated;
use Vtlabs\Ecommerce\Models\MultiOrderPayment;

class PaymentUpdatedListener
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
     * @param  Registered $event
     * @return void
     */
    public function handle(PaymentUpdated $event)
    {
        $payment = $event->payment;

        // we need to process the order according to payment status
        if ($payment->payable_type == 'Vtlabs\Ecommerce\Models\Order') {
            if ($payment->status == 'paid') {
                $order = Order::find($payment->payable_id);
                event(new NewOrder($order->fresh()));
            }

            if ($payment->status == 'failed') {
                $order = Order::find($payment->payable_id);
                $order->setStatus('cancelled');
                $order->save();
            }
        }

        // handle payments for multiple orders
        if ($payment->payable_type == 'Vtlabs\Ecommerce\Models\MultiOrderPayment') {
            // update each order's payment
            $multiOrderPayment = MultiOrderPayment::find($payment->payable_id);
            foreach ($multiOrderPayment->orders as $order) {
                $orderPayment = $order->payment;
                $orderPayment->setStatus($payment->status);
                $orderPayment->save();
            }
        }

        // we need to subscribe plan according to payment status
        if ($payment->payable_type == 'Rennokki\Plans\Models\PlanModel' && $payment->payer_type == User::class) {
            if (Vendor::where('user_id', $payment->payer_id)->exists()) {
                if ($payment->status == 'paid') {
                    $plan = PlanModel::find($payment->payable_id);
                    $vendor = Vendor::where('user_id', $payment->payer_id)->first();
                    if ($vendor->hasActiveSubscription()) {
                        $vendor->cancelCurrentSubscription();
                    }
                    $vendor->subscribeTo($plan, $plan->duration);

                    $vendor->plan_sort_order = $plan->sort_order;

                    $vendor->save();
                }
            }
        }

        return true;
    }
}
