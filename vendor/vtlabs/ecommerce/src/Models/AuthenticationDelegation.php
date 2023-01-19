<?php

namespace Vtlabs\Ecommerce\Models;

use Illuminate\Database\Eloquent\Model;

class AuthenticationDelegation extends Model
{
    protected $table = 'ecommerce_authentication_delegations';

    protected $guarded = [];

    public function vendor()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.vendor'));
    }
}
