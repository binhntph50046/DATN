@extends('admin.layouts.app')
@section('title', 'Create Variant Product')

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
                            <h5 class="m-b-10">Create Variant Product</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                            <li class="breadcrumb-item" aria-current="page">Create Variant</li>
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
                        <h5>Create New Variant Product</h5>
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
                        <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data" id="variant-form">
                            @csrf
                            <input type="hidden" name="has_variants" value="1">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}" required>
                                        @error('name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="slug" id="slug">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="category_id" class="form-label">Category <span class="text-danger">*</span></label>
                                        <select class="form-select @error('category_id') is-invalid @enderror" id="category_id" name="category_id" required>
                                            <option value="">-- Select Category --</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
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
                                        <label for="status" class="form-label">Status <span class="text-danger">*</span></label>
                                        <select class="form-select @error('status') is-invalid @enderror" id="status" name="status" required>
                                            <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>Active</option>
                                            <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
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
                                        <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description') }}</textarea>
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
                                        <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content" rows="10">{{ old('content') }}</textarea>
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
                                        <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model') }}">
                                        @error('model')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="series" class="form-label">Series (Optional)</label>
                                        <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series') }}">
                                        @error('series')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="warranty_months" class="form-label">Warranty Months</label>
                                        <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', 12) }}" min="0" required>
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
                                            <option value="0" {{ old('is_featured') == '0' ? 'selected' : '' }}>No</option>
                                            <option value="1" {{ old('is_featured') == '1' ? 'selected' : '' }}>Yes</option>
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
                                        $oldVariants = old('variants', []);
                                        $oldAttributes = old('attribute_values', []);
                                        $initialIndex = 0;
                                    @endphp
                                    @if (!empty($oldAttributes))
                                        @foreach ($oldAttributes as $index => $attr)
                                            <div class="row mb-2 variant-row" data-index="{{ $index }}">
                                                <div class="col-md-4">
                                                    <select class="form-select attribute-type" name="attribute_values[{{ $index }}][attribute_type_id]" id="attribute_type_{{ $index }}" required>
                                                        <option value="">-- Select Attribute --</option>
                                                        @foreach ($attributeTypes as $attributeType)
                                                            <option value="{{ $attributeType->id }}" {{ $attr['attribute_type_id'] == $attributeType->id ? 'selected' : '' }}>
                                                                {{ $attributeType->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    <div class="error-message" id="error-type-{{ $index }}">Please select an attribute type.</div>
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control attribute-values" name="attribute_values[{{ $index }}][values]" id="values_{{ $index }}" placeholder="Values (comma-separated, e.g., White,Black,128GB)" value="{{ $attr['values'] ?? '' }}" required>
                                                    <div class="error-message" id="error-values-{{ $index }}">Please enter valid values (comma-separated).</div>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" class="form-control attribute-hex" name="attribute_values[{{ $index }}][hex]" id="hex_{{ $index }}" placeholder="Hex Codes (comma-separated, e.g., #FFFFFF,#000000) or leave blank" value="{{ $attr['hex'] ?? '' }}">
                                                    <div class="error-message" id="error-hex-{{ $index }}">Please enter valid hex codes (comma-separated) or leave blank.</div>
                                                </div>
                                                <div class="col-md-1">
                                                    <button type="button" class="btn btn-danger remove-value" data-index="{{ $index }}">Remove</button>
                                                </div>
                                            </div>
                                        @endforeach
                                        @php
                                            $initialIndex = count($oldAttributes);
                                        @endphp
                                    @endif
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-value">Add Attribute</button>
                                <div class="error-message" id="error-duplicate" style="display: none;">Duplicate attribute types are not allowed.</div>
                                <div class="error-message" id="error-min-attributes" style="{{ empty($oldAttributes) ? 'display: block;' : 'display: none;' }}">Please add at least one attribute.</div>
                            </div>

                            <div class="mb-3">
                                <button type="button" class="btn btn-success" id="generate-variants">Generate Variants</button>
                            </div>

                            <!-- Generated Variants -->
                            <div id="generated-variants" style="display: none;">
                                <label class="form-label">Variants</label>
                                <div id="variant-list"></div>
                            </div>

                            <div class="mb-3" id="submit-section" style="display: none;">
                                <button type="submit" class="btn btn-primary">Create Variant Product</button>
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
    let nextIndex = {{ $initialIndex ?? 0 }};
    let selectedTypes = new Set(); // Track selected attribute types to prevent duplicates

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
    document.getElementById('add-value').addEventListener('click', function () {
        const container = document.getElementById('variant-attributes');
        const newIndex = nextIndex++;
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
                    <button type="button" class="btn btn-danger remove-value" data-index="${newIndex}">Remove</button>
                </div>
            </div>`;
        container.insertAdjacentHTML('beforeend', newRow);

        // Initialize validation for new row
        validateAttributeType(newIndex);
        validateAttributeValues(newIndex);
        validateHexValues(newIndex);
        validateAllAttributes();
    });

    // Remove Value
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-value')) {
            const index = e.target.getAttribute('data-index');
            const typeSelect = document.getElementById(`attribute_type_${index}`);
            if (typeSelect && typeSelect.value) {
                selectedTypes.delete(typeSelect.value);
                console.log(`Removed attribute type ${typeSelect.value} from selectedTypes`, Array.from(selectedTypes));
            }
            e.target.closest('.variant-row').remove();
            validateAllAttributes();
        }
    });

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

    // Toggle Default Variant
    function toggleDefaultVariant(index) {
        const toggles = document.querySelectorAll('.default-variant-toggle');
        toggles.forEach((toggle, i) => {
            if (i !== index) {
                toggle.checked = false; // Uncheck all other toggles
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
                <div class="variant-row" data-index="${index}">
                    <h6>Variant ${index + 1}: ${variantName}</h6>
                    <input type="hidden" name="variants[${index}][name]" value="${variantName}">
                    <input type="hidden" name="variants[${index}][slug]" value="${variantSlug}">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="form-label">Stock</label>
                                <input type="number" class="form-control" name="variants[${index}][stock]" value="0" min="0" required>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="form-label">Purchase Price</label>
                                <input type="number" class="form-control" name="variants[${index}][purchase_price]" value="0" min="0" step="0.01" required>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="form-label">Selling Price</label>
                                <input type="number" class="form-control" name="variants[${index}][selling_price]" value="0" min="0" step="0.01" required>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="form-label">Discount Price</label>
                                <input type="number" class="form-control" name="variants[${index}][discount_price]" value="" min="0" step="0.01">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Image</label>
                                <input type="file" class="form-control variant-image" name="variants[${index}][image]" onchange="previewImage(${index})">
                                <div id="preview-${index}" class="preview-image-container mt-2"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Default Variant</label>
                                <div class="form-check form-switch">
                                    <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[${index}][is_default]" id="is_default_${index}" value="1" ${isDefaultChecked} onchange="toggleDefaultVariant(${index})">
                                    <label class="form-check-label" for="is_default_${index}">Set as Default</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="variants[${index}][attributes]" value='${variantAttributes}'>
                </div>`;
            variantList.insertAdjacentHTML('beforeend', variantHtml);
        });

        document.getElementById('generated-variants').style.display = 'block';
        document.getElementById('submit-section').style.display = 'block';
    });

    // Preview Image Function
    function previewImage(index) {
        const input = document.querySelector(`[name="variants[${index}][image]"]`);
        const previewContainer = document.getElementById(`preview-${index}`);
        previewContainer.innerHTML = '';

        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.className = 'preview-image';
                previewContainer.appendChild(img);
            };
            reader.readAsDataURL(input.files[0]);
        }
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

    // Run initialization after DOM is fully loaded
    document.addEventListener('DOMContentLoaded', function() {
        initializeValidation();
    });
</script>
@endsection