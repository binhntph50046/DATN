<?php

namespace App\Http\Controllers\auth;

use Illuminate\Support\Str;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class GoogleController
{
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        try {
            $googleUser = Socialite::driver('google')->stateless()->user();

            $user = User::firstOrCreate(
                ['email' => $googleUser->getEmail()],
                [
                    'name' => $googleUser->getName(),
                    'password' => null,
                    'provider' => 'google',
                    'provider_id' => $googleUser->getId(),
                    'email_verified_at' => now(),
                    'avatar' => $googleUser->getAvatar(),
                ]
            );
            if (!$user->provider || !$user->provider_id) {
                $user->update([
                    'provider' => 'google',
                    'provider_id' => $googleUser->getId(),
                ]);
            }
            $user->update([
                'avatar' => $googleUser->getAvatar()
            ]);

            Auth::login($user);

            $user->last_login = now();
            $user->save();

            $user->assignRole('user');
            $hasAccess = $user->roles()->whereIn('name', ['admin', 'staff'])->exists();

            if ($hasAccess) {
                return redirect('/admin');
            } else {
                return redirect('/')->with('success', 'Đăng nhập Google thành công!');
            }            

        } catch (\Exception $e) {
            return redirect()->route('login')->with('error', 'Đăng nhập Google thất bại: ' . $e->getMessage());
        }
    }
}
