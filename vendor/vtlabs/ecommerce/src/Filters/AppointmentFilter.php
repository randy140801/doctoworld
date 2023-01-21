<?php

namespace Vtlabs\Ecommerce\Filters;

use EloquentFilter\ModelFilter;
use Vtlabs\Ecommerce\Models\Vendor;

class AppointmentFilter extends ModelFilter
{
    public function setup()
    {
        $this->where('appointee_type', Vendor::class);
    }

    public function appointer($id)
    {
        return $this->where('appointer_id', $id);
    }

    public function appointee($id)
    {
        return $this->where('appointee_id', $id);
    }
}
