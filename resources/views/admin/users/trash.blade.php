@extends('admin.layouts.app')
@section('title', 'Trash - User Management')

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
                            <h5 class="m-b-10">Trash</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Trash</li>
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
                        <h5>Trashed Users</h5>
                        <div>
                            <a href="{{ route('admin.users.index') }}" class="btn btn-primary btn-sm">
                                <i class="ti ti-arrow-left"></i> Back to Users
                            </a>
                        </div>
                    </div>

                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif

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
                                                    <img src="{{ asset($user->avatar) }}" alt="Avatar" class="img-thumbnail" style="max-width: 60px;">
                                                @else
                                                    <span class="text-muted">No avatar</span>
                                                @endif
                                            </td>
                                            
                                            <td>{{ $user->name }}</td>
                                            <td>{{ $user->email }}</td>
                                            <td>{{ ucfirst($user->role) }}</td>
                                            <td>
                                                <span class="badge {{ $user->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                    {{ ucfirst($user->status) }}
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <form action="{{ route('admin.users.restore', $user->id) }}" method="POST" class="d-inline">
                                                    @csrf
                                                    <button type="submit" class="btn btn-success btn-sm me-1" title="Restore">
                                                        <i class="ti ti-restore"></i> Restore
                                                    </button>
                                                </form>
                                                <form action="{{ route('admin.users.forceDelete', $user->id) }}" method="POST" class="d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')" title="Delete Permanently">
                                                        <i class="ti ti-trash"></i> Delete Permanently
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="7" class="text-center">No trashed users found.</td>
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
