<?php

namespace Vtlabs\Report\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;

class Block extends Model
{
    use Filterable;

    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $table = 'blocks';

    protected $casts = [
        'meta' => 'json'
    ];

    public function blockable()
    {
        return $this->morphTo();
    }

    public function blocker()
    {
        return $this->morphTo();
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at');
    }
}
