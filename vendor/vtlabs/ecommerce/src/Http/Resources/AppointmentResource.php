<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Vtlabs\Core\Models\User\User;
use Vtlabs\Ecommerce\Models\Vendor;
use Vtlabs\Core\Http\Resources\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Payment\Http\Resources\PaymentResource;
use Vtlabs\Ecommerce\Http\Resources\VendorResource;

class AppointmentResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'meta' => $this->meta,
            'amount' => $this->amount,
            'amount_meta' => $this->amount_meta,
            'address' => $this->address,
            'address_meta' => $this->address_meta,
            'longitude' => $this->longitude,
            'latitude' => $this->latitude,
            'date' => $this->date,
            'time_from' => $this->time_from,
            'time_to' => $this->time_to,
            'status' => $this->status,
            'is_guest' => $this->is_guest,
            'customer_name' => $this->customer_name,
            'customer_email' => $this->customer_email,
            'customer_mobile' => $this->customer_mobile,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'user' => new UserResource(User::find($this->appointer_id)),
            'vendor' => new VendorResource(Vendor::find($this->appointee_id)),
            'payment' => new PaymentResource($this->payment)
        ];
    }
}