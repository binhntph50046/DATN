@extends('admin.layouts.app')
@section('title', 'Edit Variant Product')

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
    .variant-image-preview {
        max-width: 100px;
        max-height: 100px;
        object-fit: cover;
        border-radius: 4px;
        margin-top: 5px;
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
                                <li class="breadcrumb-item" aria-current="page">Edit Variant Product</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>Edit Variant Product</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.products.update-variant', $product->id) }}" method="POST" enctype="multipart/form-data" id="variantProductForm">
                                @csrf
                                @method('PUT')
                                <input type="hidden" name="has_variants" value="1">

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group mb-3">
                                            <label for="name" class="form-label">Product Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name', $product->name) }}" required>
                                            @error('name')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="slug" class="form-label">Slug <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control @error('slug') is-invalid @enderror" id="slug" name="slug" value="{{ old('slug', $product->slug) }}" required>
                                                <button class="btn btn-outline-secondary" type="button" id="generate-slug">Generate</button>
                                                @error('slug')
                                                    <span class="invalid-feedback">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="description" class="form-label">Short Description</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description', $product->description) }}</textarea>
                                            @error('description')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="content" class="form-label">Full Description</label>
                                            <textarea class="form-control snettech-editor @error('content') is-invalid @enderror" id="content" name="content" rows="6">{{ old('content', $product->content) }}</textarea>
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
                                                    <option value="{{ $category->id }}" {{ old('category_id', $product->category_id) == $category->id ? 'selected' : '' }}>
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
                                            <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model', $product->model) }}">
                                            @error('model')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="series" class="form-label">Series</label>
                                            <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series', $product->series) }}" placeholder="e.g., Standard, Pro, Max">
                                            @error('series')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="warranty_months" class="form-label">Warranty (Months)</label>
                                            <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', $product->warranty_months) }}" min="0">
                                            @error('warranty_months')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="status" class="form-label">Status <span class="text-danger">*</span></label>
                                            <select class="form-select @error('status') is-invalid @enderror" id="status" name="status" required>
                                                <option value="active" {{ old('status', $product->status) == 'active' ? 'selected' : '' }}>Active</option>
                                                <option value="inactive" {{ old('status', $product->status) == 'inactive' ? 'selected' : '' }}>Inactive</option>
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
                                                @php
                                                    $attributeIndex = 0;
                                                    $attributes = $product->variantAttributeTypes->unique('name');
                                                @endphp
                                                
                                                @foreach($attributes as $attribute)
                                                    <div class="attribute-item mb-3">
                                                        <button type="button" class="btn btn-sm btn-danger remove-attribute">
                                                            <i class="ti ti-x"></i>
                                                        </button>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="form-label">Attribute Name <span class="text-danger">*</span></label>
                                                                    <input type="text" class="form-control" name="attributes[{{ $attributeIndex }}][name]" value="{{ $attribute->name }}" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="form-label">Display Name <span class="text-danger">*</span></label>
                                                                    <input type="text" class="form-control" name="attributes[{{ $attributeIndex }}][display_name]" value="{{ $attribute->display_name }}" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="form-label">Values (comma-separated) <span class="text-danger">*</span></label>
                                                                    @php
                                                                        $values = $product->variants
                                                                            ->flatMap(function($variant) use ($attribute) {
                                                                                return $variant->attributes
                                                                                    ->where('attribute_type_id', $attribute->id)
                                                                                    ->pluck('attribute_value.value')
                                                                                    ->unique()
                                                                                    ->toArray();
                                                                            })
                                                                            ->unique()
                                                                            ->values()
                                                                            ->toArray();
                                                                    @endphp
                                                                    <input type="text" class="form-control" name="attributes[{{ $attributeIndex }}][values]" value="{{ implode(',', $values) }}" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @php $attributeIndex++; @endphp
                                                @endforeach
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
                                                <i class="ti ti-refresh"></i> Update Variants
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div id="variants-container">
                                            @foreach($product->variants as $index => $variant)
                                                <div class="variant-item mb-3">
                                                    <h6>Variant {{ $index + 1 }}
                                                        @if($variant->is_default)
                                                            <span class="badge bg-success ms-2">Default</span>
                                                        @endif
                                                    </h6>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">SKU <span class="text-danger">*</span></label>
                                                                <input type="text" class="form-control" name="variants[{{ $variant->id }}][sku]" value="{{ $variant->sku }}" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">Purchase Price <span class="text-danger">*</span></label>
                                                                <input type="number" class="form-control" name="variants[{{ $variant->id }}][purchase_price]" value="{{ $variant->purchase_price }}" min="0" step="1000" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">Selling Price <span class="text-danger">*</span></label>
                                                                <input type="number" class="form-control" name="variants[{{ $variant->id }}][selling_price]" value="{{ $variant->selling_price }}" min="0" step="1000" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">Stock <span class="text-danger">*</span></label>
                                                                <input type="number" class="form-control" name="variants[{{ $variant->id }}][stock]" value="{{ $variant->stock }}" min="0" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">Status</label>
                                                                <select class="form-select" name="variants[{{ $variant->id }}][status]">
                                                                    <option value="active" {{ $variant->status == 'active' ? 'selected' : '' }}>Active</option>
                                                                    <option value="inactive" {{ $variant->status == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="form-check form-switch mt-4">
                                                                    <input class="form-check-input" type="checkbox" role="switch" id="default_variant_{{ $variant->id }}" name="default_variant" value="{{ $variant->id }}" {{ $variant->is_default ? 'checked' : '' }}>
                                                                    <label class="form-check-label" for="default_variant_{{ $variant->id }}">Set as default variant</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label class="form-label">Variant Image</label>
                                                                @if($variant->image)
                                                                    <div class="mb-2">
                                                                        <img src="{{ asset('storage/' . $variant->image) }}" class="variant-image-preview">
                                                                    </div>
                                                                @endif
                                                                <input type="file" class="form-control" name="variants[{{ $variant->id }}][image]">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Hidden fields for variant attributes -->
                                                    @foreach($variant->attributes as $attribute)
                                                        <input type="hidden" name="variants[{{ $variant->id }}][attributes][{{ $attribute->attributeType->name }}][name]" value="{{ $attribute->attributeType->name }}">
                                                        <input type="hidden" name="variants[{{ $variant->id }}][attributes][{{ $attribute->attributeType->name }}][display_name]" value="{{ $attribute->attributeType->display_name }}">
                                                        <input type="hidden" name="variants[{{ $variant->id }}][attributes][{{ $attribute->attributeType->name }}][value]" value="{{ $attribute->attributeValue->value }}">
                                                    @endforeach
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="ti ti-device-floppy me-1"></i> Update Product
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
        let attributeCount = {{ $attributes->count() }};
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
            if (confirm('Are you sure you want to remove this attribute? This will also remove all variant data for this attribute.')) {
                $(this).closest('.attribute-item').remove();
            }
        });

        // Handle default variant selection
        $('input[name="default_variant"]').change(function() {
            $('input[name="default_variant"]').not(this).prop('checked', false);
        });
    });
</script>
@endpush