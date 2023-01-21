<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Core\Helpers\CoreHelper;
use Vtlabs\Ecommerce\Models\Coupon;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Ecommerce\Filters\CouponFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Http\Resources\CouponResource;

class CouponController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth')->only(['checkValidity']);
    }

    public function index(Request $request)
    {
        $coupons = Coupon::filter($request->all(), CouponFilter::class);
        return CouponResource::collection($coupons->get());
    }

    public function checkValidity(Request $request)
    {
        $request->validate([
            'code' => 'required'
        ]);

        try {
            $coupon = Coupon::getCouponFromCode($request->code, Auth::user());
            return new CouponResource($coupon);
        } catch (\Exception $ex) {
            return response()->json(['message' => $ex->getMessage()], 400);
        }
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'detail' => 'sometimes',
            'meta' => 'sometimes|json|nullable',
            'code' => 'required',
            'reward' => 'required|numeric',
            'type' => 'required|in:fixed,percent',
            'expires_at' => 'required|date_format:Y-m-d'
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $coupon = new Coupon();

        $coupon->fill($request->only(['meta', 'code', 'reward', 'type', 'expires_at']));

        CoreHelper::fillTranslation($coupon, $request->only(['title', 'detail']));

        $coupon->save();

        return new CouponResource($coupon->fresh());
    }

    public function update(Coupon $coupon, Request $request)
    {
        if (!$this->canBeModified($coupon)) {
            return response()->json((object)[], 400);
        }

        $request->validate([
            'title' => 'required',
            'detail' => 'sometimes',
            'meta' => 'sometimes|json|nullable',
            'code' => 'required',
            'reward' => 'required|numeric',
            'type' => 'required|in:fixed,percent',
            'expires_at' => 'required|date_format:Y-m-d'
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $coupon->fill($request->only(['meta', 'code', 'reward', 'type', 'expires_at']));

        CoreHelper::fillTranslation($coupon, $request->only(['title', 'detail']));

        $coupon->save();

        return new CouponResource($coupon->fresh());
    }

    public function destroy(Coupon $coupon, Request $request)
    {
        if (!$this->canBeModified($coupon)) {
            return response()->json((object)[], 400);
        }

        $coupon->delete();
        return response()->json((object)[]);
    }

    private function canBeModified(Coupon $coupon)
    {
        if(!Auth::check()) return false;
        
        $vendor = Vendor::where('user_id', Auth::id())->first();

        // only allowed to modify coupons created by this vendor
        return (isset($coupon->meta['vendor_id']) && $coupon->meta['vendor_id'] == $vendor->id);
    }
}
