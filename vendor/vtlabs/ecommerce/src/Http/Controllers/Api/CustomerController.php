<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Ecommerce\Models\Customer;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Http\Resources\CustomerResource;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'vendor_id' => 'required|exists:ecommerce_vendors,id'
        ]);

        $customeres = Customer::where('vendor_id', $request->vendor_id)->ordered();
        return CustomerResource::collection($customeres->paginate());
    }

    public function store(Request $request)
    {
        $request->validate([
            'customer_mobile' => 'required',
            'customer_name' => 'sometimes',
            'customer_email' => 'sometimes',
            'meta' => 'sometimes|json',
            'vendor_id' => 'sometimes|exists:ecommerce_vendors,id'
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $customer = Customer::create([
            'customer_mobile' => $request->customer_mobile,
            'customer_name' => $request->customer_name,
            'customer_email' => $request->customer_email,
            'vendor_id' => $request->vendor_id,
            'meta' => $request->meta
        ]);

        return new CustomerResource($customer);
    }

    public function update(Customer $customer, Request $request)
    {
        $request->validate([
            'customer_mobile' => 'required',
            'customer_name' => 'sometimes',
            'customer_email' => 'sometimes',
            'meta' => 'sometimes|json',
            'vendor_id' => 'sometimes|exists:ecommerce_vendors,id'
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $customer->fill($request->only(['customer_mobile', 'customer_name', 'customer_email', 'vendor_id', 'meta']));

        $customer->save();

        return new CustomerResource($customer);
    }

    public function destroy(Customer $customer, Request $request)
    {
        $customer->delete();
        return response()->json((object)[]);
    }
}