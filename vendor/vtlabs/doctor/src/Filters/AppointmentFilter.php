<?php

namespace Vtlabs\Doctor\Filters;

use EloquentFilter\ModelFilter;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\App;
use Vtlabs\Doctor\Models\DoctorProfile;

class AppointmentFilter extends ModelFilter
{
    public function setup()
    {
        $this->where('appointer_type', User::class)
            ->where('appointee_type', DoctorProfile::class);
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
