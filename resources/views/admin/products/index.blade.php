@extends('admin.layouts.app')
@section('title', 'Product Management')

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
                            <h5>Products List</h5>
                            <div class="card-header-right">
                                <a href="{{ route('admin.products.create') }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                    <i class="ti ti-plus"></i> Add New Product
                                </a>
                                <a href="{{ route('admin.products.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                    <i class="ti ti-trash"></i> Trash
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            <!-- Filter Section -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-body">
                                    <form method="GET" action="{{ route('admin.products.index') }}" class="row g-3">
                                        <div class="col-md-3">
                                            <label class="form-label">Category</label>
                                            <select name="category_id" class="form-select">
                                                <option value="">All Categories</option>
                                                @foreach($categories as $category)
                                                    <option value="{{ $category->id }}" {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Status</label>
                                            <select name="status" class="form-select">
                                                <option value="">All Status</option>
                                                <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                                <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Model</label>
                                            <input type="text" name="model" class="form-control" placeholder="Filter by model" value="{{ request('model') }}">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Series</label>
                                            <input type="text" name="series" class="form-control" placeholder="Filter by series" value="{{ request('series') }}">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Min Price (VNĐ)</label>
                                            <input type="number" name="min_price" class="form-control" placeholder="Min price" value="{{ request('min_price') }}">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Max Price (VNĐ)</label>
                                            <input type="number" name="max_price" class="form-control" placeholder="Max price" value="{{ request('max_price') }}">
                                        </div>
                                        <div class="col-12 mt-3">
                                            <button type="submit" class="btn btn-primary btn-sm">Filter</button>
                                            <a href="{{ route('admin.products.index') }}" class="btn btn-secondary btn-sm">Reset</a>
                                        </div>
                                    </form>
                                </div>
                            </div>

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
                                            <th>Variants</th>
                                            <th>Default Variant</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($products as $product)
                                            <tr>
                                                <td>{{ $product->id }}</td>
                                                <td>
                                                    @if ($product->image)
                                                        <img src="{{ asset($product->image) }}" alt="{{ $product->name }}"
                                                            class="img-thumbnail" style="max-width: 100px; height: auto;">
                                                    @else
                                                        <span class="text-muted">No image</span>
                                                    @endif
                                                </td>
                                                <td>{{ $product->name }}</td>
                                                <td>{{ $product->category->name ?? 'N/A' }}</td>
                                                <td>
                                                    @if($product->discount_price)
                                                        <span class="text-decoration-line-through text-muted">{{ number_format($product->price) }} VNĐ</span>
                                                        <br>
                                                        <span class="text-danger fw-bold">{{ number_format($product->discount_price) }} VNĐ</span>
                                                    @else
                                                        {{ number_format($product->price) }} VNĐ
                                                    @endif
                                                </td>
                                                <td>{{ $product->stock }}</td>
                                                <td>
                                                    <span class="badge {{ $product->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                        {{ ucfirst($product->status) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    @if($product->has_variants)
                                                        <span class="badge bg-info">{{ $product->variants->count() }} variants</span>
                                                    @else
                                                        <span class="badge bg-secondary">Simple</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if($product->has_variants)
                                                        @php
                                                            $defaultVariant = $product->variants->where('is_default', true)->first();
                                                        @endphp
                                                        @if($defaultVariant)
                                                            <div class="d-flex align-items-center">
                                                                @if($defaultVariant->image)
                                                                    <img src="{{ $defaultVariant->image }}" alt="Default Variant" class="rounded me-2" style="width: 40px; height: 40px; object-fit: cover;">
                                                                @endif
                                                                <div>
                                                                    <span class="badge bg-success">Default</span>
                                                                    <small class="d-block text-muted">{{ $defaultVariant->sku }}</small>
                                                                </div>
                                                            </div>
                                                        @else
                                                            <span class="badge bg-warning">No default</span>
                                                        @endif
                                                    @else
                                                        <span class="badge bg-secondary">N/A</span>
                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                    <a href="{{ route('admin.products.show', $product->id) }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                                        <i class="ti ti-eye"></i> View
                                                    </a>
                                                    <a href="{{ route('admin.products.edit', $product->id) }}" class="btn btn-info btn-sm rounded-3 me-2">
                                                        <i class="ti ti-edit"></i> Edit
                                                    </a>
                                                    <form action="{{ route('admin.products.destroy', $product->id) }}" method="POST" class="d-inline">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm rounded-3" onclick="return confirm('Are you sure you want to delete this product?')">
                                                            <i class="ti ti-trash"></i> Delete
                                                        </button>
                                                    </form>
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
