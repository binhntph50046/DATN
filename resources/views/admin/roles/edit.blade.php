@extends('admin.layouts.app')
@section('title', 'Assign Role')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
</style>

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Assign Role</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.users.index') }}">Users</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Assign Role</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- [ main content ] -->
            <div class="row">
                <div class="col-12">
                    <div class="card custom-shadow">
                        <div class="card-header">
                            <h5>Assign Role to {{ $user->name }}</h5>
                        </div>
                        <div class="card-body">
                            @if (session('success'))
                                <div class="alert alert-success">{{ session('success') }}</div>
                            @endif

                            <form action="{{ route('admin.roles.update', $user->id) }}" method="POST">
                                @csrf
                                @method('PUT')
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="role" class="form-label">Select Role</label>
                                        <select name="role" id="role" class="form-control">
                                            <option value="user" {{ $currentRole == 'user' ? 'selected' : '' }}>User</option>
                                            <option value="staff" {{ $currentRole == 'staff' ? 'selected' : '' }}>Staff</option>
                                        </select>
                                        @error('role')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <button type="submit" class="btn btn-primary btn-sm me-2">Update Role</button>
                                    <a href="{{ route('admin.users.index') }}" class="btn btn-secondary btn-sm">Back</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection