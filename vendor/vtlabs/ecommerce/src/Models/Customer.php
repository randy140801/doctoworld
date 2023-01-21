<?php

namespace Vtlabs\Ecommerce\Models;

use EloquentFilter\Filterable;
use Vtlabs\Payment\Traits\CanPay;
use Vtlabs\Payment\Contracts\Payer;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model implements Payer
{
    use Filterable, CanPay;
    
    protected $table = 'ecommerce_customers';

    protected $guarded = [];

    protected $casts = [
        'meta' => 'array'
    ];

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function scopeFindByMobile($query, $mobile) 
    {
        return $query->where('customer_mobile', $mobile);
    }

    public function scopeFindByVendor($query, $vendor) 
    {
        return $query->where('vendor_id', $vendor);
    }

    public function vendor()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.vendor'));
    }
}
