<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    @extends('admin.layouts.app')

    @section('title', 'User Management')

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
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5>User List</h5>
                            <div>
                                @can('create users')
                                    <a href="{{ route('admin.users.create') }}" class="btn btn-primary btn-sm me-2">
                                        <i class="ti ti-plus"></i> Add New User
                                    </a>
                                @endcan
                                @can('view users')
                                    <a href="{{ route('admin.users.trash') }}" class="btn btn-danger btn-sm">
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
                            <div class="custom-shadow mb-4">
                                <form method="GET" action="{{ route('admin.users.index') }}" class="row g-3">
                                    <div class="col-md-3">
                                        <label class="form-label">Role</label>
                                        <select name="role" class="form-select">
                                            <option value="">All Roles</option>
                                            @foreach ($roles as $role)
                                                <option value="{{ $role }}"
                                                    {{ request('role') == $role ? 'selected' : '' }}>
                                                    {{ ucfirst($role) }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">Status</label>
                                        <select name="status" class="form-select">
                                            <option value="">All Status</option>
                                            <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active
                                            </option>
                                            <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>
                                                Inactive</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">Search</label>
                                        <input type="text" name="search" class="form-control" placeholder="Name or Email"
                                            value="{{ request('search') }}">
                                    </div>
                                    <div class="col-md-3 d-flex align-items-end">
                                        <button type="submit" class="btn btn-primary btn-sm me-2">Filter</button>
                                        <a href="{{ route('admin.users.index') }}" class="btn btn-secondary btn-sm">Reset</a>
                                    </div>
                                </form>
                            </div>

                            <!-- Table -->
                            <div class="table custom-shadow">
                                <table class="table table-hover table-borderless">
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
                                                            class="img-thumbnail" style="max-width: 60px;">
                                                    @else
                                                        <span class="text-muted">No avatar</span>
                                                    @endif
                                                </td>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td>{{ ucfirst($user->getRoleNames()->first() ?? 'None') }}</td>
                                                <td>
                                                    @can('edit users')
                                                        <form action="{{ route('admin.users.toggle-status', $user->id) }}" method="POST" class="d-inline">
                                                            @csrf
                                                            <input type="hidden" name="status" value="{{ $user->status === 'active' ? 'inactive' : 'active' }}">
                                                            <button type="submit" class="btn btn-sm {{ $user->status === 'active' ? 'btn-success' : 'btn-danger' }}"
                                                                onclick="return confirm('Bạn có chắc muốn thay đổi trạng thái tài khoản này?')">
                                                                {{ $user->status === 'active' ? 'Active' : 'Inactive' }}
                                                            </button>
                                                        </form>
                                                    @else
                                                        <span class="badge {{ $user->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                            {{ ucfirst($user->status) }}
                                                        </span>
                                                    @endcan
                                                </td>
                                                <td class="text-center">
                                                    @can('view users')
                                                        <a href="{{ route('admin.users.show', $user->id) }}"
                                                            class="btn btn-primary btn-sm me-1" title="View Details">
                                                            <i class="ti ti-eye"></i>
                                                        </a>
                                                    @endcan
                                                    @can('edit users')
                                                        <a href="{{ route('admin.users.edit', $user->id) }}"
                                                            class="btn btn-info btn-sm me-1" title="Edit">
                                                            <i class="ti ti-edit"></i>
                                                        </a>
                                                    @endcan
                                                    @can('addrole')
                                                        <a href="{{ route('admin.roles.edit', $user->id) }}"
                                                            class="btn btn-warning btn-sm me-1" title="Assign Role">
                                                            <i class="ti ti-user-check"></i>
                                                        </a>
                                                    @endcan
                                                    @can('delete users')
                                                        <form action="{{ route('admin.users.destroy', $user->id) }}"
                                                            method="POST" class="d-inline">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Are you sure?')" title="Delete">
                                                                <i class="ti ti-trash"></i>
                                                            </button>
                                                        </form>
                                                    @endcan
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    @endsection

    @push('styles')
    <style>
        .custom-shadow {
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            background-color: #fff;
            padding: 16px;
        }
        .badge {
            font-size: 0.85em;
            padding: 0.35em 0.65em;
        }
        .btn-group .btn {
            padding: 0.25rem 0.5rem;
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
</body>
</html>