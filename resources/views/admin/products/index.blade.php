@extends('admin.layouts.app')
@section('title', 'Product Management')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Products</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item" aria-current="page">Products</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->

            <!-- [ Main Content ] start -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>Products</h5>
                            <div class="card-header-right">
                                <a href="{{ route('admin.products.create') }}" class="btn btn-primary btn-sm rounded-3">
                                    <i class="ti ti-plus"></i> Add New Product
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            @if(session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            <!-- Filters -->
                            <form method="GET" action="{{ route('admin.products.index') }}" class="row g-3 mb-3">
                                <div class="col-md-3">
                                    <input type="text" name="name" class="form-control" placeholder="Search by name..." value="{{ request('name') }}">
                                </div>
                            
                                <div class="col-md-3">
                                    <select name="category_id" class="form-select">
                                        <option value="">-- Filter by Category --</option>
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}" {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                                {{ $category->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            
                                <div class="col-md-3">
                                    <select name="status" class="form-select">
                                        <option value="">-- Filter by Status --</option>
                                        <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                        <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                    </select>
                                </div>
                            
                                <div class="col-md-3 d-flex align-items-center">
                                    <button type="submit" class="btn btn-primary me-2">Filter</button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">Reset</a>
                                </div>
                            </form>

                            <div class="table custom-shadow">
                                <table class="table table-hover table-borderless">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Image</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                            <th>Status</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($products as $product)
                                            <tr>
                                                <td>{{ $product->id }}</td>
                                                <td>
                                                    @if($product->image)
                                                        <img src="{{ asset($product->image) }}" alt="{{ $product->name }}" class="img-thumbnail" style="max-width: 50px;">
                                                    @else
                                                        <span class="text-muted">No image</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    <div class="font-weight-bold">{{ $product->name }}</div>
                                                    <div class="small">
                                                        @if($product->has_variants)
                                                            <span class="badge bg-info">Variable Product</span>
                                                        @else
                                                            <span class="badge bg-success">Simple Product</span>
                                                        @endif
                                                    </div>
                                                </td>
                                                <td>{{ $product->category->name ?? 'N/A' }}</td>
                                                <td>
                                                    @if($product->has_variants)
                                                        <span class="text-muted">Multiple</span>
                                                    @else
                                                        {{ number_format($product->selling_price) }} VNĐ
                                                    @endif
                                                </td>
                                                <td>{{ $product->stock }}</td>
                                                <td>
                                                    <span class="badge {{ $product->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                                        {{ ucfirst($product->status) }}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group">
                                                        <a href="{{ route('admin.products.show', $product) }}" class="btn btn-info btn-sm rounded-3 me-2" title="View">
                                                            <i class="ti ti-eye"></i>
                                                        </a>
                                                        <a href="{{ route('admin.products.edit', $product) }}" class="btn btn-primary btn-sm rounded-3 me-2" title="Edit">
                                                            <i class="ti ti-edit"></i>
                                                        </a>
                                                        <form action="{{ route('admin.products.destroy', $product) }}" method="POST" class="d-inline">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm rounded-3" title="Delete" onclick="return confirm('Are you sure you want to delete this product?')">
                                                                <i class="ti ti-trash"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                {{ $products->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
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
