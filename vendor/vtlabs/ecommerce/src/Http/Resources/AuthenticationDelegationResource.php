<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Ecommerce\Http\Resources\VendorResource;

class AuthenticationDelegationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'identifier' => $this->identifier,
            'type' => $this->type,
            'vendor_id' => $this->vendor_id,
            'vendor' => new VendorResource($this->vendor),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}