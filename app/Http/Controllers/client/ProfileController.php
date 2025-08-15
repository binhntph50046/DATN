<?php

namespace App\Http\Controllers\client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Address;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class ProfileController
{
    public function index()
    {
        return view('client.profile.index');
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'address' => 'required|string|max:255',
            'dob' => 'nullable|date',
            'gender' => 'required|in:male,female,other',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048'
        ]);

        // Handle avatar upload
        if ($request->hasFile('avatar')) {
            // Delete old avatar if exists
            if ($user->avatar && file_exists(public_path($user->avatar))) {
                unlink(public_path($user->avatar));
            }

            $avatar = $request->file('avatar');
            $avatarName = time() . '.' . $avatar->getClientOriginalExtension();

            // Create directory if it doesn't exist
            $uploadPath = 'uploads/avatar';
            if (!file_exists(public_path($uploadPath))) {
                mkdir(public_path($uploadPath), 0777, true);
            }

            // Move uploaded file
            $avatar->move(public_path($uploadPath), $avatarName);
            $validated['avatar'] = '/' . $uploadPath . '/' . $avatarName;
        }

        // Convert dob string to Carbon instance
        if ($request->dob) {
            $validated['dob'] = Carbon::parse($request->dob);
        }

        $user->update($validated);

        return redirect()->route('profile.index')->with('success', 'Thông tin cá nhân đã được cập nhật thành công!');
    }

    public function password()
    {
        return view('client.profile.password');
    }

    public function updatePassword(Request $request)
    {
        $user = auth()->user();

        // Kiểm tra xem user hiện tại có mật khẩu chưa
        $hasPassword = !is_null($user->password);

        // Validation tùy theo việc user có password hay không
        $rules = [
            'password' => ['required', 'string', 'min:8'],
            'password_confirmation' => ['required', 'same:password'],
        ];

        if ($hasPassword) {
            $rules['current_password'] = ['required', 'current_password'];
        }

        $request->validate($rules, [
            'password.required' => 'Vui lòng nhập mật khẩu mới.',
            'password.min' => 'Mật khẩu phải có ít nhất 8 ký tự.',
            'password_confirmation.required' => 'Vui lòng nhập xác nhận mật khẩu mới.',
            'password_confirmation.same' => 'Xác nhận mật khẩu không khớp.',
            'current_password.required' => 'Vui lòng nhập mật khẩu hiện tại.',
            'current_password.current_password' => 'Mật khẩu hiện tại không đúng.',
        ]);

        $user->update([
            'password' => Hash::make($request->password),
        ]);

        return back()->with('success', 'Mật khẩu đã được cập nhật thành công.');
    }



    public function orders()
    {
        $orders = Order::where('user_id', auth()->id())
            ->orderBy('created_at', 'desc')
            ->paginate(10);
        return view('client.profile.orders', compact('orders'));
    }
}
