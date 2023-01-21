<?php

namespace Vtlabs\Ecommerce\Models;

use EloquentFilter\Filterable;
use Spatie\ModelStatus\HasStatuses;
use Vtlabs\Payment\Traits\CanBePaid;
use Vtlabs\Payment\Contracts\Payable;
use Illuminate\Database\Eloquent\Model;
use Vtlabs\Ecommerce\Models\OrderDelivery;

class Order extends Model implements Payable
{
    use CanBePaid, HasStatuses, Filterable;

    public const ORDER_TYPE_CUSTOM = 'CUSTOM';
    public const ORDER_TYPE_NORMAL = 'NORMAL';
    public const ORDER_TYPE_TAKEAWAY = 'TAKEAWAY';
    public const ORDER_TYPE_DINEIN = 'DINEIN';

    // orders which can be delivered
    const DELIVERABLE_ORDER_TYPES = ['CUSTOM', 'NORMAL'];

    const ACTIVE_ORDER_STATUS = ['new', 'pending', 'accepted', 'preparing', 'prepared', 'dispatched'];
    const COMPLETED_ORDER_STATUS = ['complete'];
    const FAILED_ORDER_STATUS = ['rejected', 'refund', 'failed', 'cancelled'];

    protected $table = 'ecommerce_orders';

    protected $guarded = [];

    protected $casts = [
        'meta' => 'array',
        'subtotal' => 'float',
        'taxes' => 'float',
        'delivery_fee' => 'float',
        'total' => 'float',
        'discount' => 'float',
    ];

    public static function boot()
    {
        parent::boot();

        // on create
        static::created(function ($order) {
            $order->setStatus(config('vtlabs_ecommerce.order.status_default'));

            // if this order was created by or using guest customer and we have atleast customer mobile,
            // then save the customer details for future references
            if ($order->is_guest && $order->customer_mobile) {
                $customer = Customer::findByMobile($order->customer_mobile)->findByVendor($order->vendor_id)->exists();

                if (!$customer) {
                    Customer::create([
                        'customer_name' => $order->customer_name,
                        'customer_email' => $order->customer_email,
                        'customer_mobile' => $order->customer_mobile,
                        'vendor_id' => $order->vendor_id
                    ]);
                }
            }
        });
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function isValidStatus(string $name, ?string $reason = null): bool
    {
        return in_array($name, config('vtlabs_ecommerce.order.status_list', []));
    }

    public function address()
    {
        return $this->hasOne(OrderAddress::class)->where('type', 'destination');
    }

    public function sourceAddress()
    {
        return $this->hasOne(OrderAddress::class)->where('type', 'source');
    }

    public function products()
    {
        return $this->hasMany(config('vtlabs_ecommerce.models.order_product'));
    }

    public function vendor()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.vendor'));
    }

    public function delivery()
    {
        return $this->hasOne(OrderDelivery::class);
    }

    public function user()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.user'));
    }

    public function deliveryMode()
    {
        return $this->belongsTo(DeliveryMode::class);
    }

    // public function activeOrderStatus()
    // {
    //     return ['new', 'pending' , '']
    // }
}
