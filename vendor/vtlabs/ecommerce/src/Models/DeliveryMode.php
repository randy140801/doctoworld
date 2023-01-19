<?php

namespace Vtlabs\Ecommerce\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class DeliveryMode extends Model
{
    use Filterable, HasTranslations;

    /**
     * {@inheritdoc}
     */
    protected $table = 'ecommerce_delivery_modes';

    /**
     * {@inheritdoc}
     */
    protected $guarded = [];

    /**
     * {@inheritdoc}
     */
    protected $casts = [
        'title' => 'json',
        'detail' => 'json',
        'meta' => 'json',
        'price' => 'float',
        'enabled' => 'integer'
    ];
    
    public $translatable = ['title', 'detail'];
}
