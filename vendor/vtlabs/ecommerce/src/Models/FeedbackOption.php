<?php

namespace Vtlabs\Ecommerce\Models;

use EloquentFilter\Filterable;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class FeedbackOption extends Model
{
    use Filterable,
        HasTranslations;

    protected $table = 'ecommerce_feedback_options';

    protected $guarded = [];

    protected $casts = [
        'title' => 'json',
        'rank' => 'integer'
    ];

    public $translatable = ['title'];

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }
}
