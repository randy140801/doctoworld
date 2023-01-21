<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderAddressResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'mobile' => $this->mobile,
            'formatted_address' => $this->formatted_address,
            'address1' => $this->address1,
            'address2' => $this->address2,
            'longitude' => $this->longitude,
            'latitude' => $this->latitude,
            'order_id' => $this->order_id
        ];
    }
}