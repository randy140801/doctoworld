<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Http\Resources\VendorResource;
use Vtlabs\Ecommerce\Models\AuthenticationDelegation;
use Vtlabs\Ecommerce\Http\Resources\AuthenticationDelegationResource;

class AuthenticationDelegationController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'vendor_id' => 'required|exists:ecommerce_vendors,id' 
        ]);

        $authenticationDelegations = AuthenticationDelegation::where('vendor_id', $request->vendor_id)->get();
        return AuthenticationDelegationResource::collection($authenticationDelegations);
    }

    public function storeBulk(Request $request)
    {
        $request->validate([
            'identifiers' => 'required|array',
            'identifiers.*.identifier' => 'required',
            'identifiers.*.type' => 'required',
            'identifiers.*.meta' => 'sometimes|json',
            'vendor_id' => 'required|exists:ecommerce_vendors,id'
        ]);

        // delete previous records first
        AuthenticationDelegation::where('vendor_id', $request->vendor_id)->delete();

        // save records
        foreach ($request->identifiers as $identifier) {
            // identifier must not be registered with any other vendor
            $identifierBelongsToOtherVendor = AuthenticationDelegation::where('identifier', $identifier['identifier'])->where('vendor_id', '<>', $request->vendor_id)->exists();
            if (!$identifierBelongsToOtherVendor) {
                AuthenticationDelegation::create([
                    'identifier' => $identifier['identifier'],
                    'type' => $identifier['type'],
                    'meta' => !empty($identifier['meta']) ? json_decode($identifier['meta']) : null,
                    'vendor_id' => $request->vendor_id
                ]);
            }
        }

        return AuthenticationDelegationResource::collection(AuthenticationDelegation::where('vendor_id', $request->vendor_id)->get());
    }

    public function authenticate(Request $request)
    {
        $request->validate([
            'type' => 'required',
            'identifier' => 'required',
        ]);

        $authenticationDelegation = AuthenticationDelegation::where('identifier', $request->identifier)->where('type', $request->type)->firstOrFail();

        return response()->json([
            'vendor' => new VendorResource($authenticationDelegation->vendor),
            'token' => $authenticationDelegation->vendor->user->createToken('Default')->accessToken
        ]);
    }
}
