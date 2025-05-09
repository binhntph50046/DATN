<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Validation\Rule;

class UserController
{

    public function index(Request $request)
    {
        $query = User::query();

        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', "%{$request->search}%")
                    ->orWhere('email', 'like', "%{$request->search}%");
            });
        }

        if ($request->filled('role')) {
            $query->where('role', $request->role);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $users = $query->latest()->paginate(10)->withQueryString();
        return view('admin.users.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.users.create');
    }

    /**
     * Store a newly created resource in storage.
     */
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
            'name.required' => 'Username is required.',
            'name.max' => 'Username cannot exceed 255 characters.',
            'email.required' => 'Email is required.',
            'email.email' => 'Please enter a valid email address.',
            'email.unique' => 'This email is already taken.',
            'password.required' => 'Password is required.',
            'password.min' => 'Password must be at least 6 characters.',
            'password.confirmed' => 'Password confirmation does not match.',
            'status.required' => 'Account status is required.',
            'status.in' => 'Invalid account status.',
            'avatar.image' => 'The avatar must be an image.',
            'avatar.mimes' => 'The avatar must be a file of type: jpeg, png, jpg, gif.',
            'avatar.max' => 'The avatar size cannot exceed 2MB.',
            'address.required' => 'Address is required.',
            'address.max' => 'Address cannot exceed 255 characters.',
            'phone_number.required' => 'Phone number is required.',
            'phone_number.regex' => 'Please enter a valid phone number.',
            'dob.required' => 'Date of birth is required.',
            'dob.date' => 'Please enter a valid date of birth.',
            'dob.before' => 'You must be over 18 years old.',
        ]);
        $validated['password'] = bcrypt($request->password);
        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar');
            $avatarName = time() . '.' . $avatar->getClientOriginalExtension();
            $destinationPath = public_path('uploads/users');
            $avatar->move($destinationPath, $avatarName);
            $validated['avatar'] = 'uploads/users/' . $avatarName;
        }

        User::create($validated);
        return redirect()->route('admin.users.index')->with('success', 'User created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $user = User::findOrFail($id);
        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => [
                'sometimes',
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique('users')->ignore($user->id),
            ],
            'password' => 'sometimes|nullable|string|min:8|confirmed',
            'phone' => 'nullable|required|string|max:255',
            'address' => 'nullable|required|string|max:255',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'dob' => 'nullable|date',
            'gender' => 'nullable|string|max:255|in:male,female,other',
            'role' => 'sometimes|required|string|max:255|in:admin,staff,user',
            'status' => 'sometimes|required|string|max:255|in:active,inactive',
        ], [
            'name.required' => 'Username is required.',
            'name.max' => 'Username cannot exceed 255 characters.',
            'email.required' => 'Email is required.',
            'email.email' => 'Please enter a valid email address.',
            'email.unique' => 'This email is already taken.',
            'password.required' => 'Password is required.',
            'password.min' => 'Password must be at least 6 characters.',
            'password.confirmed' => 'Password confirmation does not match.',
            'role.required' => 'Please select a role.',
            'role.in' => 'Invalid role selected.',
            'status.required' => 'Account status is required.',
            'status.in' => 'Invalid account status.',
            'address.required' => 'Address is required.',
            'address.max' => 'Address cannot exceed 255 characters.',
            'avatar.image' => 'The avatar must be an image.',
            'avatar.mimes' => 'The avatar must be a file of type: jpeg, png, jpg, gif.',
            'avatar.max' => 'The avatar size cannot exceed 2MB.',
            'phone_number.required' => 'Phone number is required.',
            'phone_number.regex' => 'Please enter a valid phone number.',
            'dob.required' => 'Date of birth is required.',
            'dob.date' => 'Please enter a valid date of birth.',
            'dob.before' => 'You must be over 18 years old.',
        ]);
        if ($request->filled('password')) {
            $validated['password'] = bcrypt($request->password);
        } else {
            unset($validated['password']);
        }
        $validated['password'] = bcrypt($request->password);
        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar');
            $avatarName = time() . '.' . $avatar->getClientOriginalExtension();
            $destinationPath = public_path('uploads/users');
            $avatar->move($destinationPath, $avatarName);
            $validated['avatar'] = 'uploads/users/' . $avatarName;
        }
        if (!$request->has('dob')) {
            $validated['dob'] = $user->dob; // Giữ nguyên giá trị dob cũ
        }
        if (!$request->has('phone')) {
            $validated['phone'] = $user->phone; // Giữ nguyên giá trị phone cũ
        }
        if (!$request->has('address')) {
            $validated['address'] = $user->address; // Giữ nguyên giá trị address cũ
        }
        $user->update($validated);
        return redirect()->route('admin.users.index')->with('success', 'User updated successfully');
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
        return redirect()->route('admin.users.index')->with('success', 'User restored successfully');
    }
    public function forceDelete($id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        $user->forceDelete();
        return redirect()->route('admin.users.index')->with('success', 'User deleted successfully');
    }
    public function destroy($id)
    {
        $user = User::findOrFail($id); // Tìm người dùng theo ID
        $user->delete(); // Xóa người dùng (soft delete)
        return redirect()->route('admin.users.index')->with('success', 'User deleted successfully');
    }
}
