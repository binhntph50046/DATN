@extends('admin.layouts.app')
@section('title', 'Edit Variant Product')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
    .variant-row {
        border: 1px solid #ddd;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
    }
    .preview-image {
        max-width: 150px;
        max-height: 150px;
        margin-top: 10px;
    }
    .error-message {
        color: red;
        font-size: 0.9em;
        display: none;
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
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <form action="{{ route('admin.products.update', $product) }}" method="POST" enctype="multipart/form-data" id="variant-form">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="has_variants" value="1">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name', $product->name) }}" required>
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
                                        <label for="category_id" class="form-label">Category <span class="text-danger">*</span></label>
                                        <select class="form-select @error('category_id') is-invalid @enderror" id="category_id" name="category_id" required>
                                            <option value="">-- Select Category --</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}" {{ old('category_id', $product->category_id) == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('category_id')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="status" class="form-label">Status <span class="text-danger">*</span></label>
                                        <select class="form-select @error('status') is-invalid @enderror" id="status" name="status" required>
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
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description (Optional)</label>
                                        <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description', $product->description) }}</textarea>
                                        @error('description')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="content" class="form-label">Content (Optional)</label>
                                        <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content" rows="10">{{ old('content', $product->content) }}</textarea>
                                        @error('content')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="model" class="form-label">Model (Optional)</label>
                                        <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model', $product->model) }}">
                                        @error('model')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="series" class="form-label">Series (Optional)</label>
                                        <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series', $product->series) }}">
                                        @error('series')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="warranty_months" class="form-label">Warranty Months</label>
                                        <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', $product->warranty_months) }}" min="0" required>
                                        @error('warranty_months')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="is_featured" class="form-label">Is Featured</label>
                                        <select class="form-select @error('is_featured') is-invalid @enderror" id="is_featured" name="is_featured">
                                            <option value="0" {{ old('is_featured', $product->is_featured) == '0' ? 'selected' : '' }}>No</option>
                                            <option value="1" {{ old('is_featured', $product->is_featured) == '1' ? 'selected' : '' }}>Yes</option>
                                        </select>
                                        @error('is_featured')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <!-- Variant Attributes -->
                            <div class="mb-3">
                                <label class="form-label">Variant Attributes <span class="text-danger">*</span></label>
                                <div id="variant-attributes">
                                    @if($attributeValues)
                                        @foreach($attributeValues as $index => $attr)
                                            <div class="row mb-2 variant-row" data-index="{{ $index }}">
                                                <div class="col-md-4">
                                                    <select class="form-select attribute-type @error('variants.'.$index.'.attribute_type_id') is-invalid @enderror" name="variants[{{ $index }}][attribute_type_id]" id="attribute_type_{{ $index }}" required>
                                                        <option value="">-- Select Attribute --</option>
                                                        @foreach ($attributeTypes as $attributeType)
                                                            <option value="{{ $attributeType->id }}" {{ $attr['attribute_type_id'] == $attributeType->id ? 'selected' : '' }}>{{ $attributeType->name }}</option>
                                                        @endforeach
                                                    </select>
                                                    @error('variants.'.$index.'.attribute_type_id')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                    <div class="error-message" id="error-type-{{ $index }}">Please select an attribute type.</div>
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control attribute-values @error('variants.'.$index.'.attributes') is-invalid @enderror" name="variants[{{ $index }}][attributes][value]" id="values_{{ $index }}" placeholder="Value (e.g., Red)" value="{{ !empty($attr['values']) ? implode(',', $attr['values']) : '' }}" required>
                                                    @error('variants.'.$index.'.attributes')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                    <div class="error-message" id="error-values-{{ $index }}">Please enter a valid value.</div>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" class="form-control attribute-hex" name="variants[{{ $index }}][attributes][hex]" id="hex_{{ $index }}" placeholder="Hex Code (e.g., #FFFFFF)" value="{{ !empty($attr['hex']) ? implode(',', $attr['hex']) : '' }}">
                                                    @error('variants.'.$index.'.hex')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                    <div class="error-message" id="error-hex-{{ $index }}">Please enter a valid hex code or leave blank.</div>
                                                </div>
                                                <div class="col-md-1">
                                                    <button type="button" class="btn btn-danger remove-value" data-index="{{ $index }}">Remove</button>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <p>No variant attributes found. Click "Add Attribute" to create one.</p>
                                    @endif
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-value">Add Attribute</button>
                                <div class="error-message" id="error-duplicate" style="display: none;">Duplicate attribute types are not allowed.</div>
                                <div class="error-message" id="error-min-attributes" style="display: none;">Please add at least one attribute.</div>
                            </div>
                            <!-- Generated Variants (editable) -->
                            <div class="mb-3">
                                <label class="form-label">Variants</label>
                                <div id="variant-list">
                                    @if($product->variants->isNotEmpty())
                                        @foreach($product->variants as $index => $variant)
                                            <div class="variant-row" data-index="{{ $index }}">
                                                <h6>Variant {{ $index + 1 }}: {{ $variant->name }}</h6>
                                                <input type="hidden" name="variants[{{ $index }}][id]" value="{{ $variant->id }}">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name</label>
                                                            <input type="text" class="form-control @error('variants.'.$index.'.name') is-invalid @enderror" name="variants[{{ $index }}][name]" value="{{ old('variants.'.$index.'.name', $variant->name) }}" required>
                                                            @error('variants.'.$index.'.name')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Slug</label>
                                                            <input type="text" class="form-control @error('variants.'.$index.'.slug') is-invalid @enderror" name="variants[{{ $index }}][slug]" value="{{ old('variants.'.$index.'.slug', $variant->slug) }}" required>
                                                            @error('variants.'.$index.'.slug')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Stock</label>
                                                            <input type="number" class="form-control @error('variants.'.$index.'.stock') is-invalid @enderror" name="variants[{{ $index }}][stock]" value="{{ old('variants.'.$index.'.stock', $variant->stock) }}" min="0" required>
                                                            @error('variants.'.$index.'.stock')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Purchase Price</label>
                                                            <input type="number" class="form-control @error('variants.'.$index.'.purchase_price') is-invalid @enderror" name="variants[{{ $index }}][purchase_price]" value="{{ old('variants.'.$index.'.purchase_price', $variant->purchase_price) }}" min="0" step="0.01" required>
                                                            @error('variants.'.$index.'.purchase_price')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Selling Price</label>
                                                            <input type="number" class="form-control @error('variants.'.$index.'.selling_price') is-invalid @enderror" name="variants[{{ $index }}][selling_price]" value="{{ old('variants.'.$index.'.selling_price', $variant->selling_price) }}" min="0" step="0.01" required>
                                                            @error('variants.'.$index.'.selling_price')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Discount Price</label>
                                                            <input type="number" class="form-control @error('variants.'.$index.'.discount_price') is-invalid @enderror" name="variants[{{ $index }}][discount_price]" value="{{ old('variants.'.$index.'.discount_price', $variant->discount_price) }}" min="0" step="0.01">
                                                            @error('variants.'.$index.'.discount_price')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Image</label>
                                                            <input type="file" class="form-control variant-image @error('variants.'.$index.'.image') is-invalid @enderror" name="variants[{{ $index }}][image]" onchange="previewImage({{ $index }})">
                                                            @error('variants.'.$index.'.image')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                            @if($variant->image)
                                                                <div id="preview-{{ $index }}" class="preview-image-container mt-2">
                                                                    <img src="{{ asset('Uploads/' . $variant->image) }}" class="preview-image">
                                                                </div>
                                                            @else
                                                                <div id="preview-{{ $index }}" class="preview-image-container mt-2"></div>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Default Variant</label>
                                                            <div class="form-check form-switch">
                                                                <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[{{ $index }}][is_default]" id="is_default_{{ $index }}" value="1" {{ old('variants.'.$index.'.is_default', $variant->is_default) ? 'checked' : '' }} onchange="toggleDefaultVariant({{ $index }})">
                                                                <label class="form-check-label" for="is_default_{{ $index }}">Set as Default</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Hidden input for attributes -->
                                                <input type="hidden" name="variants[{{ $index }}][attributes]" value='@json($variant->combinations->map(function($combination) {
                                                    return [
                                                        "attribute_type_id" => $combination->attributeValue->attribute_type_id ?? null,
                                                        "value" => $combination->attributeValue->value ?? null,
                                                        "hex" => $combination->attributeValue->hex ?? null
                                                    ];
                                                })->filter()->toArray())'>
                                            </div>
                                        @endforeach
                                    @else
                                        <p>No variants found. Please add variant attributes to generate variants.</p>
                                    @endif
                                </div>
                            </div>
                            <!-- Product Attributes -->
                            <div class="mb-3">
                                <label class="form-label">Product Attributes (Optional)</label>
                                <div id="product-attributes">
                                    @if($product->attributes->isNotEmpty())
                                        @foreach($product->attributes as $index => $attr)
                                            <div class="row mb-2 product-attribute-row" data-index="{{ $index }}">
                                                <div class="col-md-4">
                                                    <select class="form-select @error('product_attributes.'.$index.'.attribute_type_id') is-invalid @enderror" name="product_attributes[{{ $index }}][attribute_type_id]">
                                                        <option value="">-- Select Attribute --</option>
                                                        @foreach ($attributeTypes as $attributeType)
                                                            <option value="{{ $attributeType->id }}" {{ old('product_attributes.'.$index.'.attribute_type_id', $attr->attribute_type_id) == $attributeType->id ? 'selected' : '' }}>{{ $attributeType->name }}</option>
                                                        @endforeach
                                                    </select>
                                                    @error('product_attributes.'.$index.'.attribute_type_id')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control @error('product_attributes.'.$index.'.value') is-invalid @enderror" name="product_attributes[{{ $index }}][value]" value="{{ old('product_attributes.'.$index.'.value', $attr->attribute_value) }}" placeholder="Value (e.g., Red)">
                                                    @error('product_attributes.'.$index.'.value')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" class="form-control @error('product_attributes.'.$index.'.hex') is-invalid @enderror" name="product_attributes[{{ $index }}][hex]" value="{{ old('product_attributes.'.$index.'.hex', $attr->hex) }}" placeholder="Hex Code (e.g., #FFFFFF)">
                                                    @error('product_attributes.'.$index.'.hex')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <div class="col-md-1">
                                                    <button type="button" class="btn btn-danger remove-product-attribute" data-index="{{ $index }}">Remove</button>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <p>No product attributes found. Click "Add Product Attribute" to create one.</p>
                                    @endif
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-product-attribute">Add Product Attribute</button>
                            </div>
                            <div class="mb-3" id="submit-section">
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
let attributeIndex = {{ $attributeValues ? count($attributeValues) : 0 }};
let productAttributeIndex = {{ $product->attributes ? count($product->attributes) : 0 }};

document.getElementById('add-value').addEventListener('click', function() {
    const container = document.getElementById('variant-attributes');
    const newRow = document.createElement('div');
    newRow.className = 'row mb-2 variant-row';
    newRow.dataset.index = attributeIndex;
    newRow.innerHTML = `
        <div class="col-md-4">
            <select class="form-select attribute-type" name="variants[${attributeIndex}][attribute_type_id]" id="attribute_type_${attributeIndex}" required>
                <option value="">-- Select Attribute --</option>
                @foreach ($attributeTypes as $attributeType)
                    <option value="{{ $attributeType->id }}">{{ $attributeType->name }}</option>
                @endforeach
            </select>
            <div class="error-message" id="error-type-${attributeIndex}">Please select an attribute type.</div>
        </div>
        <div class="col-md-4">
            <input type="text" class="form-control attribute-values" name="variants[${attributeIndex}][attributes][value]" id="values_${attributeIndex}" placeholder="Value (e.g., Red)" required>
            <div class="error-message" id="error-values-${attributeIndex}">Please enter a valid value.</div>
        </div>
        <div class="col-md-3">
            <input type="text" class="form-control attribute-hex" name="variants[${attributeIndex}][attributes][hex]" id="hex_${attributeIndex}" placeholder="Hex Code (e.g., #FFFFFF)">
            <div class="error-message" id="error-hex-${attributeIndex}">Please enter a valid hex code or leave blank.</div>
        </div>
        <div class="col-md-1">
            <button type="button" class="btn btn-danger remove-value" data-index="${attributeIndex}">Remove</button>
        </div>
    `;
    container.appendChild(newRow);
    attributeIndex++;
    attachRemoveEvent();
});

document.getElementById('add-product-attribute').addEventListener('click', function() {
    const container = document.getElementById('product-attributes');
    const newRow = document.createElement('div');
    newRow.className = 'row mb-2 product-attribute-row';
    newRow.dataset.index = productAttributeIndex;
    newRow.innerHTML = `
        <div class="col-md-4">
            <select class="form-select" name="product_attributes[${productAttributeIndex}][attribute_type_id]">
                <option value="">-- Select Attribute --</option>
                @foreach ($attributeTypes as $attributeType)
                    <option value="{{ $attributeType->id }}">{{ $attributeType->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4">
            <input type="text" class="form-control" name="product_attributes[${productAttributeIndex}][value]" placeholder="Value (e.g., Red)">
        </div>
        <div class="col-md-3">
            <input type="text" class="form-control" name="product_attributes[${productAttributeIndex}][hex]" placeholder="Hex Code (e.g., #FFFFFF)">
        </div>
        <div class="col-md-1">
            <button type="button" class="btn btn-danger remove-product-attribute" data-index="${productAttributeIndex}">Remove</button>
        </div>
    `;
    container.appendChild(newRow);
    productAttributeIndex++;
    attachProductAttributeRemoveEvent();
});

function attachRemoveEvent() {
    document.querySelectorAll('.remove-value').forEach(button => {
        button.removeEventListener('click', removeVariantAttribute); // Tránh gắn nhiều lần
        button.addEventListener('click', removeVariantAttribute);
    });
}

function removeVariantAttribute() {
    const index = this.dataset.index;
    document.querySelector(`.variant-row[data-index="${index}"]`).remove();
}

function attachProductAttributeRemoveEvent() {
    document.querySelectorAll('.remove-product-attribute').forEach(button => {
        button.removeEventListener('click', removeProductAttribute); // Tránh gắn nhiều lần
        button.addEventListener('click', removeProductAttribute);
    });
}

function removeProductAttribute() {
    const index = this.dataset.index;
    document.querySelector(`.product-attribute-row[data-index="${index}"]`).remove();
}

function previewImage(index) {
    const input = document.querySelector(`input[name="variants[${index}][image]"]`);
    const preview = document.getElementById(`preview-${index}`);
    preview.innerHTML = '';
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = document.createElement('img');
            img.src = e.target.result;
            img.className = 'preview-image';
            preview.appendChild(img);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function toggleDefaultVariant(index) {
    const checkboxes = document.querySelectorAll('.default-variant-toggle');
    checkboxes.forEach((checkbox, i) => {
        if (i !== parseInt(index)) {
            checkbox.checked = false;
        }
    });
}

document.addEventListener('DOMContentLoaded', function() {
    attachRemoveEvent();
    attachProductAttributeRemoveEvent();
});
</script>
@endsection