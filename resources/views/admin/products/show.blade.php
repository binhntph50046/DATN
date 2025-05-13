<!-- resources/views/admin/products/show.blade.php -->
@extends('admin.layouts.app')
@section('title', 'View Product')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
    .product-image {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .spec-item {
        background: #f8f9fa;
        padding: 8px 12px;
        border-radius: 6px;
        margin-bottom: 6px;
        display: flex;
        justify-content: space-between;
    }
    .spec-item strong {
        color: #495057;
        min-width: 100px;
    }
    .feature-item {
        background: #f8f9fa;
        padding: 8px 12px;
        border-radius: 6px;
        margin-bottom: 6px;
        display: flex;
        align-items: center;
    }
    .feature-item i {
        color: #0d6efd;
        margin-right: 8px;
    }
    .info-section {
        border-bottom: 1px solid #eee;
        padding-bottom: 1rem;
        margin-bottom: 1rem;
    }
    .info-section:last-child {
        border-bottom: none;
        padding-bottom: 0;
        margin-bottom: 0;
    }
    .product-info-card {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }
    .product-basic-info {
        border-right: 1px solid #eee;
        padding-right: 20px;
    }
    .product-specs-features {
        padding-left: 20px;
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
                                <h5 class="m-b-10">View Product</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">Details</li>
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
                            <h5>Product Information</h5>
                            <div class="card-header-right">
                                @if ($product->has_variants)
                                    <a href="{{ route('admin.products.edit-variant', $product) }}" class="btn btn-info btn-sm rounded-3 me-2">
                                        <i class="ti ti-edit"></i> Edit Product
                                    </a>
                                @else
                                    <a href="{{ route('admin.products.edit-simple', $product) }}" class="btn btn-info btn-sm rounded-3 me-2">
                                        <i class="ti ti-edit"></i> Edit Product
                                    </a>
                                @endif
                                <a href="{{ route('admin.products.index') }}" class="btn btn-secondary btn-sm rounded-3">
                                    <i class="ti ti-arrow-left"></i> Back to List
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <!-- Product Image -->
                                <div class="col-md-4 mb-4">
                                    <div class="custom-shadow">
                                        @if ($product->image)
                                            <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="product-image">
                                        @else
                                            <div class="text-center p-4 bg-light rounded">
                                                <i class="ti ti-photo-off" style="font-size: 48px; color: #ccc;"></i>
                                                <p class="mt-2 text-muted">No image available</p>
                                            </div>
                                        @endif
                                    </div>
                                </div>

                                <!-- Product Info, Specs and Features -->
                                <div class="col-md-8">
                                    <div class="custom-shadow">
                                        <div class="product-info-card">
                                            <!-- Left Column: Basic Info -->
                                            <div class="product-basic-info">
                                                <h3 class="mb-3">{{ $product->name }}</h3>
                                                <div class="info-section">
                                                    <p class="mb-2"><strong>Category:</strong> {{ $product->category ? $product->category->name : 'N/A' }}</p>
                                                    <p class="mb-2"><strong>Model:</strong> {{ $product->model ?? 'N/A' }}</p>
                                                    <p class="mb-2"><strong>Series:</strong> {{ $product->series ?? 'N/A' }}</p>
                                                    <p class="mb-2">
                                                        <strong>Price:</strong>
                                                        @php
                                                            // Lấy giá từ variant đầu tiên nếu có, hoặc từ product nếu không có variant
                                                            $price = $product->variants->first()->selling_price ?? $product->selling_price ?? 0;
                                                            $discountPrice = $product->variants->first()->discount_price ?? $product->discount_price ?? 0;
                                                        @endphp
                                                        @if ($discountPrice > 0)
                                                            <span class="text-decoration-line-through text-muted">{{ number_format($price) }} VNĐ</span>
                                                            <br>
                                                            <span class="text-danger fw-bold">{{ number_format($discountPrice) }} VNĐ</span>
                                                        @else
                                                            {{ number_format($price) }} VNĐ
                                                        @endif
                                                    </p>
                                                    <p class="mb-2"><strong>Stock:</strong> {{ $product->variants->sum('stock') ?? $product->stock ?? 0 }}</p>
                                                    <p class="mb-2"><strong>Warranty:</strong> {{ $product->warranty_months ?? 'N/A' }} months</p>
                                                    <div class="mb-3">
                                                        <strong>Status:</strong>
                                                        <span class="badge {{ $product->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                            {{ ucfirst($product->status) }}
                                                        </span>
                                                        @if ($product->is_featured ?? false)
                                                            <span class="badge bg-info ms-2">Featured</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Right Column: Specs and Features -->
                                            <div class="product-specs-features">
                                                <!-- Specifications -->
                                                @if ($product->specifications)
                                                    <div class="info-section">
                                                        <h5 class="mb-3">Specifications</h5>
                                                        @foreach ($product->specifications as $spec)
                                                            <div class="spec-item">
                                                                <strong>{{ $spec['key'] }}:</strong>
                                                                <span>{{ $spec['value'] }}</span>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                @endif

                                                <!-- Features -->
                                                @if ($product->features)
                                                    <div class="info-section">
                                                        <h5 class="mb-3">Features</h5>
                                                        @foreach ($product->features as $feature)
                                                            <div class="feature-item">
                                                                <i class="ti ti-check"></i>
                                                                {{ $feature }}
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Description (Full Width) -->
                            @if ($product->description)
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="custom-shadow">
                                            <h5 class="mb-3">Description</h5>
                                            <p>{{ $product->description }}</p>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <!-- Content (Full Width) -->
                            @if ($product->content)
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="custom-shadow">
                                            <h5 class="mb-3">Content</h5>
                                            <div class="content">
                                                {!! $product->content !!}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <!-- Product Variants -->
                            <div class="card mt-4">
                                <div class="card-header">
                                    <h5>Product Variants</h5>
                                </div>
                                <div class="card-body">
                                    @if ($product->has_variants)
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>SKU</th>
                                                        <th>Image</th>
                                                        <th>Attributes</th>
                                                        <th>Price</th>
                                                        <th>Stock</th>
                                                        <th>Status</th>
                                                        <th>Default</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($product->variants as $variant)
                                                        <tr class="{{ $variant->is_default ?? false ? 'table-success' : '' }}">
                                                            <td>{{ $variant->sku }}</td>
                                                            <td>
                                                                @if ($variant->image)
                                                                    <img src="{{ asset('storage/' . $variant->image) }}" alt="Variant Image" class="rounded" style="width: 50px; height: 50px; object-fit: cover;">
                                                                @else
                                                                    <span class="badge bg-secondary">No image</span>
                                                                @endif
                                                            </td>
                                                            <td>
                                                                @foreach ($variant->attributes as $attr)
                                                                    <div class="mb-1">
                                                                        <small class="text-muted">{{ $attr->attributeType ? $attr->attributeType->name : 'N/A' }}:</small>
                                                                        <span class="badge bg-info">{{ $attr->value }}</span>
                                                                    </div>
                                                                @endforeach
                                                            </td>
                                                            <td>
                                                                <div class="d-flex flex-column">
                                                                    <span class="text-success fw-bold">{{ number_format($variant->selling_price ?? 0) }} VNĐ</span>
                                                                    @if ($variant->discount_price)
                                                                        <small class="text-danger text-decoration-line-through">{{ number_format($variant->discount_price) }} VNĐ</small>
                                                                    @endif
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <span class="badge {{ $variant->stock > 0 ? 'bg-success' : 'bg-danger' }}">
                                                                    {{ $variant->stock ?? 0 }}
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span class="badge bg-{{ $variant->status === 'active' ? 'success' : 'danger' }}">
                                                                    {{ ucfirst($variant->status ?? 'N/A') }}
                                                                </span>
                                                            </td>
                                                            <td>
                                                                @if ($variant->is_default ?? false)
                                                                    <span class="badge bg-success">
                                                                        <i class="ti ti-check"></i> Default
                                                                    </span>
                                                                @else
                                                                    <span class="badge bg-secondary">-</span>
                                                                @endif
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    @else
                                        <div class="alert alert-info">
                                            This is a simple product without variants.
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection