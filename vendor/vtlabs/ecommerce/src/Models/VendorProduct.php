<?php

namespace Vtlabs\Ecommerce\Models;

use Carbon\Carbon;
use EloquentFilter\Filterable;
use Illuminate\Support\Facades\DB;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia\HasMedia;

class VendorProduct extends Model
{
    use Filterable;
        
    protected $table = 'ecommerce_vendor_products';

    protected $guarded = [];

    protected $casts = [
        'price' => 'float',
        'sale_price' => 'float',
        'stock_quantity' => 'integer',
        'stock_low_threshold' => 'integer',
        'sells_count' => 'integer'
    ];

    protected $dates = [
        'sale_price_from',
        'sale_price_to'
    ];
    
    // public function getSellsCountAttribute()
    // {
    //     // TODO: calculate sales count
    //     return OrderProduct::where('vendor_product_id', $this->id)->count();
    // }

    public function vendor()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.vendor'));
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public static function salesCountSummary(Vendor $vendor, $duration)
    {
        $created_at = Carbon::now()->subDays(365 * 5);

        switch ($duration) {
            case 'hours':
                $created_at = Carbon::now()->subHours(24);
                break;
            case 'days':
                $created_at = Carbon::now()->subDays(7);
                break;
            case 'months':
                $created_at = Carbon::now()->subDays(30);
                break;
            case 'years':
                $created_at = Carbon::now()->subDays(365);
                break;
        }

        return (int)DB::table('ecommerce_order_products as op')->join('ecommerce_vendor_products as vp', 'op.vendor_product_id', '=', 'vp.id')->join('ecommerce_vendors as v', 'vp.vendor_id', '=', 'v.id')->where('v.id', $vendor->id)->whereDate('op.created_at', '>', $created_at)->whereDate('op.created_at', '<=', Carbon::now())->sum('op.quantity');
    }

    public static function summarizeSalesCount(Vendor $vendor, $duration, $limit)
    {
        $query = DB::table('ecommerce_order_products as op')->join('ecommerce_vendor_products as vp', 'op.vendor_product_id', '=', 'vp.id')->join('ecommerce_vendors as v', 'vp.vendor_id', '=', 'v.id')->where('v.id', $vendor->id);

        if ($duration == 'hours') {
            $query = $query->select(DB::raw('HOUR(op.created_at) as period'), DB::raw('sum(op.quantity) as total'))
                ->whereDate('op.created_at', '>', Carbon::now()->subDays($limit))
                ->whereDate('op.created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('HOUR(op.created_at)'));
        }

        if ($duration == 'days') {
            $query = $query->select(DB::raw('DATE(op.created_at) as period'), DB::raw('sum(op.quantity) as total'))
                ->whereDate('op.created_at', '>', Carbon::now()->subDays($limit))
                ->whereDate('op.created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('DATE(op.created_at)'));
        }

        if ($duration == 'months') {
            $query = $query->select(DB::raw('MONTH(op.created_at) as period'), DB::raw('sum(op.quantity) as total'))
                ->whereDate('op.created_at', '>', Carbon::now()->subDays($limit * 30))
                ->whereDate('op.created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('MONTH(op.created_at)'));
        }

        if ($duration == 'years') {
            $query = $query->select(DB::raw('YEAR(op.created_at) as period'), DB::raw('sum(op.quantity) as total'))
                ->whereDate('op.created_at', '>', Carbon::now()->subDays($limit * 365))
                ->whereDate('op.created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('YEAR(op.created_at)'));
        }

        return $query;
    }
}
