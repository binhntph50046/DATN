@extends('admin.layouts.app')
@section('title', 'Product Details')

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
                                <h5 class="m-b-10">Product Details</h5>
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
                                <a href="{{ route('admin.products.edit', $product->id) }}" class="btn btn-info btn-sm rounded-3 me-2">
                                    <i class="ti ti-edit"></i> Edit Product
                                </a>
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
                                            <img src="{{ asset($product->image) }}" alt="{{ $product->name }}" class="product-image">
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
                                                    <p class="mb-2"><strong>Category:</strong> {{ $product->category->name ?? 'N/A' }}</p>
                                                    <p class="mb-2"><strong>Model:</strong> {{ $product->model ?? 'N/A' }}</p>
                                                    <p class="mb-2"><strong>Series:</strong> {{ $product->series ?? 'N/A' }}</p>
                                                    <p class="mb-2">
                                                        <strong>Price:</strong>
                                                        @if($product->discount_price)
                                                            <span class="text-decoration-line-through text-muted">{{ number_format($product->price) }} VNĐ</span>
                                                            <br>
                                                            <span class="text-danger fw-bold">{{ number_format($product->discount_price) }} VNĐ</span>
                                                        @else
                                                            {{ number_format($product->price) }} VNĐ
                                                        @endif
                                                    </p>
                                                    <p class="mb-2"><strong>Stock:</strong> {{ $product->stock }}</p>
                                                    <p class="mb-2"><strong>Warranty:</strong> {{ $product->warranty_months }} months</p>
                                                    <div class="mb-3">
                                                        <strong>Status:</strong>
                                                        <span class="badge {{ $product->status === 'active' ? 'bg-success' : 'bg-danger' }}">
                                                            {{ ucfirst($product->status) }}
                                                        </span>
                                                        @if($product->is_featured)
                                                            <span class="badge bg-info ms-2">Featured</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Right Column: Specs and Features -->
                                            <div class="product-specs-features">
                                                <!-- Specifications -->
                                                @if($product->specifications)
                                                    <div class="info-section">
                                                        <h5 class="mb-3">Specifications</h5>
                                                        @foreach($product->specifications as $spec)
                                                            <div class="spec-item">
                                                                <strong>{{ $spec['key'] }}:</strong>
                                                                <span>{{ $spec['value'] }}</span>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                @endif

                                                <!-- Features -->
                                                @if($product->features)
                                                    <div class="info-section">
                                                        <h5 class="mb-3">Features</h5>
                                                        @foreach($product->features as $feature)
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
                            @if($product->description)
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
                            @if($product->content)
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
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection 