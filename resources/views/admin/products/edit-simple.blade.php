@extends('admin.layouts.app')
@section('title', 'Edit Simple Product')

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
                            <h5 class="m-b-10">Edit Simple Product</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                            <li class="breadcrumb-item" aria-current="page">Edit Simple</li>
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
                        <h5>Edit Simple Product: {{ $product->name }}</h5>
                    </div>
                    <div class="card-body">
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <form action="{{ route('admin.products.update', $product) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="has_variants" value="0">
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
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description (optional)</label>
                                    <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description">{{ old('description', $product->description) }}</textarea>
                                    @error('description')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="content" class="form-label">Content (optional)</label>
                                    <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content" rows="10">{{ old('content', $product->content) }}</textarea>
                                    @error('content')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
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
                                        <label for="warranty_months" class="form-label">Warranty Months</label>
                                        <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', $product->warranty_months) }}" min="0">
                                        @error('warranty_months')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="model" class="form-label">Model (optional)</label>
                                        <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model', $product->model) }}">
                                        @error('model')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="series" class="form-label">Series (optional)</label>
                                        <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series', $product->series) }}">
                                        @error('series')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="is_featured" class="form-label">Featured Product</label>
                                        <select class="form-select @error('is_featured') is-invalid @enderror" id="is_featured" name="is_featured">
                                            <option value="0" {{ old('is_featured', $product->is_featured) == 0 ? 'selected' : '' }}>No</option>
                                            <option value="1" {{ old('is_featured', $product->is_featured) == 1 ? 'selected' : '' }}>Yes</option>
                                        </select>
                                        @error('is_featured')
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
                                        <label for="stock" class="form-label">Stock</label>
                                        <input type="number" class="form-control @error('stock') is-invalid @enderror" id="stock" name="stock" value="{{ old('stock', $product->variants->first()->stock ?? 0) }}" min="0">
                                        @error('stock')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="purchase_price" class="form-label">Purchase Price</label>
                                        <input type="number" class="form-control @error('purchase_price') is-invalid @enderror" id="purchase_price" name="purchase_price" value="{{ old('purchase_price', $product->variants->first()->purchase_price ?? 0) }}" min="0" step="0.01">
                                        @error('purchase_price')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="selling_price" class="form-label">Selling Price</label>
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
                                        <label for="discount_price" class="form-label">Discount Price (optional)</label>
                                        <input type="number" class="form-control @error('discount_price') is-invalid @enderror" id="discount_price" name="discount_price" value="{{ old('discount_price', $product->variants->first()->discount_price ?? '') }}" min="0" step="0.01">
                                        @error('discount_price')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="image" class="form-label">Image</label>
                                        <input type="file" class="form-control @error('image') is-invalid @enderror" id="image" name="image" accept="image/*">
                                        <div id="image-preview" class="mt-2">
                                            @if ($product->variants->first() && $product->variants->first()->image)
                                                <img src="{{ asset('Uploads/' . $product->variants->first()->image) }}" alt="{{ $product->name }}" class="img-thumbnail" style="max-width: 150px;">
                                            @endif
                                        </div>
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
                                    @if ($product->attributes->isEmpty())
                                        <div class="row mb-2">
                                            <div class="col-md-4">
                                                <select class="form-select @error('product_attributes.0.attribute_type_id') is-invalid @enderror" name="product_attributes[0][attribute_type_id]">
                                                    <option value="">-- Select Attribute --</option>
                                                    @foreach ($attributeTypes as $attributeType)
                                                        <option value="{{ $attributeType->id }}" {{ old('product_attributes.0.attribute_type_id') == $attributeType->id ? 'selected' : '' }}>
                                                            {{ $attributeType->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                @error('product_attributes.0.attribute_type_id')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control @error('product_attributes.0.value') is-invalid @enderror" name="product_attributes[0][value]" value="{{ old('product_attributes.0.value') }}" placeholder="Value">
                                                @error('product_attributes.0.value')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control @error('product_attributes.0.hex') is-invalid @enderror" name="product_attributes[0][hex]" value="{{ old('product_attributes.0.hex') }}" placeholder="Hex Code (e.g., #FFFFFF)">
                                                @error('product_attributes.0.hex')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-danger remove-attribute">Remove</button>
                                            </div>
                                        </div>
                                    @else
                                        @foreach ($product->attributes as $index => $attribute)
                                            <div class="row mb-2">
                                                <div class="col-md-4">
                                                    <select class="form-select @error('product_attributes.' . $index . '.attribute_type_id') is-invalid @enderror" name="product_attributes[{{ $index }}][attribute_type_id]">
                                                        <option value="">-- Select Attribute --</option>
                                                        @foreach ($attributeTypes as $attributeType)
                                                            <option value="{{ $attributeType->id }}" {{ old('product_attributes.' . $index . '.attribute_type_id', $attribute->attribute_type_id ?? ($attributeType->name == $attribute->attribute_name ? $attributeType->id : '')) == $attributeType->id ? 'selected' : '' }}>
                                                                {{ $attributeType->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    @error('product_attributes.' . $index . '.attribute_type_id')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" class="form-control @error('product_attributes.' . $index . '.value') is-invalid @enderror" name="product_attributes[{{ $index }}][value]" value="{{ old('product_attributes.' . $index . '.value', $attribute->attribute_value) }}" placeholder="Value">
                                                    @error('product_attributes.' . $index . '.value')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" class="form-control @error('product_attributes.' . $index . '.hex') is-invalid @enderror" name="product_attributes[{{ $index }}][hex]" value="{{ old('product_attributes.' . $index . '.hex', $attribute->hex) }}" placeholder="Hex Code (e.g., #FFFFFF)">
                                                    @error('product_attributes.' . $index . '.hex')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <div class="col-md-2">
                                                    <button type="button" class="btn btn-danger remove-attribute">Remove</button>
                                                </div>
                                            </div>
                                        @endforeach
                                    @endif
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-attribute">Add Attribute</button>
                            </div>

                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Update Simple Product</button>
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
    document.getElementById('add-attribute').addEventListener('click', function () {
        const container = document.getElementById('product-attributes');
        const index = container.children.length;
        const newRow = `
            <div class="row mb-2">
                <div class="col-md-4">
                    <select class="form-select" name="product_attributes[${index}][attribute_type_id]">
                        <option value="">-- Select Attribute --</option>
                        @foreach ($attributeTypes as $attributeType)
                            <option value="{{ $attributeType->id }}">{{ $attributeType->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="product_attributes[${index}][value]" placeholder="Value">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="product_attributes[${index}][hex]" placeholder="Hex Code (e.g., #FFFFFF)">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger remove-attribute">Remove</button>
                </div>
            </div>`;
        container.insertAdjacentHTML('beforeend', newRow);
    });

    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-attribute')) {
            e.target.closest('.row').remove();
        }
    });

    document.getElementById('name').addEventListener('input', function() {
        let slug = this.value
            .toLowerCase()
            .trim()
            .replace(/[^a-z0-9\s-]/g, '') // Remove special characters
            .replace(/\s+/g, '-')         // Replace spaces with hyphens
            .replace(/-+/g, '-');         // Replace multiple hyphens with single hyphen
        document.getElementById('slug').value = slug;
    });

    // Add image preview functionality
    document.getElementById('image').addEventListener('change', function(e) {
        const preview = document.getElementById('image-preview');
        const file = e.target.files[0];
        
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.innerHTML = `<img src="${e.target.result}" alt="Preview" class="img-thumbnail" style="max-width: 150px;">`;
            }
            reader.readAsDataURL(file);
        } else {
            // If no file is selected, show the original image if it exists
            @if ($product->variants->first() && $product->variants->first()->image)
                preview.innerHTML = `<img src="{{ asset('Uploads/' . $product->variants->first()->image) }}" alt="{{ $product->name }}" class="img-thumbnail" style="max-width: 150px;">`;
            @else
                preview.innerHTML = '';
            @endif
        }
    });
</script>
@endsection