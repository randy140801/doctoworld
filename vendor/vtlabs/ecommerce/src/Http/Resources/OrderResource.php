<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Vtlabs\Core\Http\Resources\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Payment\Http\Resources\PaymentResource;
use Vtlabs\Ecommerce\Http\Resources\DeliveryModeResource;

class OrderResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'notes' => $this->notes,
            'meta' => $this->meta,
            'subtotal' => $this->subtotal,
            'taxes' => $this->taxes,
            'delivery_fee' => $this->delivery_fee,
            'total' => $this->total,
            'discount' => $this->discount,
            'order_type' => $this->order_type,
            'type' => $this->type,
            'is_guest' => $this->is_guest,
            'scheduled_on' => $this->scheduled_on,
            'status' => $this->status,
            'vendor_id' => $this->vendor_id,
            'user_id' => $this->user_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'products' => OrderProductResource::collection($this->products),
            'vendor' => new VendorResource($this->vendor),
            'user' => new UserResource($this->user),
            'address' => new OrderAddressResource($this->address),
            'source_address' => new OrderAddressResource($this->sourceAddress),
            'delivery' => new OrderDeliveryResource($this->delivery),
            'payment' => new PaymentResource($this->payment),
            'delivery_mode' => new DeliveryModeResource($this->deliveryMode),

            // customer
            'customer_name' => $this->customer_name,
            'customer_email' => $this->customer_email,
            'customer_mobile' => $this->customer_mobile,
        ];
    }
}