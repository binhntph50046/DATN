@extends('admin.layouts.app')
@section('title', 'Create Product')

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
                                <h5 class="m-b-10">Create Product</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">Create</li>
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
                            <h5>Create New Product</h5>
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

                            <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data"
                                id="productForm">
                                @csrf

                                <!-- Basic Information -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Product Name <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                id="name" name="name" value="{{ old('name') }}" required>
                                            @error('name')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="category_id" class="form-label">Category <span
                                                    class="text-danger">*</span></label>
                                            <select class="form-select @error('category_id') is-invalid @enderror"
                                                id="category_id" name="category_id" required>
                                                <option value="">Select Category</option>
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}"
                                                        {{ old('category_id') == $category->id ? 'selected' : '' }}>
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
                                            <label for="warranty_months" class="form-label">Warranty Months <span
                                                    class="text-danger">*</span></label>
                                            <input type="number"
                                                class="form-control @error('warranty_months') is-invalid @enderror"
                                                id="warranty_months" name="warranty_months"
                                                value="{{ old('warranty_months', 12) }}" min="0" required>
                                            @error('warranty_months')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="description" class="form-label">Short Description</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description"
                                                rows="3">{{ old('description') }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="content" class="form-label">Full Description</label>
                                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content">{{ old('content') }}</textarea>
                                            @error('content')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Featured Product</label>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="is_featured"
                                                    name="is_featured" value="1"
                                                    {{ old('is_featured') ? 'checked' : '' }}>
                                                <label class="form-check-label" for="is_featured">Set as Featured</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Category Specifications -->
                                <div class="mb-3">
                                    <label class="form-label">Category Specifications</label>
                                    <div id="categorySpecifications"></div>
                                </div>

                                <script>
                                    // Handle category change
                                    document.getElementById('category_id').addEventListener('change', function() {
                                        const categoryId = this.value;
                                        if (categoryId) {
                                            // Load specifications
                                            fetch(`/admin/categories/${categoryId}/specifications`)
                                                .then(response => response.json())
                                                .then(data => {
                                                    const container = document.getElementById('categorySpecifications');
                                                    container.innerHTML = '';
                                                    if (data.length > 0) {
                                                        // Create wrapper for rows
                                                        const wrapper = document.createElement('div');
                                                        wrapper.id = 'specifications-wrapper';
                                                        let row = null;
                                                        data.forEach((spec, idx) => {
                                                            if (idx % 2 === 0) {
                                                                row = document.createElement('div');
                                                                row.className = 'row mb-2 spec-row';
                                                                if (idx / 2 >= 3) row.style.display = 'none';
                                                                wrapper.appendChild(row);
                                                            }
                                                            const col = document.createElement('div');
                                                            col.className = 'col-md-6';
                                                            col.innerHTML = `
                                                                <div class="mb-3">
                                                                    <label class="form-label">${spec.name} <span class="text-danger">*</span></label>
                                                                    <input type="hidden" name="specifications[${idx}][specification_id]" value="${spec.id}">
                                                                    <input type="text" class="form-control" name="specifications[${idx}][value]" required>
                                                                </div>
                                                            `;
                                                            row.appendChild(col);
                                                        });
                                                        container.appendChild(wrapper);
                                                        // If more than 6 specifications, add See more button
                                                        if (data.length > 6) {
                                                            const seeMoreBtn = document.createElement('button');
                                                            seeMoreBtn.type = 'button';
                                                            seeMoreBtn.className = 'btn btn-link p-0';
                                                            seeMoreBtn.textContent = 'See more';
                                                            seeMoreBtn.onclick = function() {
                                                                document.querySelectorAll('.spec-row').forEach((row, idx) => {
                                                                    if (idx >= 3) row.style.display = '';
                                                                });
                                                                this.style.display = 'none';
                                                            };
                                                            container.appendChild(seeMoreBtn);
                                                        }
                                                    } else {
                                                        container.innerHTML = '<p class="text-muted">No specifications found for this category.</p>';
                                                    }
                                                });
                                        }
                                    });
                                </script>

                                <!-- Variant Attributes -->
                                <div class="mb-3">
                                    <label class="form-label">Variant Attributes <span class="text-danger">*</span></label>
                                    <div id="variant-attributes">
                                        <div id="attributes-wrapper">
                                            <div class="row mb-2 attribute-row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Attribute 1</label>
                                                        <select class="form-select attribute-type"
                                                            name="variants[0][attribute_type_id]" id="attribute_type_0"
                                                            disabled required>
                                                            <option value="">-- Select Attribute --</option>
                                                        </select>
                                                        <div class="error-message" id="error-type-0">Please select an
                                                            attribute type.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Value</label>
                                                        <input type="text" class="form-control attribute-values"
                                                            name="variants[0][attributes][value]" id="values_0"
                                                            placeholder="Value (e.g., Red)" disabled required>
                                                        <div class="error-message" id="error-values-0">Please enter a
                                                            valid value.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Hex Code (Optional)</label>
                                                        <input type="text" class="form-control attribute-hex"
                                                            name="variants[0][attributes][hex]" id="hex_0"
                                                            placeholder="Hex Code (e.g., #FFFFFF)" disabled>
                                                        <div class="error-message" id="error-hex-0">Please enter a valid
                                                            hex code or leave blank.</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Attribute 2</label>
                                                        <select class="form-select attribute-type"
                                                            name="variants[1][attribute_type_id]" id="attribute_type_1"
                                                            disabled required>
                                                            <option value="">-- Select Attribute --</option>
                                                        </select>
                                                        <div class="error-message" id="error-type-1">Please select an
                                                            attribute type.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Value</label>
                                                        <input type="text" class="form-control attribute-values"
                                                            name="variants[1][attributes][value]" id="values_1"
                                                            placeholder="Value (e.g., Blue)" disabled required>
                                                        <div class="error-message" id="error-values-1">Please enter a
                                                            valid value.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Hex Code (Optional)</label>
                                                        <input type="text" class="form-control attribute-hex"
                                                            name="variants[1][attributes][hex]" id="hex_1"
                                                            placeholder="Hex Code (e.g., #0000FF)" disabled>
                                                        <div class="error-message" id="error-hex-1">Please enter a valid
                                                            hex code or leave blank.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="error-message" id="error-duplicate" style="display: none;">Duplicate
                                        attribute types are not allowed.</div>
                                    <div class="error-message" id="error-min-attributes" style="display: none;">Please
                                        select at least one attribute.</div>
                                </div>

                                <!-- Generated Variants -->
                                <div class="mb-3">
                                    <label class="form-label">Product Variants</label> <br>
                                    <button type="button" class="btn btn-primary mb-3" id="generate-variants">Generate
                                        Variants</button>
                                    <div id="variantsContainer"></div>
                                </div>

                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Create Product</button>
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

    <script>
        let attributeIndex = 0;
        let selectedTypes = new Set();

        // On page load, always show 2 select boxes (disabled if no category)
        document.addEventListener('DOMContentLoaded', function() {
            const categorySelect = document.getElementById('category_id');
            if (categorySelect.value) {
                categorySelect.dispatchEvent(new Event('change'));
            }
        });

        // Handle category change
        document.getElementById('category_id').addEventListener('change', function() {
            const categoryId = this.value;
            const selects = [document.getElementById('attribute_type_0'), document.getElementById('attribute_type_1')];
            const valueInputs = [document.getElementById('values_0'), document.getElementById('values_1')];
            const hexInputs = [document.getElementById('hex_0'), document.getElementById('hex_1')];
            if (categoryId) {
                selects.forEach(s => s.disabled = false);
                valueInputs.forEach(i => i.disabled = false);
                hexInputs.forEach(i => i.disabled = false);
                // Load specifications
                fetch(`/admin/categories/${categoryId}/specifications`)
                    .then(response => response.json())
                    .then(data => {
                        const container = document.getElementById('categorySpecifications');
                        container.innerHTML = '';
                        if (data.length > 0) {
                            // Tạo wrapper cho các dòng
                            const wrapper = document.createElement('div');
                            wrapper.id = 'specifications-wrapper';
                            let row = null;
                            data.forEach((spec, idx) => {
                                if (idx % 2 === 0) {
                                    row = document.createElement('div');
                                    row.className = 'row mb-2 spec-row';
                                    if (idx / 2 >= 3) row.style.display = 'none';
                                    wrapper.appendChild(row);
                                }
                                const col = document.createElement('div');
                                col.className = 'col-md-6';
                                col.innerHTML = `
                                <div class="mb-3">
                                    <label class="form-label">${spec.name} <span class="text-danger">*</span></label>
                                    <input type="hidden" name="specifications[${idx}][specification_id]" value="${spec.id}">
                                    <input type="text" class="form-control" name="specifications[${idx}][value]" required>
                                </div>
                            `;
                                row.appendChild(col);
                            });
                            container.appendChild(wrapper);
                            // Nếu có nhiều hơn 6 thông số, thêm nút See more
                            if (data.length > 6) {
                                const seeMoreBtn = document.createElement('button');
                                seeMoreBtn.type = 'button';
                                seeMoreBtn.className = 'btn btn-link p-0';
                                seeMoreBtn.textContent = 'See more';
                                seeMoreBtn.onclick = function() {
                                    document.querySelectorAll('.spec-row').forEach((row, idx) => {
                                        if (idx >= 3) row.style.display = '';
                                    });
                                    this.style.display = 'none';
                                };
                                container.appendChild(seeMoreBtn);
                            }
                        } else {
                            container.innerHTML =
                                '<p class="text-muted">No specifications found for this category.</p>';
                        }
                    });
                // Load attributes
                fetch(`/admin/categories/${categoryId}/attributes`)
                    .then(response => response.json())
                    .then(data => {
                        selects.forEach(select => {
                            // Remove all except the first option
                            select.options.length = 1;
                            data.forEach(attr => {
                                const opt = document.createElement('option');
                                opt.value = attr.id;
                                opt.textContent = attr.name;
                                select.appendChild(opt);
                            });
                        });
                        // Add event listeners for disabling duplicate selection
                        selects.forEach((select, idx) => {
                            select.addEventListener('change', function() {
                                const selectedValue = this.value;
                                const otherSelect = selects[idx === 0 ? 1 : 0];
                                // Reset all options
                                selects.forEach(s => {
                                    Array.from(s.options).forEach(opt => {
                                        if (opt.value) opt.disabled = false;
                                    });
                                });
                                // Disable selected in other select
                                if (selectedValue) {
                                    Array.from(otherSelect.options).forEach(opt => {
                                        if (opt.value === selectedValue) opt.disabled =
                                            true;
                                    });
                                }
                            });
                        });
                    });
            } else {
                selects.forEach(s => { s.disabled = true; s.selectedIndex = 0; });
                valueInputs.forEach(i => { i.disabled = true; i.value = ''; });
                hexInputs.forEach(i => { i.disabled = true; i.value = ''; });
            }
        });

        // Validate Attribute Type Selection
        function validateAttributeType(index) {
            const select = document.getElementById(`attribute_type_${index}`);
            const error = document.getElementById(`error-type-${index}`);
            if (select) {
                select.addEventListener('change', function() {
                    const value = this.value;
                    if (value) {
                        selectedTypes.add(value);
                        error.style.display = 'none';
                    } else {
                        selectedTypes.delete(value);
                        error.style.display = 'block';
                    }
                });
            }
        }

        // Validate Attribute Values
        function validateAttributeValues(index) {
            const input = document.getElementById(`values_${index}`);
            const error = document.getElementById(`error-values-${index}`);
            if (input) {
                input.addEventListener('input', function() {
                    const values = this.value.split(',').map(v => v.trim()).filter(v => v.length > 0);
                    if (values.length > 0) {
                        error.style.display = 'none';
                    } else {
                        error.style.display = 'block';
                    }
                });
            }
        }

        // Validate Hex Values
        function validateHexValues(index) {
            const input = document.getElementById(`hex_${index}`);
            const error = document.getElementById(`error-hex-${index}`);
            if (input) {
                input.addEventListener('input', function() {
                    const hexValues = this.value.split(',').map(h => h.trim()).filter(h => h.length > 0);
                    error.style.display = 'none';
                });
            }
        }

        // Validate All Attributes
        function validateAllAttributes() {
            const selects = document.querySelectorAll('.attribute-type');
            const errorMinAttributes = document.getElementById('error-min-attributes');
            const hasSelectedAttribute = Array.from(selects).some(select => select.value);

            if (!hasSelectedAttribute) {
                errorMinAttributes.style.display = 'block';
            } else {
                errorMinAttributes.style.display = 'none';
            }
        }

        // Generate Variants
        document.getElementById('generate-variants').addEventListener('click', function() {
            // Enable all attribute inputs before collecting data
            document.querySelectorAll('.attribute-type, .attribute-values, .attribute-hex').forEach(el => el.disabled = false);

            const nameInput = document.getElementById('name');
            if (!nameInput.value.trim()) {
                alert('Please enter a product name.');
                return;
            }

            const form = document.getElementById('productForm');
            // Get attribute values directly from DOM
            const selects = [document.getElementById('attribute_type_0'), document.getElementById('attribute_type_1')];
            const valueInputs = [document.getElementById('values_0'), document.getElementById('values_1')];
            const hexInputs = [document.getElementById('hex_0'), document.getElementById('hex_1')];
            const attributeValues = [];
            
            selects.forEach((select, idx) => {
                const typeId = select.value;
                const values = valueInputs[idx].value.split(',').map(v => v.trim()).filter(v => v.length > 0);
                const hexes = hexInputs[idx].value.split(',').map(h => h.trim());
                
                if (typeId && values.length > 0) {
                    while (hexes.length < values.length) hexes.push(null);
                    attributeValues.push({
                        attribute_type_id: typeId,
                        values: values,
                        hex: hexes
                    });
                }
            });

            // Remove old attribute inputs
            document.querySelectorAll('.generated-attribute-input').forEach(e => e.remove());
            
            // Generate new attribute inputs
            attributeValues.forEach(attr => {
                if (attr.attribute_type_id && attr.values.length > 0) {
                    // Mark as selected
                    const selectedInput = document.createElement('input');
                    selectedInput.type = 'hidden';
                    selectedInput.name = `attributes[${attr.attribute_type_id}][selected]`;
                    selectedInput.value = 1;
                    selectedInput.className = 'generated-attribute-input';
                    form.appendChild(selectedInput);
                    
                    // Add each value
                    attr.values.forEach(val => {
                        const valueInput = document.createElement('input');
                        valueInput.type = 'hidden';
                        valueInput.name = `attributes[${attr.attribute_type_id}][values][]`;
                        valueInput.value = val;
                        valueInput.className = 'generated-attribute-input';
                        form.appendChild(valueInput);
                    });
                }
            });

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

            // Generate variants
            const variantsContainer = document.getElementById('variantsContainer');
            variantsContainer.innerHTML = '';

            // Generate all possible combinations
            const combinations = generateCombinations(attributeValues);

            combinations.forEach((combination, index) => {
                const variantName = [nameInput.value, ...combination.map(c => c.value)].join(' - ');
                const variantSlug = variantName.toLowerCase().replace(/[^a-z0-9-]/g, '-').replace(/-+/g, '-').replace(/^-|-$/g, '');
                
                // Create attributes array for this variant
                const variantAttributes = combination.map(attr => ({
                    attribute_type_id: parseInt(attr.attribute_type_id),
                    value: attr.value,
                    hex: attr.hex || null
                }));

                const variantHtml = `
                    <div class="variant-row" data-index="${index}">
                        <h6>Variant ${index + 1}: ${variantName}</h6>
                        <input type="hidden" name="variants[${index}][name]" value="${variantName}">
                        <input type="hidden" name="variants[${index}][slug]" value="${variantSlug}">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Stock</label>
                                    <input type="number" class="form-control" name="variants[${index}][stock]" min="0" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Purchase Price</label>
                                    <input type="number" class="form-control" name="variants[${index}][purchase_price]" min="0" step="0.01" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Selling Price</label>
                                    <input type="number" class="form-control" name="variants[${index}][selling_price]" min="0" step="0.01" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Images</label>
                                    <input type="file" class="form-control variant-images" name="variants[${index}][images][]" multiple accept="image/*" onchange="previewVariantImages(${index}, this)">
                                    <div id="preview-${index}" class="preview-images-container mt-2 d-flex flex-wrap gap-2"></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Default Variant</label>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[${index}][is_default]" id="is_default_${index}" value="1" ${index === 0 ? 'checked' : ''} onchange="toggleDefaultVariant(${index})">
                                        <label class="form-check-label" for="is_default_${index}">Set as Default</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="variants[${index}][attributes]" value='${JSON.stringify(variantAttributes)}'>
                    </div>`;
                variantsContainer.insertAdjacentHTML('beforeend', variantHtml);
            });
        });

        // Generate all possible combinations of attributes
        function generateCombinations(attributes) {
            const values = attributes.map(attr => {
                return attr.values.map((value, index) => ({
                    attribute_type_id: attr.attribute_type_id,
                    value: value,
                    hex: attr.hex[index]
                }));
            });

            function cartesianProduct(arrays) {
                return arrays.reduce((acc, current) => {
                    const result = [];
                    acc.forEach(a => {
                        current.forEach(b => {
                            result.push(a.concat([b]));
                        });
                    });
                    return result.length ? result : [
                        []
                    ];
                }, [
                    []
                ]);
            }

            return cartesianProduct(values).filter(comb => comb.length > 0);
        }

        // Preview Image
        function previewImage(index) {
            const input = document.querySelector(`[name="variants[${index}][image]"]`);
            const previewContainer = document.getElementById(`preview-${index}`);
            previewContainer.innerHTML = '';

            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'preview-image';
                    previewContainer.appendChild(img);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Toggle Default Variant
        function toggleDefaultVariant(index) {
            const toggles = document.querySelectorAll('.default-variant-toggle');
            toggles.forEach((toggle, i) => {
                if (i !== index) {
                    toggle.checked = false;
                }
            });
        }

        // Preview multiple images for variant
        function previewVariantImages(index, input) {
            const previewContainer = document.getElementById(`preview-${index}`);
            previewContainer.innerHTML = '';

            if (input.files) {
                Array.from(input.files).forEach((file, i) => {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const wrapper = document.createElement('div');
                        wrapper.className = 'position-relative';
                        wrapper.style.width = '100px';
                        wrapper.style.height = '100px';
                        
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.className = 'preview-image';
                        img.style.width = '100%';
                        img.style.height = '100%';
                        img.style.objectFit = 'cover';
                        img.style.borderRadius = '4px';
                        
                        const removeBtn = document.createElement('button');
                        removeBtn.type = 'button';
                        removeBtn.className = 'btn btn-danger btn-sm position-absolute top-0 end-0';
                        removeBtn.innerHTML = '&times;';
                        removeBtn.style.padding = '0 6px';
                        removeBtn.style.fontSize = '16px';
                        removeBtn.style.lineHeight = '1';
                        removeBtn.onclick = function() {
                            wrapper.remove();
                            // Remove file from input
                            const dt = new DataTransfer();
                            const files = input.files;
                            for (let i = 0; i < files.length; i++) {
                                if (i !== Array.from(input.files).indexOf(file)) {
                                    dt.items.add(files[i]);
                                }
                            }
                            input.files = dt.files;
                        };
                        
                        wrapper.appendChild(img);
                        wrapper.appendChild(removeBtn);
                        previewContainer.appendChild(wrapper);
                    };
                    reader.readAsDataURL(file);
                });
            }
        }

        // Add CSS for preview images
        const style = document.createElement('style');
        style.textContent = `
            .preview-images-container {
                min-height: 50px;
            }
            .preview-image {
                border: 1px solid #ddd;
                transition: all 0.3s ease;
            }
            .preview-image:hover {
                transform: scale(1.05);
            }
            .btn-danger {
                opacity: 0.8;
            }
            .btn-danger:hover {
                opacity: 1;
            }
        `;
        document.head.appendChild(style);
    </script>
@endsection
