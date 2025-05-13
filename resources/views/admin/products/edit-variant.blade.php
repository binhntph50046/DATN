<!-- resources/views/admin/products/edit-variant.blade.php -->
@extends('admin.layouts.app')
@section('title', 'Edit Variant Product')

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
                            <h5 class="m-b-10">Edit Variant Product</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                            <li class="breadcrumb-item" aria-current="page">Edit Variant</li>
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
                        <h5>Edit Variant Product: {{ $product->name }}</h5>
                    </div>
                    <div class="card-body">
                        @if (session('error'))
                            <div class="alert alert-danger">{{ session('error') }}</div>
                        @endif
                        <form action="{{ route('admin.products.update', $product) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="has_variants" value="1">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name', $product->name) }}">
                                        @error('name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="slug" id="slug" value="{{ old('slug', $product->slug) }}">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="category_id" class="form-label">Category</label>
                                        <select class="form-select @error('category_id') is-invalid @enderror" id="category_id" name="category_id">
                                            <option value="">-- Select Category --</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}" {{ old('category_id', $product->category_id) == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('category_id')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select @error('status') is-invalid @enderror" id="status" name="status">
                                            <option value="active" {{ old('status', $product->status) == 'active' ? 'selected' : '' }}>Active</option>
                                            <option value="inactive" {{ old('status', $product->status) == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                        </select>
                                        @error('status')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="stock" class="form-label">Stock (default for all variants)</label>
                                        <input type="number" class="form-control @error('stock') is-invalid @enderror" id="stock" name="stock" value="{{ old('stock', $product->variants->first()->stock ?? 0) }}" min="0">
                                        @error('stock')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="purchase_price" class="form-label">Purchase Price (default for all variants)</label>
                                        <input type="number" class="form-control @error('purchase_price') is-invalid @enderror" id="purchase_price" name="purchase_price" value="{{ old('purchase_price', $product->variants->first()->purchase_price ?? 0) }}" min="0" step="0.01">
                                        @error('purchase_price')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="selling_price" class="form-label">Selling Price (default for all variants)</label>
                                        <input type="number" class="form-control @error('selling_price') is-invalid @enderror" id="selling_price" name="selling_price" value="{{ old('selling_price', $product->variants->first()->selling_price ?? 0) }}" min="0" step="0.01">
                                        @error('selling_price')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="discount_price" class="form-label">Discount Price (optional, default for all variants)</label>
                                        <input type="number" class="form-control @error('discount_price') is-invalid @enderror" id="discount_price" name="discount_price" value="{{ old('discount_price', $product->variants->first()->discount_price ?? '') }}" min="0" step="0.01">
                                        @error('discount_price')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="image" class="form-label">Image (default for all variants)</label>
                                        <input type="file" class="form-control @error('image') is-invalid @enderror" id="image" name="image">
                                        @if ($product->variants->first() && $product->variants->first()->image)
                                            <img src="{{ asset('storage/' . $product->variants->first()->image) }}" alt="{{ $product->name }}" class="img-thumbnail mt-2" style="max-width: 150px;">
                                        @endif
                                        @error('image')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <!-- Product Attributes -->
                            <div class="mb-3">
                                <label class="form-label">Product Attributes</label>
                                <div id="product-attributes">
                                    @foreach ($product->attributes as $index => $attribute)
                                        <div class="row mb-2">
                                            <div class="col-md-5">
                                                <select class="form-select" name="product_attributes[{{ $index }}][attribute_type_id]">
                                                    <option value="">-- Select Attribute --</option>
                                                    @foreach ($attributeTypes as $attributeType)
                                                        <option value="{{ $attributeType->id }}" {{ $attribute->attribute_type_id == $attributeType->id ? 'selected' : '' }}>
                                                            {{ $attributeType->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" name="product_attributes[{{ $index }}][value]" value="{{ $attribute->value }}" placeholder="Value">
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-danger remove-attribute">Remove</button>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-attribute">Add Attribute</button>
                            </div>

                            <!-- Variant Attributes -->
                            <div class="mb-3">
                                <label class="form-label">Variant Attributes</label>
                                <div id="variant-attributes">
                                    @php
                                        $variantAttributes = [];
                                        foreach ($product->variants as $variant) {
                                            foreach ($variant->attributes as $attr) {
                                                if (!isset($variantAttributes[$attr->attribute_type_id])) {
                                                    $variantAttributes[$attr->attribute_type_id] = [];
                                                }
                                                $variantAttributes[$attr->attribute_type_id][] = $attr->value;
                                            }
                                        }
                                    @endphp
                                    @foreach ($variantAttributes as $typeId => $values)
                                        <div class="row mb-2">
                                            <div class="col-md-5">
                                                <select class="form-select" name="attribute_values[{{ $loop->index }}][attribute_type_id]">
                                                    <option value="">-- Select Attribute --</option>
                                                    @foreach ($attributeTypes as $attributeType)
                                                        <option value="{{ $attributeType->id }}" {{ $typeId == $attributeType->id ? 'selected' : '' }}>
                                                            {{ $attributeType->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" name="attribute_values[{{ $loop->index }}][values]" value="{{ implode(',', array_unique($values)) }}" placeholder="Values (comma-separated, e.g., Red,Blue,Green)">
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-danger remove-variant-attribute">Remove</button>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-variant-attribute">Add Variant Attribute</button>
                            </div>

                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Update Variant Product</button>
                                <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">Back</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>

<script>
    // Add Product Attribute
    document.getElementById('add-attribute').addEventListener('click', function () {
        const container = document.getElementById('product-attributes');
        const index = container.children.length;
        const newRow = `
            <div class="row mb-2">
                <div class="col-md-5">
                    <select class="form-select" name="product_attributes[${index}][attribute_type_id]">
                        <option value="">-- Select Attribute --</option>
                        @foreach ($attributeTypes as $attributeType)
                            <option value="{{ $attributeType->id }}">{{ $attributeType->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" name="product_attributes[${index}][value]" placeholder="Value">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger remove-attribute">Remove</button>
                </div>
            </div>`;
        container.insertAdjacentHTML('beforeend', newRow);
    });

    // Add Variant Attribute
    document.getElementById('add-variant-attribute').addEventListener('click', function () {
        const container = document.getElementById('variant-attributes');
        const index = container.children.length;
        const newRow = `
            <div class="row mb-2">
                <div class="col-md-5">
                    <select class="form-select" name="attribute_values[${index}][attribute_type_id]">
                        <option value="">-- Select Attribute --</option>
                        @foreach ($attributeTypes as $attributeType)
                            <option value="{{ $attributeType->id }}">{{ $attributeType->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" name="attribute_values[${index}][values]" placeholder="Values (comma-separated, e.g., Red,Blue,Green)">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger remove-variant-attribute">Remove</button>
                </div>
            </div>`;
        container.insertAdjacentHTML('beforeend', newRow);
    });

    // Remove Attribute
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-attribute')) {
            e.target.closest('.row').remove();
        }
        if (e.target.classList.contains('remove-variant-attribute')) {
            e.target.closest('.row').remove();
        }
    });

    document.getElementById('name').addEventListener('input', function() {
        let slug = this.value
            .toLowerCase()
            .replace(/[^a-z0-9-]/g, '-')
            .replace(/-+/g, '-')
            .replace(/^-|-$/g, '');
        document.getElementById('slug').value = slug;
    });
</script>
@endsection