<!-- resources/views/admin/products/index.blade.php -->
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
                            <a href="{{ route('admin.products.create-simple') }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                <i class="ti ti-plus"></i> Add Simple Product
                            </a>
                            <a href="{{ route('admin.products.create-variant') }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                <i class="ti ti-plus"></i> Add Variant Product
                            </a>
                            <a href="{{ route('admin.products.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                <i class="ti ti-trash"></i> Trash
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        <div class="card shadow-sm mb-4">
                            <div class="card-body">
                                <form method="GET" action="{{ route('admin.products.index') }}" class="row g-3 mb-3">
                                    <div class="col-md-3">
                                        <input type="text" name="name" class="form-control" placeholder="Search by name..." value="{{ request('name') }}">
                                    </div>
                                
                                    <div class="col-md-3">
                                        <select name="category_id" class="form-select">
                                            <option value="">-- Select Category --</option>
                                            @foreach($categories as $category)
    <option value="{{ $category->id }}" {{ request('category_id') == $category->id ? 'selected' : '' }}>
        {{ $category->name }}
    </option>
@endforeach
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="has_variants" class="form-select">
                                            <option value="">-- Product Type --</option>
                                            <option value="1" {{ request('has_variants') == '1' ? 'selected' : '' }}>With Variants</option>
                                            <option value="0" {{ request('has_variants') == '0' ? 'selected' : '' }}>Simple Product</option>
                                        </select>
                                    </div>
                                
                                    <div class="col-md-3">
                                        <select name="status" class="form-select">
                                            <option value="">-- Filter by Status --</option>
                                            <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                            <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="is_featured" class="form-select">
                                            <option value="">-- Featured Status --</option>
                                            <option value="1" {{ request('is_featured') == '1' ? 'selected' : '' }}>Featured</option>
                                            <option value="0" {{ request('is_featured') == '0' ? 'selected' : '' }}>Not Featured</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select name="price_range" class="form-select">
                                            <option value="">-- Price Range --</option>
                                            <option value="0-1000000" {{ request('price_range') == '0-1000000' ? 'selected' : '' }}>Under 1M</option>
                                            <option value="1000000-5000000" {{ request('price_range') == '1000000-5000000' ? 'selected' : '' }}>1M - 5M</option>
                                            <option value="5000000-10000000" {{ request('price_range') == '5000000-10000000' ? 'selected' : '' }}>5M - 10M</option>
                                            <option value="10000000-20000000" {{ request('price_range') == '10000000-20000000' ? 'selected' : '' }}>10M - 20M</option>
                                            <option value="20000000-999999999" {{ request('price_range') == '20000000-999999999' ? 'selected' : '' }}>Over 20M</option>
                                        </select>
                                    </div>
                                
                                    <div class="col-12 mt-3">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="ti ti-filter"></i> Filter
                                        </button>
                                        <a href="{{ route('admin.products.index') }}" class="btn btn-secondary btn-sm">
                                            <i class="ti ti-refresh"></i> Reset
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="table custom-shadow">
                            <table class="table table-hover table-borderless align-middle" style="font-size: 14px;">
                                <style>
                                    .table th, .table td { padding: 0.35rem 0.5rem; }
                                    .table .text-nowrap { white-space: nowrap; }
                                    .product-img-thumb {
                                        box-shadow: 0 2px 12px 0 rgba(0,0,0,0.12), 0 1.5px 4px 0 rgba(0,0,0,0.08);
                                        border: 2px solid #eee;
                                        transition: transform 0.2s, border-color 0.2s;
                                    }
                                    .product-img-thumb:hover {
                                        transform: scale(1.08);
                                        border-color: #007bff;
                                        box-shadow: 0 4px 18px 0 rgba(0,123,255,0.15), 0 3px 8px 0 rgba(0,0,0,0.10);
                                        z-index: 2;
                                    }
                                </style>
                                <thead>
                                    <tr>
                                        <th class="text-nowrap">ID</th>
                                        <th>Image</th>
                                        <th class="text-nowrap">Name</th>
                                        <th class="text-nowrap">Category</th>
                                        <th class="text-nowrap">Price</th>
                                        <th class="text-nowrap">Stock</th>
                                        <th class="text-nowrap">Type</th>
                                        <th class="text-nowrap">Status</th>
                                        <th class="text-nowrap">Featured</th>
                                        <th class="text-center text-nowrap">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($products as $index => $product)
                                        <tr>
                                            <td class="text-nowrap">{{ $products->firstItem() + $index }}</td>
                                            <td>
                                                @php
                                                    $defaultVariant = $product->variants->first();
                                                    $firstImage = null;
                                                    if ($defaultVariant && $defaultVariant->images) {
                                                        $images = is_array($defaultVariant->images) ? $defaultVariant->images : json_decode($defaultVariant->images, true);
                                                        $firstImage = is_array($images) && count($images) > 0 ? $images[0] : null;
                                                    }
                                                @endphp
                                                @if ($firstImage)
                                                    <img src="{{ asset($firstImage) }}"
                                                        alt="{{ $product->name }}"
                                                        class="product-img-thumb"
                                                        style="width: 100px; height: 100px; object-fit: cover; border-radius: 8px;">
                                                @else
                                                    <img src="{{ asset('uploads/default/default.jpg') }}"
                                                        alt="default image"
                                                        class="product-img-thumb"
                                                        style="width: 100px; height: 100px; object-fit: cover; border-radius: 8px;">
                                                @endif
                                            </td>
                                            <td class="text-nowrap" style="max-width: 140px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" title="{{ $product->name }}">
                                                {{ $product->name }}
                                            </td>
                                            <td class="text-nowrap">{{ $product->category ? $product->category->name : 'N/A' }}</td>
                                            <td class="text-nowrap">{{ number_format($product->variants->first()->selling_price ?? 0) }} VNĐ</td>
                                            <td class="text-nowrap">{{ $product->variants->first()->stock ?? 0 }}</td>
                                            <td class="text-nowrap">
                                                <span class="badge {{ $product->has_variants ? 'bg-info' : 'bg-secondary' }}">
                                                    {{ $product->has_variants ? 'With Variants' : 'Simple' }}
                                                </span>
                                            </td>
                                            <td class="text-nowrap">
                                                <span class="badge {{ $product->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                                    {{ ucfirst($product->status) }}
                                                </span>
                                            </td>
                                            <td class="text-nowrap">
                                                <span class="badge {{ $product->is_featured ? 'bg-warning' : 'bg-secondary' }}">
                                                    {{ $product->is_featured ? 'Yes' : 'No' }}
                                                </span>
                                            </td>
                                            <td class="text-center text-nowrap">
                                                <a href="{{ route('admin.products.show', $product) }}" 
                                                   class="btn btn-info btn-sm rounded-3 me-2" 
                                                   title="View Details">
                                                    <i class="ti ti-eye"></i>
                                                </a>
                                                @if ($product->has_variants)
                                                    <a href="{{ route('admin.products.edit-variant', $product) }}" 
                                                       class="btn btn-warning btn-sm rounded-3 me-2" 
                                                       title="Edit Product">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                @else
                                                    <a href="{{ route('admin.products.edit-simple', $product) }}" 
                                                       class="btn btn-warning btn-sm rounded-3 me-2" 
                                                       title="Edit Product">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                @endif
                                                <form action="{{ route('admin.products.destroy', $product) }}" 
                                                      method="POST" 
                                                      class="d-inline" 
                                                      onsubmit="return confirm('Are you sure you want to delete this product?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" 
                                                            class="btn btn-danger btn-sm rounded-3" 
                                                            title="Delete Product">
                                                        <i class="ti ti-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="10" class="text-center">No products found.</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex justify-content-center mt-4">
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