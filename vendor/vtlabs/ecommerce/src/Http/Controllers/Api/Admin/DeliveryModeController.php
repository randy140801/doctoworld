<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Vtlabs\Ecommerce\Models\DeliveryMode;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Ecommerce\Filters\DeliveryModeFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Http\Resources\Admin\DeliveryModeAdminResource;

class DeliveryModeController extends Controller
{
    public function index(Request $request)
    {
        $deliverymodes = DeliveryMode::filter($request->all(), DeliveryModeFilter::class);

        return DeliveryModeAdminResource::collection($deliverymodes->paginate());
    }

    public function store(Request $request)
    {
        $request->validate([
            'title_translations' => 'required|translation',
            'detail_translations' => 'required|translation',
            'meta' => 'sometimes|json|nullable',
            'price' => 'required|numeric',
        ]);

        request()->merge([
            "title" => request()->input('_title'),
            "detail" => request()->input('_detail')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $deliverymode = DeliveryMode::create($request->only(['title', 'detail', 'meta', 'price', 'enabled']));

        return new DeliveryModeAdminResource($deliverymode->fresh());
    }

    public function show($id)
    {
        return new DeliveryModeAdminResource(DeliveryMode::find($id));
    }

    public function update(Request $request, $id)
    {
        $deliverymode = DeliveryMode::findOrFail($id);

        $request->validate([
            'title_translations' => 'required|translation',
            'detail_translations' => 'required|translation',
            'meta' => 'sometimes|json|nullable',
            'price' => 'required|numeric'
        ]);

        request()->merge([
            "title" => request()->input('_title'),
            "detail" => request()->input('_detail')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $deliverymode->fill($request->only(['title', 'detail', 'meta', 'price', 'enabled']));
        $deliverymode->save();

        return new DeliveryModeAdminResource($deliverymode->fresh());
    }

    public function destroy($id)
    {
        Gate::authorize('delete');

        DeliveryMode::findOrFail($id)->delete();

        return response()->json([], 200);
    }
}
