<?php

namespace Vtlabs\Ecommerce\Models;

use EloquentFilter\Filterable;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class FeedbackQuestion extends Model
{
    use Filterable,
        HasTranslations;

    protected $table = 'ecommerce_feedback_questions';

    protected $guarded = [];

    protected $casts = [
        'title' => 'json',
        'meta' => 'json',
    ];

    public $translatable = ['title'];

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }
}
