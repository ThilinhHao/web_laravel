<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Providers\RouteServiceProvider;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    protected function authenticated()
    {
        if(Auth::user()->role_as == '1') //1 = Admin Login
        {
            return redirect('dashboard')->with('status','Welcome to your dashboard');
        }
        elseif(Auth::user()->role_as == '0') // Normal or Default User Login
        {
            return redirect('/')->with('status','Logged in successfully');
        }
    }
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    //google login
    public function redirectToGoogle() {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback() {
        $user = Socialite::driver('google')->user();

        $this->_registerOrLoginUser($user);

        // return home after login
        return redirect()->route('home');
    }

    //facebook login
    public function redirectToFacebook() {
        return Socialite::driver('facebook')->redirect();
    }

    public function handleFacebookCallback() {
        $user = Socialite::driver('facebook')->user();

        $this->_registerOrLoginUser($user);

        // return home after login
        return redirect()->route('home');
    }

    protected function _registerOrLoginUser($data) {
        $user = User::where('email', '=', $data->email)->first();

        if (!$user) {
            $user = new User();
            $user->name = $data->name;
            $user->email = $data->email;
            $user->provider_id = $data->id;
            $user->avatar = $data->avatar;
            $user->save();
        }

        Auth::login($user);
    }
}
