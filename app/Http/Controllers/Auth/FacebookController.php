<?php

namespace App\Http\Controllers\auth;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Str;

class FacebookController
{
    public function redirectToFacebook()
    {
        return Socialite::driver('facebook')->redirect();
    }
    public function handleFacebookCallback()
    {
        try {
            $fbUser = Socialite::driver('facebook')->fields([
                'name',
                'email'
            ])->user();

            $user = User::firstOrCreate(
                ['email' => $fbUser->getEmail()],
                [
                    'name' => $fbUser->getName(),
                    'password' => null,
                    'provider' => 'facebook',
                    'provider_id' => $fbUser->getId(),
                    'email_verified_at' => now(),
                    'avatar' => $fbUser->getAvatar(),
                ]
            );
            
            if (!$user->provider || !$user->provider_id) {
                $user->update([
                    'provider' => 'facebook',
                    'provider_id' => $fbUser->getId(),
                ]);
            }

            Auth::login($user);

            $user->last_login = now();
            $user->save();

            $user->assignRole('user');
            $hasAccess = $user->roles()->whereIn('name', ['admin', 'staff'])->exists();

            if ($hasAccess) {
                return redirect('/admin');
            } else {
                return redirect('/');
            }            

        } catch (\Exception $e) {
            return redirect()->route('login')->with('error', 'Đăng nhập Facebook thất bại: ' . $e->getMessage());
        }
    }
}
