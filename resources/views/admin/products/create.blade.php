@extends('admin.layouts.app')
@section('title', 'Add New Product')

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
    .variant-item {
        background: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    .variant-item:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transform: translateY(-2px);
    }
    .variant-title {
        background: #e9ecef;
        padding: 10px 15px;
        border-radius: 6px;
        margin-bottom: 15px;
    }
    .image-preview {
        max-width: 200px;
        max-height: 200px;
        margin-top: 10px;
        border-radius: 4px;
        display: none;
    }
    .image-preview-container {
        position: relative;
        display: inline-block;
    }
    .remove-image {
        position: absolute;
        top: -10px;
        right: -10px;
        background: #dc3545;
        color: white;
        border-radius: 50%;
        width: 24px;
        height: 24px;
        text-align: center;
        line-height: 24px;
        cursor: pointer;
        display: none;
    }
    .error-message {
        color: #dc3545;
        font-size: 0.875rem;
        margin-top: 0.25rem;
    }
    .is-invalid {
        border-color: #dc3545 !important;
    }
    .invalid-feedback {
        display: block;
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
                                <h5 class="m-b-10">Add New Product</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">Add New</li>
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
                            <h5>Add New Product</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group mb-3">
                                            <label for="name" class="form-label">Product Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}" required>
                                            @error('name')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="description" class="form-label">Description</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description') }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="content" class="form-label">Content</label>
                                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content">{{ old('content') }}</textarea>
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
                                                    <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
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
                                                <option value="0" {{ old('has_variants') == '0' ? 'selected' : '' }}>Simple Product</option>
                                                <option value="1" {{ old('has_variants') == '1' ? 'selected' : '' }}>Product with Variants</option>
                                            </select>
                                            @error('has_variants')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <!-- Non-variant product fields -->
                                        <div class="non-variant-section">
                                            <div class="form-group mb-3">
                                                <label for="purchase_price" class="form-label">Purchase Price <span class="text-danger">*</span></label>
                                                <input type="number" class="form-control @error('purchase_price') is-invalid @enderror" id="purchase_price" name="purchase_price" value="{{ old('purchase_price') }}" min="0" step="0.01">
                                                @error('purchase_price')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="selling_price" class="form-label">Selling Price <span class="text-danger">*</span></label>
                                                <input type="number" class="form-control @error('selling_price') is-invalid @enderror" id="selling_price" name="selling_price" value="{{ old('selling_price') }}" min="0" step="0.01">
                                                @error('selling_price')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="image" class="form-label">Product Image</label>
                                                <input type="file" class="form-control @error('image') is-invalid @enderror" id="image" name="image" accept="image/*">
                                                <div class="image-preview-container mt-2">
                                                    <img id="image-preview" class="image-preview" src="" alt="Preview">
                                                    <span class="remove-image" id="remove-image">&times;</span>
                                                </div>
                                                @error('image')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="warranty_months">Warranty Months</label>
                                            <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', 12) }}" required>
                                            @error('warranty_months')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group">
                                            <label for="status">Status</label>
                                            <select class="form-control @error('status') is-invalid @enderror" id="status" name="status" required>
                                                <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>Active</option>
                                                <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                            </select>
                                            @error('status')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <div class="form-check form-switch">
                                                <input type="checkbox" class="form-check-input" id="is_featured" name="is_featured" value="1" {{ old('is_featured', 1) == 1 ? 'checked' : '' }}>
                                                <label class="form-check-label" for="is_featured">Featured Product</label>
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="model" class="form-label">Model</label>
                                            <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model') }}">
                                            @error('model')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="series" class="form-label">Series</label>
                                            <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series') }}">
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
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="add-feature">
                                            <i class="ti ti-plus"></i> Add Feature
                                        </button>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="form-label">Specifications</label>
                                        <div id="specifications-container" class="custom-shadow p-3">
                                            <div class="specification-item mb-2">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <input type="text" class="form-control" name="specifications[0][key]" placeholder="Specification name">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" name="specifications[0][value]" placeholder="Value">
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button type="button" class="btn btn-danger btn-sm remove-specification">
                                                            <i class="ti ti-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
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
                                            <div class="variant-attribute-item mb-2 p-3 border rounded bg-light">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" name="attributes[0][name]" placeholder="Attribute name (e.g. Color, Size)">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" name="attributes[0][display_name]" placeholder="Display names (e.g. Natural Titanium, Rose Gold)">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <input type="text" class="form-control" name="attributes[0][values][]" placeholder="Values (e.g. #B8A78B, #F7C7C5)">
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button type="button" class="btn btn-danger btn-sm remove-variant-attribute">
                                                            <i class="ti ti-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="add-variant-attribute">
                                            <i class="ti ti-plus"></i> Add Variant Attribute
                                        </button>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="form-label">Variants</label>
                                        <div id="variants-container" class="custom-shadow p-3">
                                            <!-- Variants will be generated here -->
                                        </div>
                                        <button type="button" class="btn btn-info btn-sm mt-2" id="generate-variants">
                                            <i class="ti ti-refresh"></i> Generate Variants
                                        </button>
                                    </div>
                                </div>

                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-primary">Save Product</button>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js" integrity="sha512-OF6VwfoBrM/wE3gt0I/lTh1ElROdq3etwAquhEm2YI45Um4ird+0ZFX1IwuBDBRufdXBuYoBb0mqXrmUA2VnOA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function() {
            CKEDITOR.replaceAll('snettech-editor');
            
            // Handle validation errors
            @if(session('scroll_to_error'))
                // Find first error field
                const firstError = $('.is-invalid').first();
                if (firstError.length) {
                    // Scroll to error field
                    $('html, body').animate({
                        scrollTop: firstError.offset().top - 100
                    }, 500);

                    // Highlight error field
                    firstError.focus();
                }
            @endif

            // Function to handle image preview
            function handleImagePreview(input, previewId) {
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $(previewId).attr('src', e.target.result).show();
                        $(previewId).siblings('.remove-image').show();
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

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
                            displayName: attribute.displayName ? attribute.displayName.split(',')[i].trim() : attribute.values[i]
                        });
                        generate(current, index + 1);
                        current.pop();
                    }
                };

                generate([], 0);
                return result;
            }

            // Show/hide sections based on product type
            function toggleSections() {
                const hasVariants = $('#has_variants').val() === '1';
                $('.variant-section').toggle(hasVariants);
                $('.non-variant-section').toggle(!hasVariants);

                // Clear form data when switching product types
                if (hasVariants) {
                    // Clear non-variant product data
                    $('#purchase_price').val('');
                    $('#selling_price').val('');
                    $('#image').val('');
                    $('#image-preview').attr('src', '').hide();
                    $('#remove-image').hide();
                    
                    // Reset features container
                    $('#features-container').html(`
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
                    `);

                    // Reset specifications container
                    $('#specifications-container').html(`
                        <div class="specification-item mb-2">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="specifications[0][key]" placeholder="Specification name">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="specifications[0][value]" placeholder="Value">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-danger btn-sm remove-specification">
                                        <i class="ti ti-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    `);
                } else {
                    // Clear variant product data
                    $('#variant-attributes-container').html(`
                        <div class="alert alert-info mb-3">
                            <h6 class="alert-heading"><i class="ti ti-info-circle me-2"></i>Variant Attribute Guide:</h6>
                            <ol class="mb-0">
                                <li><strong>Attribute name:</strong> Name of the attribute (e.g., Color, Size)</li>
                                <li><strong>Display names:</strong> Display names for each value, separated by commas (e.g., Natural Titanium, Rose Gold)</li>
                                <li><strong>Values:</strong> Values of the attribute, separated by commas (e.g., #B8A78B, #F7C7C5)</li>
                            </ol>
                        </div>
                        <div class="variant-attribute-item mb-2 p-3 border rounded bg-light">
                            <div class="row">
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="attributes[0][name]" placeholder="Attribute name (e.g. Color, Size)">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="attributes[0][display_name]" placeholder="Display names (e.g. Natural Titanium, Rose Gold)">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="attributes[0][values][]" placeholder="Values (e.g. #B8A78B, #F7C7C5)">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-danger btn-sm remove-variant-attribute">
                                        <i class="ti ti-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    `);
                    $('#variants-container').empty();
                    variantAttributeCount = 1;
                }

                // Reinitialize event listeners after reset
                initializeEventListeners();
            }

            // Function to initialize all event listeners
            function initializeEventListeners() {
                // Add feature
                $('#add-feature').off('click').on('click', function() {
                    const newFeature = `
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
                    $('#features-container').append(newFeature);
                });

                // Remove feature
                $(document).off('click', '.remove-feature').on('click', '.remove-feature', function() {
                    $(this).closest('.feature-item').remove();
                });

                // Add specification
                let specificationCount = 1;
                $('#add-specification').off('click').on('click', function() {
                    const newSpecification = `
                        <div class="specification-item mb-2">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="specifications[${specificationCount}][key]" placeholder="Specification name">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="specifications[${specificationCount}][value]" placeholder="Value">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-danger btn-sm remove-specification">
                                        <i class="ti ti-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    `;
                    $('#specifications-container').append(newSpecification);
                    specificationCount++;
                });

                // Remove specification
                $(document).off('click', '.remove-specification').on('click', '.remove-specification', function() {
                    $(this).closest('.specification-item').remove();
                });

                // Add variant attribute
                let variantAttributeCount = 1;
                $('#add-variant-attribute').off('click').on('click', function() {
                    const newVariantAttribute = `
                        <div class="variant-attribute-item mb-2 p-3 border rounded bg-light">
                            <div class="row">
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="attributes[${variantAttributeCount}][name]" placeholder="Attribute name (e.g. Color, Size)">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="attributes[${variantAttributeCount}][display_name]" placeholder="Display names (e.g. Natural Titanium, Rose Gold)">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="attributes[${variantAttributeCount}][values][]" placeholder="Values (e.g. #B8A78B, #F7C7C5)">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-danger btn-sm remove-variant-attribute">
                                        <i class="ti ti-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    `;
                    $('#variant-attributes-container').append(newVariantAttribute);
                    variantAttributeCount++;
                });

                // Remove variant attribute
                $(document).off('click', '.remove-variant-attribute').on('click', '.remove-variant-attribute', function() {
                    $(this).closest('.variant-attribute-item').remove();
                });

                // Image preview functionality
                $('#image').off('change').on('change', function() {
                    handleImagePreview(this, '#image-preview');
                });

                // Remove main product image
                $('#remove-image').off('click').on('click', function() {
                    $('#image').val('');
                    $('#image-preview').attr('src', '').hide();
                    $(this).hide();
                });

                // Variant image preview
                $(document).off('change', '.variant-image').on('change', '.variant-image', function() {
                    const preview = $(this).siblings('.image-preview-container').find('.variant-image-preview');
                    handleImagePreview(this, preview);
                });

                // Remove variant image
                $(document).off('click', '.variant-remove-image').on('click', '.variant-remove-image', function() {
                    const container = $(this).closest('.image-preview-container');
                    container.siblings('.variant-image').val('');
                    container.find('.variant-image-preview').attr('src', '').hide();
                    $(this).hide();
                });

                // Generate variants
                $('#generate-variants').off('click').on('click', function() {
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
                        // Create variant title from attributes
                        const variantTitle = combo.map(attr => {
                            return `${attr.name}: ${attr.displayName}`;
                        }).join(' | ');

                        variantHtml += `
                            <div class="variant-item mb-3 p-3">
                                <div class="variant-title">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h5 class="mb-1">Variant ${index + 1}</h5>
                                            <h6 class="text-primary mb-0">${variantTitle}</h6>
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
                                            <input type="file" class="form-control variant-image" name="variants[${index}][image]" accept="image/*">
                                            <div class="image-preview-container mt-2">
                                                <img class="image-preview variant-image-preview" src="" alt="Variant Preview">
                                                <span class="remove-image variant-remove-image">&times;</span>
                                            </div>
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

                    // Handle default variant selection
                    $('.default-variant').change(function() {
                        if ($(this).is(':checked')) {
                            $('.default-variant').not(this).prop('checked', false);
                        }
                    });
                });
            }

            $('#has_variants').change(function() {
                // Confirm before switching product types
                if (confirm('Switching product types will clear all entered data. Do you want to continue?')) {
                    toggleSections();
                } else {
                    // Revert the select value
                    $(this).val($(this).val() === '1' ? '0' : '1');
                }
            });

            // Initialize event listeners on page load
            initializeEventListeners();
            toggleSections();
        });
    </script>
@endpush
