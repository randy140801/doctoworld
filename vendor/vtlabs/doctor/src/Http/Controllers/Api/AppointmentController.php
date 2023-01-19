<?php

namespace Vtlabs\Doctor\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Filters\AppointmentFilter;
use Vtlabs\Doctor\Events\NewAppointment;
use Vtlabs\Appointment\Services\AppointmentService;
use Vtlabs\Doctor\Events\UpdateAppointment;
use Vtlabs\Doctor\Http\Resources\AppointmentResource;

class AppointmentController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'appointer' => 'required_without:appointee|exists:users,id',
            'appointee' => 'required_without:appointer|exists:doctor_profiles,id'
        ]);

        $appointments = Appointment::filter($request->all(), AppointmentFilter::class)->orderBy('date', 'desc');

        return AppointmentResource::collection($appointments->paginate());
    }

    public function store(DoctorProfile $doctorProfile, Request $request)
    {
        $user = Auth::user();

        $request->validate(AppointmentService::validationRules());

        $appointment = $user->appoint($doctorProfile, $request->all());

        event(new NewAppointment($appointment));

        return new AppointmentResource($appointment);
    }

    public function update(Appointment $appointment, Request $request)
    {
        $request->validate([
            'status' => ['required', Rule::in(config('vtlabs_appointment.appointment.status_list'))]
        ]);

        AppointmentService::updateStatus($appointment, $request->status);

        event(new UpdateAppointment($appointment));

        return new AppointmentResource($appointment->fresh());
    }
}