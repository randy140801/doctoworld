<?php

namespace Vtlabs\Core\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Core\Models\User\User;
use Vtlabs\Core\Filters\UserFilter;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Core\Models\Notification;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Core\Http\Resources\BlockResource;
use Vtlabs\Core\Http\Resources\NotificationResource;

/**
 * @group  User Management
 *
 * APIs for user management
 */
class UserController extends Controller
{
    private $userModel;
    private $userResource;

    public function __construct()
    {
        $this->userModel = config('auth.models.user');
        $this->userResource = config('auth.resources.user');

        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            $this->middleware('auth:api');
        }
    }

    public function index(Request $request)
    {
        $request->validate([
            'search' => 'sometimes'
        ]);

        $users = $this->userModel::filter($request->all(), UserFilter::class);

        return $this->userResource::collection($users->paginate());
    }

    public function show()
    {
        return new $this->userResource(Auth::user());
    }

    public function showUserById(User $user)
    {
        return new $this->userResource($user);
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'sometimes',
            'username' => 'sometimes',
            'image_url' => 'sometimes|nullable|url',
            'notification' => 'sometimes|json|nullable',
            'language' => 'sometimes|string',
            'meta' => 'sometimes|json',
            'categories' => 'sometimes|array|exists:categories,id',
            'balance' => 'sometimes|numeric'
        ]);

        $user = Auth::user();

        if ($request->name) {
            $user->name = $request->name;
        }

        if ($request->username) {
            $user->username = $request->username;
        }

        if ($request->notification) {
            $user->notification = json_decode($request->notification);
        }

        if ($request->language) {
            $user->language = $request->language;
        }

        if ($request->image_url) {
            $newMediaItems = [];
            $newMediaItems[] = $user->addMediaFromUrl($request->image_url)->toMediaCollection('images');
            $user->clearMediaCollectionExcept('images', $newMediaItems);
        }

        if ($request->meta) {
            $user->meta = json_decode($request->meta);
        }

        $user->save();

        if ($request->categories) {
            $user->categories()->sync($request->categories);
        }

        // update user wallet
        if ($request->balance) {
            if ($request->balance > $user->balance) {
                // if new balance is greater, deposit amount in user wallet
                $user->deposit($request->balance - $user->balance);
            } else if ($request->balance < $user->balance) {
                // if new balance is lesser, withdraw amount from user wallet
                $user->withdraw($user->balance - $request->balance);
            }
        }

        return new $this->userResource($user->fresh());
    }

    public function newChatNotification(Request $request)
    {
        $request->validate([
            "role" => "required|role",
            "user_id" => "required|exists:users,id"
        ]);

        $notifyingUser = Auth::user();
        $notifiedUser = $this->userModel::find($request->user_id);

        $notifiedUser->sendPushNotification(
            $request->role,
            __('vtlabs_core::messages.notification_chat_new_message_title'),
            __('vtlabs_core::messages.notification_chat_new_message_body')
        );

        return response()->json((object)[], 200);
    }

    public function notifications(Request $request)
    {
        $request->validate([
            'type' => 'sometimes'
        ]);

        $notifications = Notification::where('user_id', Auth::id())->orderByDesc('created_at');

        if ($request->type) {
            $notifications = $notifications->where('type', $request->type);
        }

        return NotificationResource::collection($notifications->paginate());
    }

    public function report(User $user, Request $request)
    {
        $request->validate([
            'reason' => 'sometimes'
        ]);

        $reporter = User::find(Auth::id());

        $user->report($reporter, ['reason' => $request->reason]);

        return response([], 200);
    }

    public function block(User $user, Request $request)
    {
        $request->validate([
            'reason' => 'sometimes'
        ]);

        $blocker = User::find(Auth::id());
        $blocked = false;

        if (Auth::id() != $user->id) {
            if ($blocker->hasBlocked($user)) {
                // unblock user if already blocked
                $blocker->unblock($user);
            } else {
                $blocked = true;
                $blocker->block($user, ['reason' => $request->reason]);
            }
        }

        return response(["block" => $blocked], 200);
    }

    public function blockList(Request $request)
    {
        return BlockResource::collection(Auth::user()->blockedList(User::class)->paginate());
    }
}
