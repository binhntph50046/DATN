@extends('admin.layouts.app')
@section('title', 'Edit Product')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
    .variant-section {
        display: none;
    }
    .non-variant-section {
        display: none;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    .form-label {
        font-weight: 500;
        margin-bottom: 0.5rem;
    }
    .variant-item {
        background-color: #f8f9fa;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    .variant-item:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .variant-attribute-item {
        background-color: #fff;
        border: 1px solid #e9ecef;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    .variant-attribute-item:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .feature-item, .specification-item {
        background-color: #fff;
        border: 1px solid #e9ecef;
        border-radius: 8px;
        padding: 10px;
        margin-bottom: 10px;
        transition: all 0.3s ease;
    }
    .feature-item:hover, .specification-item:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
                                <h5 class="m-b-10">Edit Product</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">Edit</li>
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
                            <h5>Edit Product</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.products.update', $product->id) }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group mb-3">
                                            <label for="name" class="form-label">Product Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name', $product->name) }}" required>
                                            @error('name')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="description" class="form-label">Description</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description', $product->description) }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="content" class="form-label">Content</label>
                                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content">{{ old('content', $product->content) }}</textarea>
                                            @error('content')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group mb-3">
                                            <label for="category_id" class="form-label">Category <span class="text-danger">*</span></label>
                                            <select class="form-select @error('category_id') is-invalid @enderror" id="category_id" name="category_id" required>
                                                <option value="">Select Category</option>
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

                                        <div class="form-group mb-3">
                                            <label for="has_variants" class="form-label">Product Type <span class="text-danger">*</span></label>
                                            <select class="form-select @error('has_variants') is-invalid @enderror" id="has_variants" name="has_variants" required>
                                                <option value="0" {{ old('has_variants', $product->has_variants) == '0' ? 'selected' : '' }}>Simple Product</option>
                                                <option value="1" {{ old('has_variants', $product->has_variants) == '1' ? 'selected' : '' }}>Product with Variants</option>
                                            </select>
                                            @error('has_variants')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <!-- Non-variant product fields -->
                                        <div class="non-variant-section">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="purchase_price">Purchase Price <span class="text-danger">*</span></label>
                                                        <input type="number" name="purchase_price" id="purchase_price" class="form-control @error('purchase_price') is-invalid @enderror" value="{{ old('purchase_price', $product->purchase_price) }}" required>
                                                        @error('purchase_price')
                                                            <div class="invalid-feedback">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="selling_price">Selling Price <span class="text-danger">*</span></label>
                                                        <input type="number" name="selling_price" id="selling_price" class="form-control @error('selling_price') is-invalid @enderror" value="{{ old('selling_price', $product->selling_price) }}" required>
                                                        @error('selling_price')
                                                            <div class="invalid-feedback">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="sale_price">Sale Price</label>
                                                        <input type="number" name="sale_price" id="sale_price" class="form-control @error('sale_price') is-invalid @enderror" value="{{ old('sale_price', $product->sale_price) }}">
                                                        @error('sale_price')
                                                            <div class="invalid-feedback">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="stock">Stock <span class="text-danger">*</span></label>
                                                        <input type="number" name="stock" id="stock" class="form-control @error('stock') is-invalid @enderror" value="{{ old('stock', $product->stock) }}" required>
                                                        @error('stock')
                                                            <div class="invalid-feedback">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="image" class="form-label">Product Image</label>
                                                @if($product->image)
                                                    <div class="mb-2">
                                                        <img src="{{ asset($product->image) }}" alt="Current Image" class="img-thumbnail" style="max-height: 100px;">
                                                    </div>
                                                @endif
                                                <input type="file" class="form-control @error('image') is-invalid @enderror" id="image" name="image">
                                                @error('image')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="warranty_months">Warranty Months</label>
                                            <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', $product->warranty_months) }}" required>
                                            @error('warranty_months')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group">
                                            <label for="status">Status</label>
                                            <select class="form-control @error('status') is-invalid @enderror" id="status" name="status" required>
                                                <option value="active" {{ old('status', $product->status) == 'active' ? 'selected' : '' }}>Active</option>
                                                <option value="inactive" {{ old('status', $product->status) == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                            </select>
                                            @error('status')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <div class="form-check form-switch">
                                                <input type="checkbox" class="form-check-input" id="is_featured" name="is_featured" value="1" {{ old('is_featured', $product->is_featured) == 1 ? 'checked' : '' }}>
                                                <label class="form-check-label" for="is_featured">Featured Product</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="model" class="form-label">Model</label>
                                            <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model', $product->model) }}">
                                            @error('model')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="series" class="form-label">Series</label>
                                            <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series', $product->series) }}">
                                            @error('series')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <!-- Non-variant product attributes -->
                                <div class="non-variant-section">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Features</label>
                                        <div id="features-container" class="custom-shadow p-3">
                                            @if(old('features'))
                                                @foreach(old('features') as $index => $feature)
                                                    <div class="feature-item mb-2">
                                                        <div class="row">
                                                            <div class="col-md-10">
                                                                <input type="text" class="form-control" name="features[]" value="{{ $feature }}" placeholder="Enter feature">
                                                            </div>
                                                            <div class="col-md-2">
                                                                <button type="button" class="btn btn-danger btn-sm remove-feature">
                                                                    <i class="ti ti-trash"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @else
                                                @foreach($product->attributes->where('attribute_name', 'feature') as $index => $feature)
                                                    <div class="feature-item mb-2">
                                                        <div class="row">
                                                            <div class="col-md-10">
                                                                <input type="text" class="form-control" name="features[]" value="{{ $feature->attribute_value }}" placeholder="Enter feature">
                                                            </div>
                                                            <div class="col-md-2">
                                                                <button type="button" class="btn btn-danger btn-sm remove-feature">
                                                                    <i class="ti ti-trash"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="add-feature">
                                            <i class="ti ti-plus"></i> Add Feature
                                        </button>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="form-label">Specifications</label>
                                        <div id="specifications-container" class="custom-shadow p-3">
                                            @if(old('specifications'))
                                                @foreach(old('specifications') as $index => $spec)
                                                    <div class="specification-item mb-2">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="specifications[{{ $index }}][key]" value="{{ $spec['key'] }}" placeholder="Specification name">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <input type="text" class="form-control" name="specifications[{{ $index }}][value]" value="{{ $spec['value'] }}" placeholder="Value">
                                                            </div>
                                                            <div class="col-md-2">
                                                                <button type="button" class="btn btn-danger btn-sm remove-specification">
                                                                    <i class="ti ti-trash"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @else
                                                @foreach($product->attributes->whereNotIn('attribute_name', ['feature']) as $index => $spec)
                                                    <div class="specification-item mb-2">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="specifications[{{ $index }}][key]" value="{{ $spec->attribute_name }}" placeholder="Specification name">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <input type="text" class="form-control" name="specifications[{{ $index }}][value]" value="{{ $spec->attribute_value }}" placeholder="Value">
                                                            </div>
                                                            <div class="col-md-2">
                                                                <button type="button" class="btn btn-danger btn-sm remove-specification">
                                                                    <i class="ti ti-trash"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="add-specification">
                                            <i class="ti ti-plus"></i> Add Specification
                                        </button>
                                    </div>
                                </div>

                                <!-- Variant product section -->
                                <div class="variant-section">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Variant Attributes</label>
                                        <div id="variant-attributes-container" class="custom-shadow p-3">
                                            <div class="alert alert-info mb-3">
                                                <h6 class="alert-heading"><i class="ti ti-info-circle me-2"></i>Variant Attribute Guide:</h6>
                                                <ol class="mb-0">
                                                    <li><strong>Attribute name:</strong> Name of the attribute (e.g., Color, Size)</li>
                                                    <li><strong>Display names:</strong> Display names for each value, separated by commas (e.g., Natural Titanium, Rose Gold)</li>
                                                    <li><strong>Values:</strong> Values of the attribute, separated by commas (e.g., #B8A78B, #F7C7C5)</li>
                                                </ol>
                                            </div>
                                            @if(old('attributes'))
                                                @foreach(old('attributes') as $index => $attribute)
                                                    <div class="variant-attribute-item mb-2 p-3 border rounded bg-light">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <input type="text" class="form-control" name="attributes[{{ $index }}][name]" value="{{ $attribute['name'] }}" placeholder="Attribute name (e.g. Color, Size)">
                                                            </div>
                                                            <div class="col-md-3">
                                                                <input type="text" class="form-control" name="attributes[{{ $index }}][display_name]" value="{{ $attribute['display_name'] }}" placeholder="Display names (e.g. Natural Titanium, Rose Gold)">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="attributes[{{ $index }}][values][]" value="{{ is_array($attribute['values']) ? implode(',', $attribute['values']) : $attribute['values'] }}" placeholder="Values (e.g. #B8A78B, #F7C7C5)">
                                                            </div>
                                                            <div class="col-md-2">
                                                                <button type="button" class="btn btn-danger btn-sm remove-variant-attribute">
                                                                    <i class="ti ti-trash"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @else
                                                @foreach($product->variants->first()->attributes ?? [] as $index => $attribute)
                                                    <div class="variant-attribute-item mb-2 p-3 border rounded bg-light">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <input type="text" class="form-control" name="attributes[{{ $index }}][name]" value="{{ $attribute->name }}" placeholder="Attribute name (e.g. Color, Size)">
                                                            </div>
                                                            <div class="col-md-3">
                                                                <input type="text" class="form-control" name="attributes[{{ $index }}][display_name]" value="{{ $attribute->display_name }}" placeholder="Display names (e.g. Natural Titanium, Rose Gold)">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="attributes[{{ $index }}][values][]" value="{{ $attribute->value }}" placeholder="Values (e.g. #B8A78B, #F7C7C5)">
                                                            </div>
                                                            <div class="col-md-2">
                                                                <button type="button" class="btn btn-danger btn-sm remove-variant-attribute">
                                                                    <i class="ti ti-trash"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="add-variant-attribute">
                                            <i class="ti ti-plus"></i> Add Variant Attribute
                                        </button>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="form-label">Variants</label>
                                        <div id="variants-container" class="custom-shadow p-3">
                                            @if(old('variants'))
                                                @foreach(old('variants') as $index => $variant)
                                                    <div class="variant-item mb-3 p-3 border rounded">
                                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                                            <h6 class="mb-0">Variant {{ $index + 1 }}</h6>
                                                            <div class="d-flex align-items-center">
                                                                <div class="form-check form-switch me-3">
                                                                    <input type="checkbox" class="form-check-input default-variant" name="variants[{{ $index }}][is_default]" value="1" {{ isset($variant['is_default']) ? 'checked' : '' }}>
                                                                    <label class="form-check-label">Set as Default</label>
                                                                </div>
                                                                <div class="form-check form-switch">
                                                                    <input type="checkbox" class="form-check-input" name="variants[{{ $index }}][status]" value="active" {{ isset($variant['status']) ? 'checked' : '' }}>
                                                                    <label class="form-check-label">Active</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">SKU</label>
                                                                    <input type="text" class="form-control" name="variants[{{ $index }}][sku]" value="{{ $variant['sku'] }}" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">Purchase Price</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][purchase_price]" value="{{ $variant['purchase_price'] }}" min="0" step="0.01" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">Selling Price</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][selling_price]" value="{{ $variant['selling_price'] }}" min="0" step="0.01" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">Stock</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][stock]" value="{{ $variant['stock'] }}" min="0" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="form-label">Sale Price</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][sale_price]" value="{{ $variant['sale_price'] ?? '' }}" min="0" step="0.01">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="form-label">Variant Image</label>
                                                                    @if(isset($variant['image']) && $variant['image'])
                                                                        <div class="mb-2">
                                                                            <img src="{{ asset($variant['image']) }}" alt="Variant Image" class="img-thumbnail" style="max-height: 100px;">
                                                                        </div>
                                                                    @endif
                                                                    <input type="file" class="form-control" name="variants[{{ $index }}][image]">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @else
                                                @foreach($product->variants as $index => $variant)
                                                    <div class="variant-item mb-3 p-3 border rounded">
                                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                                            <div>
                                                                <h5 class="mb-1">Variant {{ $index + 1 }}</h5>
                                                                <h6 class="text-primary mb-0">
                                                                    {{ $variant->attributes->map(function($attr) {
                                                                        return $attr->name . ': ' . ($attr->display_name ?: $attr->value);
                                                                    })->join(' | ') }}
                                                                </h6>
                                                            </div>
                                                            <div class="d-flex align-items-center">
                                                                <div class="form-check form-switch me-3">
                                                                    <input type="checkbox" class="form-check-input default-variant" name="variants[{{ $index }}][is_default]" value="1" {{ $variant->is_default ? 'checked' : '' }}>
                                                                    <label class="form-check-label">Set as Default</label>
                                                                </div>
                                                                <div class="form-check form-switch">
                                                                    <input type="checkbox" class="form-check-input" name="variants[{{ $index }}][status]" value="active" {{ $variant->status == 'active' ? 'checked' : '' }}>
                                                                    <label class="form-check-label">Active</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">SKU</label>
                                                                    <input type="text" class="form-control" name="variants[{{ $index }}][sku]" value="{{ $variant->sku }}" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">Purchase Price</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][purchase_price]" value="{{ $variant->purchase_price }}" min="0" step="0.01" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">Selling Price</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][selling_price]" value="{{ $variant->selling_price }}" min="0" step="0.01" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="form-label">Stock</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][stock]" value="{{ $variant->stock }}" min="0" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="form-label">Sale Price</label>
                                                                    <input type="number" class="form-control" name="variants[{{ $index }}][sale_price]" value="{{ $variant->sale_price }}" min="0" step="0.01">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="form-label">Variant Image</label>
                                                                    @if($variant->image)
                                                                        <div class="mb-2">
                                                                            <img src="{{ asset($variant->image) }}" alt="Variant Image" class="img-thumbnail" style="max-height: 100px;">
                                                                        </div>
                                                                    @endif
                                                                    <input type="file" class="form-control" name="variants[{{ $index }}][image]">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="generate-variants">
                                            <i class="ti ti-refresh"></i> Generate Variants
                                        </button>
                                    </div>
                                </div>

                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-primary">Update Product</button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js"
        integrity="sha512-OF6VwfoBrM/wE3gt0I/lTh1ElROdq3etwAquhEm2YI45Um4ird+0ZFX1IwuBDBRufdXBuYoBb0mqXrmUA2VnOA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function() {
            // Initialize CKEditor
            CKEDITOR.replaceAll('snettech-editor');

            // Function to toggle sections based on product type
            function toggleSections() {
                const hasVariants = $('#has_variants').val() === '1';
                $('.variant-section').toggle(hasVariants);
                $('.non-variant-section').toggle(!hasVariants);

                // Clear fields when switching product type
                if (hasVariants) {
                    // Clear non-variant fields
                    $('#purchase_price, #selling_price, #sale_price, #stock').val('');
                    $('#features-container, #specifications-container').empty();
                } else {
                    // Clear variant fields
                    $('#variant-attributes-container, #variants-container').empty();
                }
            }

            // Handle product type change
            $('#has_variants').change(function() {
                if (confirm('Changing product type will clear all existing data. Are you sure you want to continue?')) {
                    toggleSections();
                } else {
                    // Revert selection
                    $(this).val($(this).val() === '1' ? '0' : '1');
                }
            });

            // Initial toggle
            toggleSections();

            // Add feature
            $('#add-feature').click(function() {
                const featureHtml = `
                    <div class="feature-item mb-2">
                        <div class="row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="features[]" placeholder="Enter feature">
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-danger btn-sm remove-feature">
                                    <i class="ti ti-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
                $('#features-container').append(featureHtml);
            });

            // Remove feature
            $(document).on('click', '.remove-feature', function() {
                $(this).closest('.feature-item').remove();
            });

            // Add specification
            $('#add-specification').click(function() {
                const specCount = $('.specification-item').length;
                const specHtml = `
                    <div class="specification-item mb-2">
                        <div class="row">
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="specifications[${specCount}][key]" placeholder="Specification name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="specifications[${specCount}][value]" placeholder="Value">
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-danger btn-sm remove-specification">
                                    <i class="ti ti-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
                $('#specifications-container').append(specHtml);
            });

            // Remove specification
            $(document).on('click', '.remove-specification', function() {
                $(this).closest('.specification-item').remove();
            });

            // Add variant attribute
            $('#add-variant-attribute').click(function() {
                const attrCount = $('.variant-attribute-item').length;
                const attrHtml = `
                    <div class="variant-attribute-item mb-2 p-3 border rounded bg-light">
                        <div class="row">
                            <div class="col-md-3">
                                <input type="text" class="form-control" name="attributes[${attrCount}][name]" placeholder="Attribute name (e.g. Color, Size)">
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" name="attributes[${attrCount}][display_name]" placeholder="Display names (e.g. Natural Titanium, Rose Gold)">
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="attributes[${attrCount}][values][]" placeholder="Values (e.g. #B8A78B, #F7C7C5)">
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-danger btn-sm remove-variant-attribute">
                                    <i class="ti ti-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
                $('#variant-attributes-container').append(attrHtml);
            });

            // Remove variant attribute
            $(document).on('click', '.remove-variant-attribute', function() {
                $(this).closest('.variant-attribute-item').remove();
            });

            // Generate variants
            $('#generate-variants').click(function() {
                const attributes = [];
                $('.variant-attribute-item').each(function() {
                    const name = $(this).find('input[name$="[name]"]').val();
                    const displayName = $(this).find('input[name$="[display_name]"]').val();
                    const values = $(this).find('input[name$="[values][]"]').val().split(',').map(v => v.trim());
                    
                    if (name && values.length > 0) {
                        attributes.push({ 
                            name: name,
                            displayName: displayName,
                            values: values
                        });
                    }
                });

                if (attributes.length === 0) {
                    alert('Please add at least one variant attribute');
                    return;
                }

                // Generate all possible combinations
                const combinations = generateCombinations(attributes);
                
                // Display variants
                let variantHtml = '';
                combinations.forEach((combo, index) => {
                    variantHtml += `
                        <div class="variant-item mb-3 p-3 border rounded">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h5 class="mb-1">Variant ${index + 1}</h5>
                                    <h6 class="text-primary mb-0">
                                        ${combo.map(attr => `${attr.name}: ${attr.displayName || attr.value}`).join(' | ')}
                                    </h6>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="form-check form-switch me-3">
                                        <input type="checkbox" class="form-check-input default-variant" name="variants[${index}][is_default]" value="1">
                                        <label class="form-check-label">Set as Default</label>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input type="checkbox" class="form-check-input" name="variants[${index}][status]" value="active" checked>
                                        <label class="form-check-label">Active</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-label">SKU</label>
                                        <input type="text" class="form-control" name="variants[${index}][sku]" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-label">Purchase Price</label>
                                        <input type="number" class="form-control" name="variants[${index}][purchase_price]" min="0" step="0.01" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-label">Selling Price</label>
                                        <input type="number" class="form-control" name="variants[${index}][selling_price]" min="0" step="0.01" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-label">Stock</label>
                                        <input type="number" class="form-control" name="variants[${index}][stock]" min="0" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Sale Price</label>
                                        <input type="number" class="form-control" name="variants[${index}][sale_price]" min="0" step="0.01">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Variant Image</label>
                                        <input type="file" class="form-control" name="variants[${index}][image]">
                                    </div>
                                </div>
                            </div>
                            <div class="variant-attributes" style="display: none;">
                                ${combo.map(attr => `
                                    <input type="hidden" name="variants[${index}][attributes][${attr.name}][name]" value="${attr.name}">
                                    <input type="hidden" name="variants[${index}][attributes][${attr.name}][value]" value="${attr.value}">
                                    <input type="hidden" name="variants[${index}][attributes][${attr.name}][display_name]" value="${attr.displayName}">
                                `).join('')}
                            </div>
                        </div>
                    `;
                });

                $('#variants-container').html(variantHtml);
            });

            // Helper function to generate combinations
            function generateCombinations(attributes) {
                const result = [];
                const generate = (current, index) => {
                    if (index === attributes.length) {
                        result.push([...current]);
                        return;
                    }
                    
                    const attribute = attributes[index];
                    for (let i = 0; i < attribute.values.length; i++) {
                        current.push({
                            name: attribute.name,
                            value: attribute.values[i],
                            displayName: attribute.displayName ? attribute.displayName.split(',')[i]?.trim() : null
                        });
                        generate(current, index + 1);
                        current.pop();
                    }
                };
                
                generate([], 0);
                return result;
            }

            // Handle default variant selection
            $(document).on('change', '.default-variant', function() {
                if ($(this).is(':checked')) {
                    $('.default-variant').not(this).prop('checked', false);
                }
            });
        });
    </script>
@endpush
