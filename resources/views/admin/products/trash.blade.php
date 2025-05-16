@extends('admin.layouts.app')
@section('title', 'Products Trash')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
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
@section('content')
<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Products Trash</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Trash</li>
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
                        <h5>Deleted Products List</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.products.index') }}" class="btn btn-secondary btn-sm rounded-3">
                                <i class="ti ti-arrow-left"></i> Back to Product List
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="table custom-shadow">
                            <table class="table table-hover table-borderless align-middle" style="font-size: 14px;">
                                <thead>
                                    <tr>
                                        <th class="text-nowrap">No.</th>
                                        <th>Image</th>
                                        <th class="text-nowrap">Product Name</th>
                                        <th class="text-nowrap">Category</th>
                                        <th class="text-nowrap">Selling Price</th>
                                        <th class="text-nowrap">Stock</th>
                                        <th class="text-nowrap">Type</th>
                                        <th class="text-nowrap">Status</th>
                                        <th class="text-nowrap">Featured</th>
                                        <th class="text-nowrap">Deleted At</th>
                                        <th class="text-center text-nowrap">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($products as $index => $product)
                                        <tr>
                                            <td class="text-nowrap">{{ $products->firstItem() + $index }}</td>
                                            <td>
                                                @if ($product->variants->first() && $product->variants->first()->image)
                                                    <img src="{{ asset('uploads/' . $product->variants->first()->image) }}"
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
                                                    {{ $product->has_variants ? 'Has Variants' : 'Simple' }}
                                                </span>
                                            </td>
                                            <td class="text-nowrap">
                                                <span class="badge {{ $product->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                                    {{ $product->status == 'active' ? 'Active' : 'Inactive' }}
                                                </span>
                                            </td>
                                            <td class="text-nowrap">
                                                <span class="badge {{ $product->is_featured ? 'bg-warning' : 'bg-secondary' }}">
                                                    {{ $product->is_featured ? 'Featured' : 'Not Featured' }}
                                                </span>
                                            </td>
                                            <td class="text-nowrap">{{ $product->deleted_at ? $product->deleted_at->format('d/m/Y H:i') : 'N/A' }}</td>
                                            <td class="text-center text-nowrap">
                                                <form action="{{ route('admin.products.restore', $product->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to restore this product?');">
                                                    @csrf
                                                    @method('PATCH')
                                                    <button type="submit" class="btn btn-success btn-sm rounded-3 me-2" title="Restore">
                                                        <i class="ti ti-arrow-back-up"></i>
                                                    </button>
                                                </form>
                                                <form action="{{ route('admin.products.forceDelete', $product->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this product permanently?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm rounded-3" title="Delete Permanently">
                                                        <i class="ti ti-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="11" class="text-center">No deleted products found.</td>
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