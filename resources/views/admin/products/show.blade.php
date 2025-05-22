@extends('admin.layouts.app')
@section('title', 'View Product')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 20px;
        transition: all 0.3s ease;
    }
    .custom-shadow:hover {
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
    }
    .product-image {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        object-fit: cover;
    }
    .default-image {
        width: 100%;
        height: 300px;
        object-fit: cover;
        border-radius: 8px;
        background-color: #f8f9fa;
    }
    .spec-item, .feature-item {
        background: #f8f9fa;
        padding: 10px 14px;
        border-radius: 6px;
        margin-bottom: 8px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .spec-item strong {
        color: #495057;
        min-width: 120px;
        font-weight: 600;
    }
    .spec-item .hex-color {
        display: inline-flex;
        align-items: center;
    }
    .spec-item .hex-color span.color-box {
        display: inline-block;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        border: 1px solid #ddd;
        margin-left: 8px;
    }
    .feature-item i {
        color: #0d6efd;
        margin-right: 10px;
    }
    .info-section {
        border-bottom: 1px solid #eee;
        padding-bottom: 1.5rem;
        margin-bottom: 1.5rem;
    }
    .info-section:last-child {
        border-bottom: none;
        padding-bottom: 0;
        margin-bottom: 0;
    }
    .product-info-card {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 24px;
        margin-bottom: 2rem;
    }
    .product-basic-info {
        border-right: 1px solid #eee;
        padding-right: 24px;
    }
    .product-specs-features {
        padding-left: 24px;
    }
    .variant-table img {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 6px;
    }
    .badge-featured {
        background-color: #17a2b8;
        color: white;
    }
    .content-section img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
    }
    .btn-action {
        transition: all 0.3s ease;
    }
    .btn-action:hover {
        transform: translateY(-2px);
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
                                <h5 class="m-b-10">Product Details</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">{{ $product->name }}</li>
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
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5>Product Information</h5>
                            <div>
                                @if ($product->has_variants)
                                    <a href="{{ route('admin.products.edit-variant', $product) }}" class="btn btn-info btn-sm btn-action rounded-3 me-2">
                                        <i class="ti ti-edit"></i> Edit Product
                                    </a>
                                @else
                                    <a href="{{ route('admin.products.edit-simple', $product) }}" class="btn btn-info btn-sm btn-action rounded-3 me-2">
                                        <i class="ti ti-edit"></i> Edit Product
                                    </a>
                                @endif
                                <a href="{{ route('admin.products.index') }}" class="btn btn-secondary btn-sm btn-action rounded-3">
                                    <i class="ti ti-arrow-left"></i> Back to List
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <!-- Product Image -->
                                <div class="col-md-4 mb-4">
                                    <div class="custom-shadow text-center">
                                        @if ($product->image)
                                            <img src="{{ asset('Uploads/' . $product->image) }}" alt="{{ $product->name }}" class="product-image">
                                        @elseif ($product->variants->first() && $product->variants->first()->image)
                                            <img src="{{ asset('Uploads/' . $product->variants->first()->image) }}" alt="{{ $product->name }}" class="product-image">
                                        @else
                                            <img src="{{ asset('Uploads/default/default.jpg') }}" alt="Default Image" class="default-image">
                                            <p class="mt-2 text-muted">No image available</p>
                                        @endif
                                    </div>
                                </div>

                                <!-- Product Info, Specs, and Features -->
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
                                                    <p class="mb-2"><strong>SKU:</strong> {{ $product->sku ?? 'N/A' }}</p>
                                                    <p class="mb-2">
                                                        <strong>Price:</strong>
                                                        @php
                                                            $price = $product->has_variants ? ($product->variants->first()->selling_price ?? 0) : ($product->selling_price ?? 0);
                                                            $discountPrice = $product->has_variants ? ($product->variants->first()->discount_price ?? 0) : ($product->discount_price ?? 0);
                                                        @endphp
                                                        @if ($discountPrice > 0 && $discountPrice < $price)
                                                            <span class="text-decoration-line-through text-muted">{{ number_format($price, 0, ',', '.') }} VNĐ</span>
                                                            <br>
                                                            <span class="text-danger fw-bold">{{ number_format($discountPrice, 0, ',', '.') }} VNĐ</span>
                                                        @else
                                                            <span class="text-success fw-bold">{{ number_format($price, 0, ',', '.') }} VNĐ</span>
                                                        @endif
                                                    </p>
                                                    <p class="mb-2"><strong>Purchase Price:</strong> {{ number_format($product->has_variants ? ($product->variants->first()->purchase_price ?? 0) : ($product->purchase_price ?? 0), 0, ',', '.') }} VNĐ</p>
                                                    <p class="mb-2"><strong>Stock:</strong> {{ $product->has_variants ? $product->variants->sum('stock') : ($product->stock ?? 0) }}</p>
                                                    <p class="mb-2"><strong>Warranty:</strong> {{ $product->warranty_months ?? 'N/A' }} months</p>
                                                    <div class="mb-3">
                                                        <strong>Status:</strong>
                                                        <span class="badge {{ $product->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                            {{ ucfirst($product->status) }}
                                                        </span>
                                                        @if ($product->is_featured)
                                                            <span class="badge badge-featured ms-2">Featured</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Right Column: Specs and Features -->
                                            <div class="product-specs-features">
                                                <!-- Specifications (from product_attributes) -->
                                                @if ($product->attributes->isNotEmpty())
                                                    <div class="info-section">
                                                        <h5 class="mb-3">Specifications</h5>
                                                        @foreach ($product->attributes as $attr)
                                                            <div class="spec-item">
                                                                <strong>{{ $attr->attribute_name }}:</strong>
                                                                <div class="hex-color">
                                                                    <span>{{ $attr->attribute_value }}</span>
                                                                    @if ($attr->hex)
                                                                        <span class="color-box" style="background-color: {{ $attr->hex }};"></span>
                                                                        <span class="ms-2 text-muted">({{ $attr->hex }})</span>
                                                                    @endif
                                                                </div>
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

                            <!-- Description -->
                            @if ($product->description)
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="custom-shadow">
                                            <h5 class="mb-3">Description</h5>
                                            <p class="text-muted">{!! nl2br(e($product->description)) !!}</p>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <!-- Content -->
                            @if ($product->content)
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="custom-shadow content-section">
                                            <h5 class="mb-3">Detailed Content</h5>
                                            <div class="content">{!! $product->content !!}</div>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <!-- Product Variants -->
                            <div class="card custom-shadow mt-4">
                                <div class="card-header">
                                    <h5>Product Variants</h5>
                                </div>
                                <div class="card-body">
                                    @if ($product->has_variants)
                                        <div class="table-responsive">
                                            <table class="table table-hover variant-table">
                                                <thead>
                                                    <tr>
                                                        <th>SKU</th>
                                                        <th>Image</th>
                                                        <th>Name</th>
                                                        <th>Attributes</th>
                                                        <th>Purchase Price</th>
                                                        <th>Selling Price</th>
                                                        <th>Discount Price</th>
                                                        <th>Stock</th>
                                                        <th>Status</th>
                                                        <th>Default</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($product->variants as $variant)
                                                        <tr class="{{ $variant->is_default ? 'table-success' : '' }}">
                                                            <td>{{ $variant->sku }}</td>
                                                            <td>
                                                                @if ($variant->image)
                                                                    <img src="{{ asset('Uploads//' . $variant->image) }}" alt="Variant Image">
                                                                @else
                                                                    <img src="{{ asset('Uploads/default/default.jpg') }}" alt="Default Image">
                                                                @endif
                                                            </td>
                                                            <td>{{ $variant->name }}</td>
                                                            <td>
                                                                @foreach ($variant->combinations as $combination)
                                                                    <div class="mb-1">
                                                                        <small class="text-muted">{{ $combination->attributeValue->attributeType->name }}:</small>
                                                                        <span class="badge bg-info">{{ $combination->attributeValue->value }}</span>
                                                                    </div>
                                                                @endforeach
                                                            </td>
                                                            <td>{{ number_format($variant->purchase_price, 0, ',', '.') }} VNĐ</td>
                                                            <td>
                                                                <span class="text-success fw-bold">{{ number_format($variant->selling_price, 0, ',', '.') }} VNĐ</span>
                                                            </td>
                                                            <td>
                                                                @if ($variant->discount_price && $variant->discount_price < $variant->selling_price)
                                                                    <span class="text-danger fw-bold">{{ number_format($variant->discount_price, 0, ',', '.') }} VNĐ</span>
                                                                @else
                                                                    <span class="text-muted">-</span>
                                                                @endif
                                                            </td>
                                                            <td>
                                                                <span class="badge {{ $variant->stock > 0 ? 'bg-success' : 'bg-danger' }}">
                                                                    {{ $variant->stock }}
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span class="badge bg-{{ $variant->status === 'active' ? 'success' : 'danger' }}">
                                                                    {{ ucfirst($variant->status) }}
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span class="badge bg-{{ $variant->is_default ? 'success' : 'secondary' }}">
                                                                    {{ $variant->is_default ? 'Default' : 'No' }}
                                                                </span>
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