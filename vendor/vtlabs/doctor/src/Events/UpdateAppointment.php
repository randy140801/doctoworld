<?php

namespace Vtlabs\Doctor\Events;

use Illuminate\Queue\SerializesModels;
use Vtlabs\Appointment\Models\Appointment;
use Illuminate\Foundation\Events\Dispatchable;

class UpdateAppointment
{
    use Dispatchable, SerializesModels;

    public $appointment;

    public $statusUpdate;

    /**
     * Create a new event instance.
     */
    public function __construct(Appointment $appointment)
    {
        $this->appointment = $appointment;
    }
}