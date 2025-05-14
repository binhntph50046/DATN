@extends('admin.layouts.app')
@section('title', 'Trash - Attribute Types')

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
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Trash - Attribute Types</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Trash - Attribute Types</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-12">
                <div class="card custom-shadow">
                    <div class="card-header">
                        <h5>Trash Attribute Types</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.attributes.index') }}" class="btn btn-primary btn-sm rounded-3">
                                <i class="ti ti-arrow-left"></i> Back to Attribute Types
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif
                        @if ($attributeTypes->isEmpty())
                            <p>No deleted attribute types found.</p>
                        @else
                        <div class="table custom-shadow ">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Status</th>
                                        <th>Deleted At</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($attributeTypes as $index => $attributeType)
                                        <tr>
                                            <td>{{ $attributeTypes->firstItem() + $index }}</td>
                                            <td>{{ $attributeType->name }}</td>
                                            <td>
                                                <span class="badge {{ $attributeType->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                                    {{ ucfirst($attributeType->status) }}
                                                </span>
                                            </td>
                                            <td>{{ $attributeType->deleted_at->format('d/m/Y H:i') }}</td>
                                            <td>
                                                <form action="{{ route('admin.attributes.restore', $attributeType) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to restore this attribute type?');">
                                                    @csrf
                                                    <button type="submit" class="btn btn-sm btn-success">Restore</button>
                                                </form>
                                                <form action="{{ route('admin.attributes.forceDelete', $attributeType) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to permanently delete this attribute type?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger">Force Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <div class="d-flex justify-content-center">
                                {{ $attributeTypes->links() }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
@endsection