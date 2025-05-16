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
        margin: 5px;
        border-radius: 5px;
    }
    .preview-image-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
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
                        <form action="{{ route('admin.products.update', $product) }}" method="POST" enctype="multipart/form-data" id="variant-form" onsubmit="return validateForm()">
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
                                    @php
                                        $oldAttributes = old('attribute_values', $attributeValues ?? []);
                                        $initialIndex = count($oldAttributes);
                                    @endphp
                                    @if (!empty($oldAttributes))
                                        @foreach ($oldAttributes as $index => $attr)
                                            <div class="row mb-2 variant-row" data-index="{{ $index }}">
                                                <div class="col-md-4">
                                                    <select class="form-select attribute-type @error('attribute_values.'.$index.'.attribute_type_id') is-invalid @enderror" name="attribute_values[{{ $index }}][attribute_type_id]" id="attribute_type_{{ $index }}" required>
                                                        <option value="">-- Select Attribute --</option>
                                                        @foreach ($attributeTypes as $attributeType)
                                                            <option value="{{ $attributeType->id }}" {{ $attr['attribute_type_id'] == $attributeType->id ? 'selected' : '' }}>
                                                                {{ $attributeType->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    @error('attribute_values.'.$index.'.attribute_type_id')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                    <div class="error-message" id="error-type-{{ $index }}">Please select an attribute type.</div>
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control attribute-values @error('attribute_values.'.$index.'.values') is-invalid @enderror" name="attribute_values[{{ $index }}][values]" id="values_{{ $index }}" placeholder="Values (comma-separated, e.g., White,Black,128GB)" value="{{ is_array($attr['values']) ? implode(',', $attr['values']) : ($attr['values'] ?? '') }}" required>
                                                    @error('attribute_values.'.$index.'.values')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                    <div class="error-message" id="error-values-{{ $index }}">Please enter valid values (comma-separated).</div>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" class="form-control attribute-hex @error('attribute_values.'.$index.'.hex') is-invalid @enderror" name="attribute_values[{{ $index }}][hex]" id="hex_{{ $index }}" placeholder="Hex Codes (comma-separated, e.g., #FFFFFF,#000000) or leave blank" value="{{ is_array($attr['hex']) ? implode(',', $attr['hex']) : ($attr['hex'] ?? '') }}">
                                                    @error('attribute_values.'.$index.'.hex')
                                                        <div class="invalid-feedback">{{ $message }}</div>
                                                    @enderror
                                                    <div class="error-message" id="error-hex-{{ $index }}">Please enter valid hex codes (comma-separated) or leave blank.</div>
                                                </div>
                                                <div class="col-md-1">
                                                    <button type="button" class="btn btn-danger remove-attribute" data-index="{{ $index }}">Remove</button>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <p>No variant attributes found. Click "Add Attribute" to create one.</p>
                                    @endif
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-attribute">Add Attribute</button>
                                <div class="error-message" id="error-duplicate" style="display: none;">Duplicate attribute types are not allowed.</div>
                                <div class="error-message" id="error-min-attributes" style="{{ empty($oldAttributes) ? 'display: block;' : 'display: none;' }}">Please add at least one attribute.</div>
                            </div>

                            <div class="mb-3">
                                <button type="button" class="btn btn-success" id="generate-variants">
                                    <i class="ti ti-refresh"></i> Generate Variants
                                </button>
                            </div>

                            <!-- Generated Variants (editable) -->
                            <div id="generated-variants" style="display: {{ $product->variants->isNotEmpty() ? 'block' : 'none' }};">
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
                                                            <label class="form-label">Images</label>
                                                            <input type="file" class="form-control variant-images @error('variants.'.$index.'.images') is-invalid @enderror" name="variants[{{ $index }}][images][]" multiple onchange="previewImages({{ $index }})">
                                                            @error('variants.'.$index.'.images')
                                                                <div class="invalid-feedback">{{ $message }}</div>
                                                            @enderror
                                                            <div id="preview-{{ $index }}" class="preview-image-container mt-2">
                                                                @if($variant->images)
                                                                    @foreach (json_decode($variant->images, true) as $image)
                                                                        <img src="{{ asset($image) }}" class="preview-image" alt="Variant Image">
                                                                    @endforeach
                                                                @endif
                                                            </div>
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
let attributeIndex = {{ count($attributeValues ?? []) }};
// Remove product attribute related code
let nextIndex = {{ $product->variants ? count($product->variants) : 0 }};
let selectedTypes = new Set();

// Initialize validation for existing fields
function initializeValidation() {
    console.log('Initializing validation...');
    document.querySelectorAll('.variant-row').forEach(row => {
        const index = row.getAttribute('data-index');
        const select = document.getElementById(`attribute_type_${index}`);
        const valuesInput = document.getElementById(`values_${index}`);
        const hexInput = document.getElementById(`hex_${index}`);
        
        // Log initial values
        console.log(`Row ${index}: attribute_type_id=${select ? select.value : 'null'}, values=${valuesInput ? valuesInput.value : 'null'}, hex=${hexInput ? hexInput.value : 'null'}`);
        
        // Initialize validation and trigger events
        if (select) {
            validateAttributeType(index);
            if (select.value) {
                const changeEvent = new Event('change');
                select.dispatchEvent(changeEvent);
            }
        }
        if (valuesInput) {
            validateAttributeValues(index);
            if (valuesInput.value) {
                const inputEvent = new Event('input');
                valuesInput.dispatchEvent(inputEvent);
            }
        }
        if (hexInput) {
            validateHexValues(index);
            if (hexInput.value) {
                const inputEvent = new Event('input');
                hexInput.dispatchEvent(inputEvent);
            }
        }
    });
    console.log('Initial selectedTypes:', Array.from(selectedTypes));
    validateAllAttributes();
}

// Add Variant Attribute
document.getElementById('add-attribute').addEventListener('click', function () {
    const container = document.getElementById('variant-attributes');
    const newIndex = attributeIndex++;
    const newRow = `
        <div class="row mb-2 variant-row" data-index="${newIndex}">
            <div class="col-md-4">
                <select class="form-select attribute-type" name="attribute_values[${newIndex}][attribute_type_id]" id="attribute_type_${newIndex}" required>
                    <option value="">-- Select Attribute --</option>
                    @foreach ($attributeTypes as $attributeType)
                        <option value="{{ $attributeType->id }}">{{ $attributeType->name }}</option>
                    @endforeach
                </select>
                <div class="error-message" id="error-type-${newIndex}">Please select an attribute type.</div>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control attribute-values" name="attribute_values[${newIndex}][values]" id="values_${newIndex}" placeholder="Values (comma-separated, e.g., White,Black,128GB)" required>
                <div class="error-message" id="error-values-${newIndex}">Please enter valid values (comma-separated).</div>
            </div>
            <div class="col-md-3">
                <input type="text" class="form-control attribute-hex" name="attribute_values[${newIndex}][hex]" id="hex_${newIndex}" placeholder="Hex Codes (comma-separated, e.g., #FFFFFF,#000000) or leave blank">
                <div class="error-message" id="error-hex-${newIndex}">Please enter valid hex codes (comma-separated) or leave blank.</div>
            </div>
            <div class="col-md-1">
                <button type="button" class="btn btn-danger remove-attribute" data-index="${newIndex}">Remove</button>
            </div>
        </div>`;
    container.insertAdjacentHTML('beforeend', newRow);

    // Initialize validation for new row
    validateAttributeType(newIndex);
    validateAttributeValues(newIndex);
    validateHexValues(newIndex);
    validateAllAttributes();
});

// Remove Variant Attribute
document.addEventListener('click', function(e) {
    if (e.target.closest('.remove-attribute')) {
        e.preventDefault();
        const button = e.target.closest('.remove-attribute');
        const row = button.closest('.variant-row');
        if (row) {
            const typeSelect = row.querySelector('.attribute-type');
            if (typeSelect && typeSelect.value) {
                selectedTypes.delete(typeSelect.value);
            }
            row.remove();
            validateAllAttributes();
        }
    }
});

function removeProductAttribute() {
    const index = this.dataset.index;
    document.querySelector(`.product-attribute-row[data-index="${index}"]`).remove();
}

// Validate Attribute Type Selection
function validateAttributeType(index) {
    const select = document.getElementById(`attribute_type_${index}`);
    const error = document.getElementById(`error-type-${index}`);
    if (select) {
        select.addEventListener('change', function () {
            const value = this.value;
            console.log(`Attribute type ${index} changed to: ${value}`);
            if (selectedTypes.has(value) && value) {
                this.value = '';
                document.getElementById('error-duplicate').style.display = 'block';
                error.style.display = 'none';
                return;
            } else {
                document.getElementById('error-duplicate').style.display = 'none';
            }
            // Clear stale values from selectedTypes
            selectedTypes.forEach(val => {
                if (val !== value && !document.querySelector(`select.attribute-type[value="${val}"]`)) {
                    selectedTypes.delete(val);
                }
            });
            if (value) {
                selectedTypes.add(value);
                error.style.display = 'none';
            } else {
                selectedTypes.delete(value);
                error.style.display = 'block';
            }
            console.log('Updated selectedTypes:', Array.from(selectedTypes));
        });
        // Validate initial value
        if (select.value) {
            selectedTypes.add(select.value);
            error.style.display = 'none';
            console.log(`Initial attribute type ${index}: ${select.value}`);
        }
    }
}

// Validate Attribute Values
function validateAttributeValues(index) {
    const input = document.getElementById(`values_${index}`);
    const error = document.getElementById(`error-values-${index}`);
    if (input) {
        input.addEventListener('input', function () {
            const values = this.value.split(',').map(v => v.trim()).filter(v => v.length > 0);
            console.log(`Values ${index} updated: ${values}`);
            if (values.length > 0) {
                error.style.display = 'none';
            } else {
                error.style.display = 'block';
            }
        });
        // Validate initial value
        const values = input.value.split(',').map(v => v.trim()).filter(v => v.length > 0);
        if (values.length > 0) {
            error.style.display = 'none';
            console.log(`Initial values ${index}: ${values}`);
        }
    }
}

// Validate Hex Values
function validateHexValues(index) {
    const input = document.getElementById(`hex_${index}`);
    const error = document.getElementById(`error-hex-${index}`);
    if (input) {
        input.addEventListener('input', function () {
            const hexValues = this.value.split(',').map(h => h.trim()).filter(h => h.length > 0);
            console.log(`Hex values ${index} updated: ${hexValues}`);
            error.style.display = 'none';
        });
        // Validate initial value
        const hexValues = input.value.split(',').map(h => h.trim()).filter(h => h.length > 0);
        if (hexValues.length > 0) {
            error.style.display = 'none';
            console.log(`Initial hex values ${index}: ${hexValues}`);
        }
    }
}

// Validate All Attributes
function validateAllAttributes() {
    const rows = document.querySelectorAll('.variant-row');
    const errorMinAttributes = document.getElementById('error-min-attributes');
    if (rows.length === 0) {
        errorMinAttributes.style.display = 'block';
    } else {
        errorMinAttributes.style.display = 'none';
    }
}

// Preview Images
function previewImages(index) {
    const input = document.querySelector(`input[name="variants[${index}][images][]"]`);
    const preview = document.getElementById(`preview-${index}`);
    // Keep existing images and append new ones
    const existingImages = preview.querySelectorAll('img');
    if (input.files && input.files.length > 0) {
        Array.from(input.files).forEach((file, fileIndex) => {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.className = 'preview-image';
                img.alt = `New Image ${fileIndex + 1}`;
                preview.appendChild(img);
            };
            reader.readAsDataURL(file);
        });
    }
}

// Toggle Default Variant
function toggleDefaultVariant(index) {
    const checkboxes = document.querySelectorAll('.default-variant-toggle');
    checkboxes.forEach((checkbox, i) => {
        if (i !== parseInt(index)) {
            checkbox.checked = false;
        }
    });
}

// Generate Variants with Cross-Join
document.getElementById('generate-variants').addEventListener('click', function () {
    const nameInput = document.getElementById('name');
    if (!nameInput.value.trim()) {
        alert('Please enter a product name.');
        return;
    }

    const form = document.getElementById('variant-form');
    const formData = new FormData(form);
    const attributeValues = [];

    // Collect attribute values
    const tempAttributes = {};
    formData.forEach((value, key) => {
        if (key.startsWith('attribute_values[')) {
            const match = key.match(/attribute_values\[(\d+)\]\[(.*?)\]/);
            if (match) {
                const index = match[1];
                const field = match[2];
                if (!tempAttributes[index]) {
                    tempAttributes[index] = { attribute_type_id: '', values: [], hex: [] };
                }
                if (field === 'attribute_type_id') {
                    tempAttributes[index].attribute_type_id = value;
                } else if (field === 'values') {
                    tempAttributes[index].values = value.split(',').map(v => v.trim()).filter(v => v.length > 0);
                } else if (field === 'hex') {
                    tempAttributes[index].hex = value.split(',').map(h => h.trim()).filter(h => h.length > 0).length > 0 ? value.split(',').map(h => h.trim()) : Array(tempAttributes[index].values.length).fill(null);
                }
            }
        }
    });

    // Convert and validate attributes
    Object.values(tempAttributes).forEach(attr => {
        if (attr.attribute_type_id && attr.values.length > 0) {
            while (attr.hex.length < attr.values.length) {
                attr.hex.push(null);
            }
            attributeValues.push(attr);
        }
    });

    console.log('Collected Attributes:', attributeValues);

    if (attributeValues.length === 0) {
        alert('Please add at least one valid attribute with values.');
        return;
    }

    // Check for duplicate attribute types
    const uniqueTypes = new Set(attributeValues.map(attr => attr.attribute_type_id));
    if (uniqueTypes.size !== attributeValues.length) {
        alert('Duplicate attribute types are not allowed.');
        return;
    }

    // Prepare arrays for Cartesian product
    const attributeArrays = attributeValues.map(attr => {
        const valuesWithDetails = [];
        for (let i = 0; i < attr.values.length; i++) {
            valuesWithDetails.push({
                attribute_type_id: attr.attribute_type_id,
                value: attr.values[i],
                hex: attr.hex[i]
            });
        }
        return valuesWithDetails;
    });

    console.log('Attribute Arrays:', attributeArrays);

    // Generate Cartesian product
    function cartesianProduct(arrays) {
        return arrays.reduce((acc, current) => {
            const result = [];
            acc.forEach(a => {
                current.forEach(b => {
                    result.push(a.concat([b]));
                });
            });
            return result.length ? result : [[]];
        }, [[]]);
    }

    const combinations = cartesianProduct(attributeArrays).filter(comb => comb.length > 0);

    console.log('Combinations:', combinations);

    if (combinations.length === 0) {
        alert('No valid combinations generated. Please check your attribute values.');
        return;
    }

    const variantList = document.getElementById('variant-list');
    variantList.innerHTML = '';
    combinations.forEach((comb, index) => {
        const baseName = document.getElementById('name').value.trim();
        const variantName = [baseName, ...comb.map(c => c.value)].join('-').replace(/^-/, '');
        const variantSlug = variantName.toLowerCase().replace(/[^a-z0-9-]/g, '-').replace(/-+/g, '-').replace(/^-|-$/g, '');
        const variantAttributes = JSON.stringify(comb.map(c => ({
            attribute_type_id: c.attribute_type_id,
            value: c.value,
            hex: c.hex
        })));
        const isDefaultChecked = index === 0 ? 'checked' : ''; // Set first variant as default
        const variantHtml = `
            <div class="variant-row" data-index="${nextIndex + index}">
                <h6>Variant ${index + 1}: ${variantName}</h6>
                <input type="hidden" name="variants[${nextIndex + index}][name]" value="${variantName}">
                <input type="hidden" name="variants[${nextIndex + index}][slug]" value="${variantSlug}">
                <div class="row">
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label class="form-label">Stock</label>
                            <input type="number" class="form-control" name="variants[${nextIndex + index}][stock]" value="0" min="0" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label class="form-label">Purchase Price</label>
                            <input type="number" class="form-control" name="variants[${nextIndex + index}][purchase_price]" value="0" min="0" step="0.01" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label class="form-label">Selling Price</label>
                            <input type="number" class="form-control" name="variants[${nextIndex + index}][selling_price]" value="0" min="0" step="0.01" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label class="form-label">Discount Price</label>
                            <input type="number" class="form-control" name="variants[${nextIndex + index}][discount_price]" value="" min="0" step="0.01">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Images</label>
                            <input type="file" class="form-control variant-images" name="variants[${nextIndex + index}][images][]" multiple onchange="previewImages(${nextIndex + index})">
                            <div id="preview-${nextIndex + index}" class="preview-image-container mt-2"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Default Variant</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[${nextIndex + index}][is_default]" id="is_default_${nextIndex + index}" value="1" ${isDefaultChecked} onchange="toggleDefaultVariant(${nextIndex + index})">
                                <label class="form-check-label" for="is_default_${nextIndex + index}">Set as Default</label>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="variants[${nextIndex + index}][attributes]" value='${variantAttributes}'>
            </div>`;
        variantList.insertAdjacentHTML('beforeend', variantHtml);
    });

    nextIndex += combinations.length;
    document.getElementById('generated-variants').style.display = 'block';
    document.getElementById('submit-section').style.display = 'block';
});

// Form validation and submission
function validateForm() {
    let isValid = true;
    
    // Reset all error messages
    document.querySelectorAll('.error-message').forEach(el => {
        el.style.display = 'none';
    });
    
    // Validate variant attributes
    const attributeRows = document.querySelectorAll('.variant-row');
    if (attributeRows.length === 0) {
        document.getElementById('error-min-attributes').style.display = 'block';
        isValid = false;
    }
    
    // Check for duplicate attribute types
    const attributeTypes = new Set();
    attributeRows.forEach(row => {
        const select = row.querySelector('.attribute-type');
        if (select && select.value) {
            if (attributeTypes.has(select.value)) {
                document.getElementById('error-duplicate').style.display = 'block';
                isValid = false;
            } else {
                attributeTypes.add(select.value);
            }
        }
    });
    
    // If validation fails, scroll to the first error
    if (!isValid) {
        const firstError = document.querySelector('.error-message[style*="display: block"], .error-message[style*="display:block"]');
        if (firstError) {
            firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
        return false;
    }
    
    return true;
}

// Auto-generate slug from product name
document.getElementById('name').addEventListener('input', function() {
    let slug = this.value
        .toLowerCase()
        .replace(/[^a-z0-9-]/g, '-')
        .replace(/-+/g, '-')
        .replace(/^-|-$/g, '');
    document.getElementById('slug').value = slug;
});

document.addEventListener('DOMContentLoaded', function() {
    attachRemoveEvent();
    attachProductAttributeRemoveEvent();
    initializeValidation();
});
document.addEventListener('DOMContentLoaded', function () {
    // Xử lý khi thay đổi thuộc tính hoặc giá trị
    const attributeSelects = document.querySelectorAll('.attribute-select');
    const valueInputs = document.querySelectorAll('.value-input');
    const hexInputs = document.querySelectorAll('.hex-input');

    const elementsToWatch = [...attributeSelects, ...valueInputs, ...hexInputs];

    elementsToWatch.forEach(element => {
        element.addEventListener('change', function () {
            const hasVariants = document.querySelectorAll('#variant-list .variant-row').length > 0;
            if (hasVariants) {
                Swal.fire({
                    title: 'Warning!',
                    text: 'Do you want to delete the old variants?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: 'Delete',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Xóa tất cả biến thể cũ
                        document.querySelectorAll('#variant-list .variant-row').forEach(row => {
                            row.remove();
                        });
                        
                        // Tự động tạo biến thể mới và hiển thị thông báo
                        const generateButton = document.getElementById('generate-variants');
                        if (generateButton) {
                            generateButton.click();
                            
                            // Hiển thị thông báo thành công sau khi tạo xong
                            setTimeout(() => {
                                const variantList = document.querySelector('#variant-list');
                                if (variantList && variantList.children.length > 0) {
                                    Swal.fire({
                                        title: 'Success!',
                                        text: 'New variants have been generated successfully!',
                                        icon: 'success',
                                        confirmButtonColor: '#28a745',
                                        confirmButtonText: 'OK'
                                    });
                                }
                            }, 1000); // Chờ 1 giây để đảm bảo biến thể được tạo xong
                        }
                    } else {
                        // Hủy thay đổi
                        this.value = this.previousValue;
                    }
                });
            }
        });

        // Lưu giá trị ban đầu để phục hồi khi cần
        element.previousValue = element.value;
    });
});
</script>
@endsection
