<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Session;

class AuthController
{
    public function showRegisterForm()
    {
        return view('auth.register');
    }
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
            'address' => 'required',
            'phone' => 'required',
            'dob' => 'required|date',
            'gender' => 'required|in:male,female,other',
        ], [
            'email.unique' => 'Email already exists',
            'dob.required' => 'Date of birth is required',
            'gender.in' => 'Gender must be Male or Female or Other',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'address' => $request->address,
            'phone' => $request->phone,
            'dob' => $request->dob,
            'gender' => $request->gender,
        ]);

        $user->assignRole('user');
        
        // DB::table('model_has_roles')->insert([
        //     'role_id' => 3,
        //     'model_type' => User::class,
        //     'model_id' => $user->id
        // ]);

        return redirect('/login')->with('success', 'Register successfully!');
    }
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $remember = $request->filled('remember');

        if (Auth::attempt($credentials, $remember)) {
            $request->session()->regenerate();

            $user = Auth::user();

            $user->last_login = now();
            $user->save();

            $hasAccess = $user->roles()->whereIn('name', ['admin', 'staff'])->exists();

            if ($hasAccess) {
                return redirect()->intended('/admin');
            } else {
                return redirect()->intended('/');
            }
        }

        return back()->withErrors([
            'email' => 'Incorrect login information.',
            'password' => 'Password is not correct.',
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/login');
    }
}
