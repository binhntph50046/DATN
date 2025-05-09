@extends('admin.layouts.app')
@section('title', 'Edit User')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Edit User</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.users.index') }}">Users</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Edit User</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card custom-shadow">
                        <div class="card-body">
                            <form action="{{ route('admin.users.update', $user->id) }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Full Name <span class="text-danger">*</span></label>
                                        <div class="position-relative">
                                            <input type="text" name="name"
                                                class="form-control @error('name') is-invalid @enderror"
                                                value="{{ old('name', $user->name) }}" >
                                            @error('name')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Email <span class="text-danger">*</span></label>
                                        <div class="position-relative">
                                            <input type="email" name="email"
                                                class="form-control @error('email') is-invalid @enderror"
                                                value="{{ old('email', $user->email) }}" >
                                            @error('email')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Password</label>
                                        <div class="position-relative">
                                            <input type="password" name="password"
                                                class="form-control @error('password') is-invalid @enderror"
                                                placeholder="Leave blank if unchanged">
                                            @error('password')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Confirm Password</label>
                                        <div class="position-relative">
                                            <input type="password" name="password_confirmation"
                                                class="form-control @error('password_confirmation') is-invalid @enderror">
                                            @error('password_confirmation')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Phone</label>
                                        <div class="position-relative">
                                            <input type="text" name="phone"
                                                class="form-control @error('phone') is-invalid @enderror"
                                                value="{{ old('phone', $user->phone) }}">
                                            @error('phone')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Address</label>
                                        <div class="position-relative">
                                            <input type="text" name="address"
                                                class="form-control @error('address') is-invalid @enderror"
                                                value="{{ old('address', $user->address) }}">
                                            @error('address')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Date of Birth</label>
                                        <div class="position-relative">
                                            <input type="date" name="dob"
                                                class="form-control @error('dob') is-invalid @enderror"
                                                value="{{ old('dob', $user->dob) }}">
                                        </div>
                                        @error('dob')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Gender</label>
                                        <div class="position-relative">
                                            <select name="gender"
                                                class="form-select @error('gender') is-invalid @enderror">
                                                <option value="">Select Gender</option>
                                                <option value="male"
                                                    {{ old('gender', $user->gender) == 'male' ? 'selected' : '' }}>Male
                                                </option>
                                                <option value="female"
                                                    {{ old('gender', $user->gender) == 'female' ? 'selected' : '' }}>Female
                                                </option>
                                                <option value="other"
                                                    {{ old('gender', $user->gender) == 'other' ? 'selected' : '' }}>Other
                                                </option>
                                            </select>
                                            @error('gender')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Avatar</label>
                                        <div class="position-relative">
                                            <input type="file" name="avatar"
                                                class="form-control @error('avatar') is-invalid @enderror">
                                            @error('avatar')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Status <span class="text-danger">*</span></label>
                                        <div class="position-relative">
                                            <select name="status"
                                                class="form-select @error('status') is-invalid @enderror">
                                                <option value="">Select Status</option>
                                                <option value="active"
                                                    {{ old('status', $user->status) == 'active' ? 'selected' : '' }}>Active
                                                </option>
                                                <option value="inactive"
                                                    {{ old('status', $user->status) == 'inactive' ? 'selected' : '' }}>
                                                    Inactive</option>
                                            </select>
                                            @error('status')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="text-end">
                                    <button type="submit" class="btn btn-primary">Update User</button>
                                    <a href="{{ route('admin.users.index') }}" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
