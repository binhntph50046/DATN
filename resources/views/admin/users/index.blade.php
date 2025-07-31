@extends('admin.layouts.app')
@section('title', 'Quản lý người dùng')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
    .table th, .table td { padding: 0.35rem 0.5rem; }
    .table .text-nowrap { white-space: nowrap; }
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
                                <h5 class="m-b-10">Users</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Users</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- [ main content ] -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>User List</h5>
                            <div class="card-header-right">
                                @can('create users')
                                    <a href="{{ route('admin.users.create') }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                        <i class="ti ti-plus"></i> Add New User
                                    </a>
                                @endcan
                                @can('view users')
                                    <a href="{{ route('admin.users.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                        <i class="ti ti-trash"></i> Trash
                                    </a>
                                @endcan
                            </div>
                        </div>

                        <div class="card-body">
                            @if (session('success'))
                                <div class="alert alert-success">{{ session('success') }}</div>
                            @endif

                            <!-- Filter -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-body">
                                    <form method="GET" action="{{ route('admin.users.index') }}" class="row g-3 mb-3">
                                        <div class="col-md-3">
                                            <input type="text" name="search" class="form-control" placeholder="Search by name..."
                                                value="{{ request('search') }}">
                                        </div>
                                        <div class="col-md-3">
                                            <select name="role" class="form-select">
                                                <option value="">-- Filter by Role --</option>
                                                @foreach ($roles as $role)
                                                    <option value="{{ $role }}"
                                                        {{ request('role') == $role ? 'selected' : '' }}>
                                                        {{ ucfirst($role) }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <select name="status" class="form-select">
                                                <option value="">-- Filter by Status --</option>
                                                <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active
                                                </option>
                                                <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>
                                                    Inactive</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <button type="submit" class="btn btn-primary btn-sm me-2">Filter</button>
                                            <a href="{{ route('admin.users.index') }}" class="btn btn-secondary btn-sm">Reset</a>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- Table -->
                            <div class="table custom-shadow">
                                <table class="table table-hover table-borderless align-middle" style="font-size: 14px;">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Avatar</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($users as $user)
                                            <tr>
                                                <td>{{ $user->id }}</td>
                                                <td>
                                                    @if ($user->avatar)
                                                        <img src="{{ asset($user->avatar) }}" alt="Avatar"
                                                            style="width:60px; height:60px; object-fit:cover; border-radius:8px;">
                                                    @else
                                                        <span class="text-muted">No avatar</span>
                                                    @endif
                                                </td>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td>{{ ucfirst($user->getRoleNames()->first() ?? 'None') }}</td>
                                                <td>
                                                    <span
                                                        class="badge {{ $user->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                        {{ ucfirst($user->status) }}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                        <a href="{{ route('admin.users.edit', $user->id) }}"
                                                            class="btn btn-info btn-sm rounded-3" title="Edit">
                                                            <i class="ti ti-edit"></i> Edit
                                                        </a>

                                                    @if(auth()->user()->hasRole('admin'))
                                                        @can('addrole')
                                                            <a href="{{ route('admin.roles.edit', $user->id) }}"
                                                                class="btn btn-warning btn-sm rounded-3" title="Assign Role">
                                                                <i class="ti ti-user-check"></i> Assign Role
                                                            </a>
                                                        @endcan
                                                    @endif

                                                        <form action="{{ route('admin.users.destroy', $user->id) }}"
                                                            method="POST" class="d-inline">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm rounded-3"
                                                                onclick="return confirm('Are you sure you want to delete this user?')" title="Delete">
                                                                <i class="ti ti-trash"></i> Delete
                                                            </button>
                                                        </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="7" class="text-center">No users found.</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>

                                <!-- Pagination -->
                                {{ $users->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('styles')
<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px !important;
        background-color: #fff;
        padding: 16px;
    }
    .badge {
        font-size: 0.85em;
        padding: 0.35em 0.65em;
    }
    .table td {
        vertical-align: middle;
    }
    .table-borderless td, .table-borderless th {
        border: 0;
    }
    .table-hover tbody tr:hover {
        background-color: rgba(0,0,0,.075);
    }
</style>
@endpush
