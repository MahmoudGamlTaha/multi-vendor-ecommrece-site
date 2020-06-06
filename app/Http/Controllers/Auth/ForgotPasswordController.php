<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\GeneralController as GeneralController;
use Auth;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
     */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');

    }

    /**
     * [login description]
     * @return [type] [description]
     */
    public function showLinkRequestForm()
    {
        if (Auth::user()) {
            return redirect()->route('home');
        }
        return view((new GeneralController)->theme . '.shop_forgot',
            array(
                'title' => trans('language.for_got_password'),
            )
        );
    }
}
