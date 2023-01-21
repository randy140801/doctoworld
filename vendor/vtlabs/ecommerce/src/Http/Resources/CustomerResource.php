<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Ecommerce\Http\Resources\VendorResource;

class CustomerResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'customer_name' => $this->customer_name,
            'customer_email' => $this->customer_email,
            'customer_mobile' => $this->customer_mobile,
            'meta' => $this->meta,
            'vendor_id' => $this->vendor_id,
            'vendor' => new VendorResource($this->vendor),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}