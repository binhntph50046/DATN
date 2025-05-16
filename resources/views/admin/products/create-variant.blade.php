@extends('admin.layouts.app')
@section('title', 'Add Variant Product')

@push('styles')
<style>
    .attribute-item {
        background: #f8f9fa;
        border-radius: 5px;
        padding: 15px;
        margin-bottom: 10px;
        position: relative;
        border: 1px solid #dee2e6;
    }
    .remove-attribute {
        position: absolute;
        right: 10px;
        top: 10px;
        cursor: pointer;
        color: #dc3545;
    }
    #gallery-preview {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 10px;
    }
    #gallery-preview img {
        max-width: 100px;
        max-height: 100px;
        object-fit: cover;
        border-radius: 4px;
    }
    .image-preview {
        max-width: 200px;
        max-height: 200px;
        object-fit: cover;
        border-radius: 4px;
        display: none;
        margin-top: 10px;
    }
    .variant-attributes-container {
        background: #f8f9fa;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 15px;
    }
    .variant-item {
        background: #fff;
        border: 1px solid #dee2e6;
        border-radius: 5px;
        padding: 15px;
        margin-bottom: 15px;
    }
</style>
@endpush

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="{{ route('admin.dashboard') }}">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="{{ route('admin.products.index') }}">Products</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">Add Variant Product</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>Add Variant Product</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.products.store-variant') }}" method="POST" enctype="multipart/form-data" id="variantProductForm">
                                @csrf
                                <input type="hidden" name="has_variants" value="1">

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group mb-3">
                                            <label for="name" class="form-label">Product Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}" required>
                                            @error('name')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="slug" class="form-label">Slug <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control @error('slug') is-invalid @enderror" id="slug" name="slug" value="{{ old('slug') }}" required>
                                                <button class="btn btn-outline-secondary" type="button" id="generate-slug">Generate</button>
                                                @error('slug')
                                                    <span class="invalid-feedback">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="description" class="form-label">Short Description</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description') }}</textarea>
                                            @error('description')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="content" class="form-label">Full Description</label>
                                            <textarea class="form-control snettech-editor @error('content') is-invalid @enderror" id="content" name="content" rows="6">{{ old('content') }}</textarea>
                                            @error('content')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group mb-3">
                                            <label for="category_id" class="form-label">Category <span class="text-danger">*</span></label>
                                            <select class="form-select @error('category_id') is-invalid @enderror" id="category_id" name="category_id" required>
                                                <option value="">Select Category</option>
                                                @foreach($categories as $category)
                                                    <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('category_id')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <!-- Brand is fixed as Apple -->
                                        <input type="hidden" name="brand_id" value="1">

                                        <div class="form-group mb-3">
                                            <label for="model" class="form-label">Model</label>
                                            <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model') }}">
                                            @error('model')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="series" class="form-label">Series</label>
                                            <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series') }}" placeholder="e.g., Standard, Pro, Max">
                                            @error('series')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="warranty_months" class="form-label">Warranty (Months)</label>
                                            <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', 12) }}" min="0">
                                            @error('warranty_months')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="status" class="form-label">Status <span class="text-danger">*</span></label>
                                            <select class="form-select @error('status') is-invalid @enderror" id="status" name="status" required>
                                                <option value="active" {{ old('status', 'active') == 'active' ? 'selected' : '' }}>Active</option>
                                                <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                            </select>
                                            @error('status')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <!-- Variant Attributes -->
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <h5>Variant Attributes</h5>
                                    </div>
                                    <div class="card-body">
                                        <div id="variant-attributes-container">
                                            <div class="alert alert-info mb-3">
                                                <h6 class="alert-heading"><i class="ti ti-info-circle me-2"></i>Variant Attribute Guide:</h6>
                                                <ol class="mb-0">
                                                    <li><strong>Attribute name:</strong> Name of the attribute (e.g., Color, Size)</li>
                                                    <li><strong>Display name:</strong> How the attribute will be displayed (e.g., Màu sắc, Kích thước)</li>
                                                    <li><strong>Values:</strong> Comma-separated list of possible values (e.g., Red,Blue,Green)</li>
                                                </ol>
                                            </div>

                                            <div id="attribute-fields">
                                                <!-- Dynamic attribute fields will be added here -->
                                            </div>

                                            <button type="button" class="btn btn-primary btn-sm" id="add-attribute">
                                                <i class="ti ti-plus"></i> Add Attribute
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- Variants -->
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0">Variants</h5>
                                            <button type="button" class="btn btn-success btn-sm" id="generate-variants">
                                                <i class="ti ti-refresh"></i> Generate Variants
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div id="variants-container">
                                            <div class="alert alert-info">
                                                <i class="ti ti-info-circle me-2"></i>
                                                Add variant attributes and click "Generate Variants" to create product variants.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="ti ti-device-floppy me-1"></i> Save Product
                                    </button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">
                                        <i class="ti ti-arrow-back me-1"></i> Cancel
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js"></script>
<script>
    $(document).ready(function() {
        // Initialize CKEditor
        CKEDITOR.replace('content');

        // Generate slug from name
        $('#generate-slug').click(function() {
            const name = $('#name').val();
            if (name) {
                const slug = name.toLowerCase()
                    .replace(/[^\w\s-]/g, '') // remove non-word chars
                    .replace(/\s+/g, '-') // replace spaces with -
                    .replace(/--+/g, '-') // replace multiple - with single -
                    .trim();
                $('#slug').val(slug);
            }
        });

        // Generate slug when name changes
        $('#name').on('keyup', function() {
            if ($('#slug').val() === '') {
                $('#generate-slug').click();
            }
        });

        // Add attribute field
        let attributeCount = 0;
        $('#add-attribute').click(function() {
            const attributeHtml = `
                <div class="attribute-item mb-3">
                    <button type="button" class="btn btn-sm btn-danger remove-attribute">
                        <i class="ti ti-x"></i>
                    </button>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label">Attribute Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="attributes[${attributeCount}][name]" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label">Display Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="attributes[${attributeCount}][display_name]" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label">Values (comma-separated) <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="attributes[${attributeCount}][values]" required>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            $('#attribute-fields').append(attributeHtml);
            attributeCount++;
        });

        // Remove attribute field
        $(document).on('click', '.remove-attribute', function() {
            $(this).closest('.attribute-item').remove();
        });

        // Generate variants
        $('#generate-variants').click(function() {
            // Get all attributes
            const attributes = [];
            $('.attribute-item').each(function() {
                const name = $(this).find('input[name$="[name]"]').val();
                const displayName = $(this).find('input[name$="[display_name]"]').val();
                const values = $(this).find('input[name$="[values]"]').val().split(',').map(v => v.trim());
                
                if (name && displayName && values.length > 0) {
                    attributes.push({
                        name: name,
                        display_name: displayName,
                        values: values
                    });
                }
            });

            if (attributes.length === 0) {
                alert('Please add at least one attribute with values.');
                return;
            }

            // Generate all possible combinations
            const combinations = generateCombinations(attributes);
            
            // Generate variant HTML
            let variantHtml = '<div class="row">';
            combinations.forEach((combo, index) => {
                // Create variant title from attributes
                const variantTitle = combo.map(attr => {
                    return `${attr.display_name}: ${attr.value}`;
                }).join(' | ');

                variantHtml += `
                    <div class="col-md-6 mb-3">
                        <div class="variant-item">
                            <h6>Variant ${index + 1}: ${variantTitle}</h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">SKU <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="variants[${index}][sku]" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Purchase Price <span class="text-danger">*</span></label>
                                        <input type="number" class="form-control" name="variants[${index}][purchase_price]" min="0" step="1000" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Selling Price <span class="text-danger">*</span></label>
                                        <input type="number" class="form-control" name="variants[${index}][selling_price]" min="0" step="1000" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Stock <span class="text-danger">*</span></label>
                                        <input type="number" class="form-control" name="variants[${index}][stock]" min="0" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="form-label">Variant Image</label>
                                        <input type="file" class="form-control" name="variants[${index}][image]">
                                    </div>
                                </div>
                            </div>
                            <!-- Hidden fields for variant attributes -->
                            ${combo.map(attr => `
                                <input type="hidden" name="variants[${index}][attributes][${attr.name}][name]" value="${attr.name}">
                                <input type="hidden" name="variants[${index}][attributes][${attr.name}][display_name]" value="${attr.display_name}">
                                <input type="hidden" name="variants[${index}][attributes][${attr.name}][value]" value="${attr.value}">
                            `).join('')}
                        </div>
                    </div>
                `;
            });
            variantHtml += '</div>';

            $('#variants-container').html(variantHtml);
        });

        // Helper function to generate all combinations of attributes
        function generateCombinations(attributes, index = 0, current = [], result = []) {
            if (index === attributes.length) {
                result.push([...current]);
                return result;
            }

            const attribute = attributes[index];
            for (const value of attribute.values) {
                current.push({
                    name: attribute.name,
                    display_name: attribute.display_name,
                    value: value
                });
                generateCombinations(attributes, index + 1, current, result);
                current.pop();
            }

            return result;
        }
    });
</script>
@endpush
