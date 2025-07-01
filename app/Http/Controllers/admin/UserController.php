<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;

class UserController
{
    public function index(Request $request)
    {
        $roles = Role::all()->pluck('name')->toArray(); // Lấy danh sách tên vai trò: ['admin', 'staff', 'user']
        $query = User::query();

        // Không hiển thị tài khoản admin hiện tại
        $query->where('id', '!=', Auth::id());

        // Nếu là staff, chỉ thấy tài khoản có vai trò user
        /** @var \App\Models\User $currentUser */
        $currentUser = Auth::user();
        if ($currentUser && $currentUser->hasRole('staff')) {
            $query->whereHas('roles', function ($q) {
                $q->where('name', 'user');
            });
        }

        // Lọc theo tìm kiếm
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', "%{$request->search}%")
                    ->orWhere('email', 'like', "%{$request->search}%");
            });
        }

        // Lọc theo vai trò
        if ($request->filled('role')) {
            $query->whereHas('roles', function ($q) use ($request) {
                $q->where('name', $request->role);
            });
        }

        // Lọc theo trạng thái
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $users = $query->latest()->paginate(10)->withQueryString();
        return view('admin.users.index', compact('users', 'roles'));
    }

    public function create()
    {
        return view('admin.users.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'phone' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'dob' => 'required|date',
            'gender' => 'nullable|string|max:255|in:male,female,other',
            'status' => 'required|string|max:255|in:active,inactive',
        ], [
            'name.required' => 'Tên người dùng là bắt buộc.',
            'name.max' => 'Tên người dùng không được vượt quá 255 ký tự.',
            'email.required' => 'Email là bắt buộc.',
            'email.email' => 'Vui lòng nhập địa chỉ email hợp lệ.',
            'email.unique' => 'Email này đã được sử dụng.',
            'password.required' => 'Mật khẩu là bắt buộc.',
            'password.min' => 'Mật khẩu phải có ít nhất 8 ký tự.',
            'password.confirmed' => 'Xác nhận mật khẩu không khớp.',
            'status.required' => 'Trạng thái tài khoản là bắt buộc.',
            'status.in' => 'Trạng thái tài khoản không hợp lệ.',
            'avatar.image' => 'Avatar phải là hình ảnh.',
            'avatar.mimes' => 'Avatar phải là file loại: jpeg, png, jpg, gif.',
            'avatar.max' => 'Kích thước avatar không được vượt quá 2MB.',
            'address.required' => 'Địa chỉ là bắt buộc.',
            'address.max' => 'Địa chỉ không được vượt quá 255 ký tự.',
            'phone.required' => 'Số điện thoại là bắt buộc.',
            'dob.required' => 'Ngày sinh là bắt buộc.',
            'dob.date' => 'Vui lòng nhập ngày sinh hợp lệ.',
        ]);

        $validated['password'] = bcrypt($request->password);
        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar');
            $avatarName = time() . '.' . $avatar->getClientOriginalExtension();
            $destinationPath = public_path('uploads/users');
            $avatar->move($destinationPath, $avatarName);
            $validated['avatar'] = 'uploads/users/' . $avatarName;
        }

        $user = User::create($validated);
        $user->assignRole('user'); // Gán role mặc định là 'user'

        return redirect()->route('admin.users.index')->with('success', 'Tạo tài khoản thành công');
    }

    public function show(string $id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.show', compact('user'));
    }

    public function edit(string $id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.edit', compact('user'));
    }

    public function update(Request $request, string $id)
    {
        $user = User::findOrFail($id);

        // Lấy dữ liệu ban đầu từ $user
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique('users')->ignore($user->id),
            ],
            'password' => 'nullable|string|min:8|confirmed',
            'phone' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'dob' => 'nullable|date', // Không bắt buộc, chỉ validate nếu có
            'gender' => 'nullable|string|max:255|in:male,female,other',
            'status' => 'required|string|max:255|in:active,inactive',
        ], [
            'name.required' => 'Tên người dùng là bắt buộc.',
            'name.max' => 'Tên người dùng không được vượt quá 255 ký tự.',
            'email.required' => 'Email là bắt buộc.',
            'email.email' => 'Vui lòng nhập địa chỉ email hợp lệ.',
            'email.unique' => 'Email này đã được sử dụng.',
            'password.min' => 'Mật khẩu phải có ít nhất 8 ký tự.',
            'password.confirmed' => 'Xác nhận mật khẩu không khớp.',
            'status.required' => 'Trạng thái tài khoản là bắt buộc.',
            'status.in' => 'Trạng thái tài khoản không hợp lệ.',
            'avatar.image' => 'Avatar phải là hình ảnh.',
            'avatar.mimes' => 'Avatar phải là file loại: jpeg, png, jpg, gif.',
            'avatar.max' => 'Kích thước avatar không được vượt quá 2MB.',
            'address.required' => 'Địa chỉ là bắt buộc.',
            'address.max' => 'Địa chỉ không được vượt quá 255 ký tự.',
            'phone.required' => 'Số điện thoại là bắt buộc.',
            'dob.date' => 'Vui lòng nhập ngày sinh hợp lệ.',
        ]);

        // Kiểm tra và giữ nguyên giá trị ban đầu nếu không có dữ liệu mới
        $dataToUpdate = [
            'name' => $request->filled('name') ? $validated['name'] : $user->name,
            'email' => $request->filled('email') ? $validated['email'] : $user->email,
            'phone' => $request->filled('phone') ? $validated['phone'] : $user->phone,
            'address' => $request->filled('address') ? $validated['address'] : $user->address,
            'dob' => $request->filled('dob') ? $validated['dob'] : $user->dob,
            'gender' => $request->filled('gender') ? $validated['gender'] : $user->gender,
            'status' => $validated['status'], // Luôn yêu cầu status
        ];

        // Xử lý password
        if ($request->filled('password')) {
            $dataToUpdate['password'] = bcrypt($request->password);
        }

        // Xử lý avatar
        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar');
            $avatarName = time() . '.' . $avatar->getClientOriginalExtension();
            $destinationPath = public_path('uploads/users');
            $avatar->move($destinationPath, $avatarName);
            $dataToUpdate['avatar'] = 'uploads/users/' . $avatarName;
        } else {
            $dataToUpdate['avatar'] = $user->avatar; // Giữ nguyên avatar nếu không thay đổi
        }

        $user->update($dataToUpdate);
        return redirect()->route('admin.users.index')->with('success', 'Cập nhật tài khoản thành công');
    }

    public function trash()
    {
        $users = User::onlyTrashed()->paginate(10);
        return view('admin.users.trash', compact('users'));
    }

    public function restore($id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        $user->restore();
        return redirect()->route('admin.users.index')->with('success', 'Khôi phục tài khoản thành công');
    }

    public function forceDelete($id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        $user->forceDelete();
        return redirect()->route('admin.users.trash')->with('success', 'Xóa vĩnh viễn tài khoản thành công');
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        return redirect()->route('admin.users.index')->with('success', 'Xóa tài khoản thành công');
    }
}
