<!-- resources/views/admin/products/trash.blade.php -->
@extends('admin.layouts.app')
@section('title', 'Product Trash')

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
                            <h5 class="m-b-10">Product Trash</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                            <li class="breadcrumb-item" aria-current="page">Trash</li>
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
                        <h5>Deleted Products</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">Back to List</a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif

                        @if ($products->isEmpty())
                            <p>No deleted products found.</p>
                        @else
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Image</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Selling Price</th>
                                            <th>Stock</th>
                                            <th>Status</th>
                                            <th>Has Variants</th>
                                            <th>Deleted At</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($products as $index => $product)
                                            <tr>
                                                <td>{{ $products->firstItem() + $index }}</td>
                                                <td>
                                                    @if ($product->image)
                                                        <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;">
                                                    @else
                                                        <span class="badge bg-secondary">No image</span>
                                                    @endif
                                                </td>
                                                <td>{{ $product->name }}</td>
                                                <td>{{ $product->category ? $product->category->name : 'N/A' }}</td>
                                                <td>{{ number_format($product->selling_price ?? 0) }} VNĐ</td>
                                                <td>{{ $product->stock }}</td>
                                                <td>
                                                    <span class="badge {{ $product->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                                        {{ ucfirst($product->status) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="badge {{ $product->has_variants ? 'bg-success' : 'bg-secondary' }}">
                                                        {{ $product->has_variants ? 'Yes' : 'No' }}
                                                    </span>
                                                </td>
                                                <td>{{ $product->deleted_at ? $product->deleted_at->format('d/m/Y H:i') : 'N/A' }}</td>
                                                <td>
                                                    <form action="{{ route('admin.products.restore', $product->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to restore this product?');">
                                                        @csrf
                                                        <button type="submit" class="btn btn-sm btn-success">Restore</button>
                                                    </form>
                                                    <form action="{{ route('admin.products.forceDelete', $product->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to permanently delete this product?');">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-sm btn-danger">Force Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="d-flex justify-content-center">
                                {{ $products->links() }}
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