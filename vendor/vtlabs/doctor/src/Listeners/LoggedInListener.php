<?php

namespace Vtlabs\Doctor\Listeners;

use Vtlabs\Core\Events\LoggedIn;
use Vtlabs\Core\Events\RoleAssigned;

class LoggedInListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  LoggedIn $event
     * @return void
     */
    public function handle(LoggedIn $event)
    {
        if($event->role == 'doctor') {
            if(!$event->user->hasRole($event->role)) {
                // attach role
                $event->user->assignRole($event->role);
                event(new RoleAssigned($event->user, [$event->role]));
            }
        }

        return true;
    }
}
