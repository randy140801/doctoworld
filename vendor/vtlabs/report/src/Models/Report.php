<?php

namespace Vtlabs\Report\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    use Filterable;

    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $table = 'reports';

    protected $casts = [
        'meta' => 'json'
    ];

    public function reportable()
    {
        return $this->morphTo();
    }

    public function reporter()
    {
        return $this->morphTo();
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at');
    }
}
