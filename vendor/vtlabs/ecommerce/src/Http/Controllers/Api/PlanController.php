<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Support\Facades\Auth;
use Rennokki\Plans\Models\PlanModel;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Payment\Http\Resources\PaymentResource;

/**
 * @group  Media
 *
 * APIs for subscription plans
 */
class PlanController extends Controller
{
    public function index()
    {
        return response()->json(PlanModel::with('features')->get());
    }

    public function purchasePlan(Vendor $vendor, PlanModel $plan, Request $request)
    {
        $request->validate([
            'payment_method_slug' => 'required|exists:payment_methods,slug'
        ]);

        // payment
        $payment = $vendor->user->createPayment($plan, $plan->price, $request->payment_method_slug);

        return new PaymentResource($payment);
    }
}
