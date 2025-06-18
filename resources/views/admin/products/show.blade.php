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

    .spec-item,
    .feature-item {
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

    .price-section {
        background: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
        margin: 10px 0;
    }

    .price-original {
        text-decoration: line-through;
        color: #6c757d;
    }

    .price-discount {
        color: #dc3545;
        font-weight: bold;
        font-size: 1.2em;
    }

    .stock-badge {
        padding: 5px 10px;
        border-radius: 4px;
        font-weight: 500;
    }

    .stock-in {
        background-color: #d4edda;
        color: #155724;
    }

    .stock-out {
        background-color: #f8d7da;
        color: #721c24;
    }

    .status-badge {
        padding: 5px 10px;
        border-radius: 4px;
        font-weight: 500;
    }

    .status-active {
        background-color: #d4edda;
        color: #155724;
    }

    .status-inactive {
        background-color: #f8d7da;
        color: #721c24;
    }

    .specification-section {
        background: #fff;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
    }

    .specification-title {
        color: #2c3e50;
        font-size: 1.2em;
        font-weight: 600;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 2px solid #eee;
    }

    .specification-item {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        border-bottom: 1px solid #eee;
    }

    .specification-item:last-child {
        border-bottom: none;
    }

    .specification-label {
        font-weight: 500;
        color: #495057;
    }

    .specification-value {
        color: #6c757d;
    }

    .variant-section {
        background: #fff;
        border-radius: 8px;
        padding: 20px;
        margin-top: 20px;
    }

    .variant-title {
        color: #2c3e50;
        font-size: 1.2em;
        font-weight: 600;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 2px solid #eee;
    }

    .variant-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
    }

    .variant-table th {
        background: #f8f9fa;
        padding: 12px;
        font-weight: 600;
        color: #495057;
        border-bottom: 2px solid #dee2e6;
    }

    .variant-table td {
        padding: 12px;
        border-bottom: 1px solid #dee2e6;
        vertical-align: middle;
    }

    .variant-table tr:hover {
        background-color: #f8f9fa;
    }

    .variant-attribute {
        display: inline-block;
        margin: 2px;
        padding: 4px 8px;
        background: #e9ecef;
        border-radius: 4px;
        font-size: 0.9em;
    }

    .variant-attribute-name {
        color: #6c757d;
        font-size: 0.8em;
    }

    .variant-attribute-value {
        color: #495057;
        font-weight: 500;
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
                                <a href="{{ route('admin.products.edit', $product) }}"
                                    class="btn btn-info btn-sm btn-action rounded-3 me-2">
                                    <i class="ti ti-edit"></i> Edit Product
                                </a>
                                <a href="{{ route('admin.products.index') }}"
                                    class="btn btn-secondary btn-sm btn-action rounded-3">
                                    <i class="ti ti-arrow-left"></i> Back to List
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row align-items-center justify-content-center mb-4">
                                <!-- Left: Product Image -->
                                <div
                                    class="col-md-6 text-center d-flex flex-column align-items-center justify-content-center">
                                    <div class="custom-shadow" style="background: none; box-shadow: none;">
                                        @if ($product->default_variant_image || $product->variant_image)
                                            <img src="{{ asset($product->default_variant_image ?? $product->variant_image) }}"
                                                alt="{{ $product->name }}" class="product-img-thumb"
                                                style="max-width:300px;max-height:300px;object-fit:cover">
                                        @else
                                            <img src="{{ asset('uploads/default/default.jpg') }}" alt="default image"
                                                class="product-img-thumb"
                                                style="width: 100px; height: 100px; object-fit: cover; border-radius: 8px;">
                                        @endif
                                    </div>
                                </div>
                                <!-- Right: Product Info + Specifications -->
                                <div class="col-md-6">
                                    <div class="custom-shadow p-4 h-100 d-flex flex-column justify-content-center">
                                        <h2 class="fw-bold mb-3">
                                            {{ is_array($product->name) ? implode(', ', $product->name) : $product->name }}
                                        </h2>
                                        <div class="mb-2"><strong>Category:</strong>
                                            {{ is_array($product->category && $product->category->name) ? implode(', ', $product->category->name) : ($product->category ? $product->category->name : 'N/A') }}
                                        </div>
                                        <div class="mb-2"><strong>Warranty:</strong>
                                            {{ $product->warranty_months ?? 'N/A' }} months</div>
                                        <div class="mb-2"><strong>Status:</strong>
                                            <span
                                                class="status-badge {{ $product->status === 'active' ? 'status-active' : 'status-inactive' }}">
                                                {{ ucfirst($product->status) }}
                                            </span>
                                            @if ($product->is_featured)
                                                <span class="badge badge-featured ms-2">Featured</span>
                                            @endif
                                        </div>
                                        <!-- Specifications -->
                                        @if ($product->specifications && $product->specifications->isNotEmpty())
                                            <div class="mt-4">
                                                <h5 class="mb-3">Specifications</h5>
                                                @foreach ($product->specifications as $spec)
                                                    @if($spec->specification)
                                                        <div class="spec-item mb-2">
                                                            <strong>{{ is_array($spec->specification->name) ? implode(', ', $spec->specification->name) : $spec->specification->name }}:</strong>
                                                            <span>{{ is_array($spec->value) ? implode(', ', $spec->value) : $spec->value }}</span>
                                                        </div>
                                                    @endif
                                                @endforeach
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <!-- Features -->
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    @if ($product->features)
                                        <div class="info-section">
                                            <h5 class="mb-3">Features</h5>
                                            @if (is_array($product->features))
                                                @foreach ($product->features as $feature)
                                                    <div class="feature-item">
                                                        <i class="ti ti-check"></i>
                                                        {{ is_array($feature) ? implode(', ', $feature) : $feature }}
                                                    </div>
                                                @endforeach
                                            @else
                                                <div class="feature-item">
                                                    <i class="ti ti-check"></i>
                                                    {{ $product->features }}
                                                </div>
                                            @endif
                                        </div>
                                    @endif
                                </div>
                            </div>

                            <!-- Description -->
                            @if ($product->description)
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <div class="custom-shadow">
                                            <h5 class="mb-3">Description</h5>
                                            <p class="text-muted">{!! is_array($product->description) ? implode(', ', $product->description) : nl2br(e($product->description)) !!}</p>
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
                                            <div class="content">{!! is_array($product->content) ? implode(', ', $product->content) : $product->content !!}</div>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <!-- Product Variants -->
                            @if ($product->variants && $product->variants->isNotEmpty())
                                <div class="variant-section mt-4">
                                    <h5 class="variant-title">Product Variants</h5>
                                    <div class="table-responsive">
                                        <table class="table variant-table align-middle text-center"
                                            style="font-size: 0.95em;">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th style="width:90px;">Variant Image</th>
                                                    <th>Name</th>
                                                    <th>Attributes</th>
                                                    <th>Purchase Price</th>
                                                    <th>Selling Price</th>
                                                    <th>Stock</th>
                                                    <th>Status</th>
                                                    <th>Default</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($product->variants as $variant)
                                                    <tr class="{{ $variant->is_default ? 'table-success' : '' }}">
                                                        <td>{{ $variant->id }}</td>
                                                        <!-- Variant Image -->
                                                        <td>
                                                            @if ($variant->images)
                                                                @php
                                                                    $images = null;
                                                                    if (is_string($variant->images)) {
                                                                        $images = json_decode($variant->images, true);
                                                                    } elseif (is_array($variant->images)) {
                                                                        $images = $variant->images;
                                                                    }
                                                                    $firstImage = null;
                                                                    if (is_array($images) && !empty($images)) {
                                                                        $firstImage = $images[0];
                                                                    }
                                                                @endphp
                                                                @if ($firstImage)
                                                                    <img src="{{ asset($firstImage) }}" alt="Variant Image"
                                                                        style="width:80px;height:80px;object-fit:cover;border-radius:8px;">
                                                                @else
                                                                    <img src="{{ asset('uploads/default/default.jpg') }}"
                                                                        alt="Default Image"
                                                                        style="width:80px;height:80px;object-fit:cover;border-radius:8px;">
                                                                @endif
                                                            @else
                                                                <img src="{{ asset('uploads/default/default.jpg') }}"
                                                                    alt="Default Image"
                                                                    style="width:80px;height:80px;object-fit:cover;border-radius:8px;">
                                                            @endif
                                                        </td>
                                                        <td style="max-width:140px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
                                                            {{ is_array($variant->name) ? implode(', ', $variant->name) : $variant->name }}
                                                        </td>
                                                        <td>
                                                            <div style="display: flex; flex-direction: column; gap: 8px; align-items: flex-start;">
                                                                @foreach ($variant->combinations as $combination)
                                                                    <div class="variant-attribute mb-1" style="font-size:0.95em; display: flex; align-items: center; gap: 8px; background: #f4f6f8; padding: 8px 14px; border-radius: 8px;">
                                                                        <span class="variant-attribute-name" style="color: #6c757d; min-width: 60px;">{{ is_array($combination->attributeValue->attributeType->name) ? implode(', ', $combination->attributeValue->attributeType->name) : $combination->attributeValue->attributeType->name }}:</span>
                                                                        <span class="variant-attribute-value" style="color: #222; font-weight: 500;">
                                                                            @if (is_array($combination->attributeValue->value))
                                                                                {{ implode(', ', $combination->attributeValue->value) }}
                                                                            @else
                                                                                {{ $combination->attributeValue->value }}
                                                                            @endif
                                                                        </span>
                                                                        @if ($combination->attributeValue->hex)
                                                                            <span class="color-box ms-2" style="display:inline-block;width:20px;height:20px;border-radius:50%;border:1px solid #ccc;box-shadow:0 1px 4px rgba(0,0,0,0.10);background:{{ is_array($combination->attributeValue->hex) ? implode(', ', $combination->attributeValue->hex) : $combination->attributeValue->hex }};"></span>
                                                                        @endif
                                                                    </div>
                                                                @endforeach
                                                            </div>
                                                        </td>
                                                        <td>{{ number_format($variant->purchase_price, 0, ',', '.') }} VNĐ
                                                        </td>
                                                        <td><span
                                                                class="text-success fw-bold">{{ number_format($variant->selling_price, 0, ',', '.') }}
                                                                VNĐ</span></td>
                                                        <td>
                                                            <span
                                                                class="stock-badge {{ $variant->stock > 0 ? 'stock-in' : 'stock-out' }}">
                                                                {{ $variant->stock }}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="status-badge {{ $variant->status === 'active' ? 'status-active' : 'status-inactive' }}">
                                                                {{ ucfirst(is_array($variant->status) ? implode(', ', $variant->status) : $variant->status) }}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="badge bg-{{ $variant->is_default ? 'success' : 'secondary' }}">
                                                                {{ $variant->is_default ? 'Default' : 'No' }}
                                                            </span>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
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
