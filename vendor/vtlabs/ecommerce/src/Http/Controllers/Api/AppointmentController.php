<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Filters\AppointmentFilter;
use Vtlabs\Appointment\Services\AppointmentService;
use Vtlabs\Ecommerce\Http\Resources\AppointmentResource;
use Illuminate\Validation\Rule;

class AppointmentController extends Controller
{
    public function __construct()
    {
        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            $this->middleware('auth:api');
        }
    }
    
    public function index(Request $request)
    {
        $request->validate([
            'appointer' => 'sometimes|exists:users,id',
            'appointee' => 'sometimes|exists:ecommerce_vendors,id',
        ]);

        $appointments = Appointment::filter($request->all(), AppointmentFilter::class)->orderBy('date', 'desc');
        return AppointmentResource::collection($appointments->paginate());
    }

    public function store(Request $request)
    {
        $request->validate(
            array_merge(
                AppointmentService::validationRules(),
                ['vendor_id' => 'required|exists:ecommerce_vendors,id']
            )
        );

        $vendor = Vendor::find($request->vendor_id);

        if (Auth::check() && !$request->is_guest) {
            $user = Auth::user();
            $appointment = $user->appoint($vendor, $request->all());
        } else {
            $appointment = Appointment::create([
                'appointee_id' => $vendor->id,
                'appointee_type' => get_class($vendor),
                'amount' => $request->amount,
                'address' => $request->address ?? null,
                'longitude' => $request->longitude ?? 0.0,
                'latitude' => $request->latitude ?? 0.0,
                'date' => $request->date,
                'time_from' => $request->time_from,
                'time_to' => $request->time_to,
                'meta' => isset($request->meta) ? json_decode($request->meta) : null,
                'is_guest' => $request->is_guest,
                'customer_mobile' => $request->customer_mobile,
                'customer_name' => $request->customer_name,
                'customer_email' => $request->customer_email,
            ]);
        }

        //event(new NewAppointment($appointment));

        return new AppointmentResource($appointment);
    }

    public function update(Appointment $appointment, Request $request)
    {
        $request->validate([
            'status' => ['required', Rule::in(config('vtlabs_appointment.appointment.status_list'))]
        ]);

        AppointmentService::updateStatus($appointment, $request->status);

        // event(new UpdateAppointment($appointment));

        return new AppointmentResource($appointment->fresh());
    }
}
