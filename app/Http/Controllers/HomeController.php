<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Vtlabs\Core\Http\Controllers\Controller;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['index']]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (config('app.landing_page')) {
            return view('index');
        }
        return view('welcome');
    }
}
