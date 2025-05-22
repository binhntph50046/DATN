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
                        <form action="{{ route('admin.products.update', $product->id) }}" method="POST" enctype="multipart/form-data" id="productForm">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="has_variants" value="0">
                            @if($product->variants->isNotEmpty())
                                <input type="hidden" name="variant_id" value="{{ $product->variants->first()->id }}">
                            @endif
                            @if(isset($product->defaultVariant) && $product->defaultVariant)
                                <input type="hidden" name="variant_id" value="{{ $product->defaultVariant->id }}">
                            @endif
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
                                        <input type="number" class="form-control @error('stock') is-invalid @enderror" id="stock" name="stock" value="{{ old('stock', $product->variants->first()->stock ?? '') }}" min="0" required>
                                        @error('stock')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="purchase_price" class="form-label">Purchase Price</label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" class="form-control @error('purchase_price') is-invalid @enderror" id="purchase_price" name="purchase_price" value="{{ old('purchase_price', $product->variants->first()->purchase_price ?? '') }}" min="0" step="0.01" required>
                                            @error('purchase_price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="selling_price" class="form-label">Selling Price</label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" class="form-control @error('selling_price') is-invalid @enderror" id="selling_price" name="selling_price" value="{{ old('selling_price', $product->variants->first()->selling_price ?? '') }}" min="0" step="0.01" required>
                                            @error('selling_price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="discount_price" class="form-label">Discount Price (optional)</label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" class="form-control @error('discount_price') is-invalid @enderror" id="discount_price" name="discount_price" value="{{ old('discount_price', $product->variants->first()->discount_price ?? '') }}" min="0" step="0.01">
                                            @error('discount_price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="mb-3">
                                        <label for="images" class="form-label">Product Images</label>
                                        <input type="file" class="form-control @error('images') is-invalid @enderror" id="images" name="images[]" multiple>
                                        <div class="form-text text-muted">
                                            You can upload multiple images. All file types are allowed.
                                        </div>
                                        <div id="image-previews" class="d-flex flex-wrap gap-3 mt-3">
                                            @php
                                                $existingImages = [];
                                                if ($product->variants->first() && $product->variants->first()->images) {
                                                    $existingImages = json_decode($product->variants->first()->images, true) ?? [];
                                                }
                                            @endphp
                                            @if(!empty($existingImages))
                                                @foreach($existingImages as $index => $image)
                                                    <div class="position-relative d-inline-block" data-existing="true">
                                                        <div class="card" style="width: 120px;">
                                                            <img src="{{ asset( $image) }}" class="card-img-top" alt="Image {{ $index + 1 }}" style="height: 100px; object-fit: cover;">
                                                            <div class="card-body p-2 text-center">
                                                                <button type="button" class="btn btn-danger btn-sm w-100" onclick="removeImage(this, '{{ $image }}')">
                                                                    <i class="ti ti-trash"></i> Remove
                                                                </button>
                                                                <input type="hidden" name="existing_images[]" value="{{ $image }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                        @error('images')
                                            <div class="invalid-feedback d-block">{{ $message }}</div>
                                        @enderror
                                        @error('images.*')
                                            <div class="text-danger small d-block mt-1">{{ $message }}</div>
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

@push('scripts')
<script>
    // Function to remove an existing image
    window.removeImage = function(button, imagePath) {
        if (confirm('Are you sure you want to remove this image?')) {
            // Create a hidden input to track removed images if it doesn't exist
            let removedImagesInput = document.querySelector('input[name="removed_images[]"][value="' + imagePath + '"]');
            if (!removedImagesInput) {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'removed_images[]';
                input.value = imagePath;
                document.getElementById('productForm').appendChild(input);
            }
            
            // Remove the image preview
            button.closest('.position-relative').remove();
            
            // Show the file input if all existing images are removed
            toggleFileInputVisibility();
        }
    };

    // Toggle file input visibility based on existing images and max files limit
    function toggleFileInputVisibility() {
        const fileInput = document.getElementById('images');
        if (!fileInput) return;
        
        const existingImages = document.querySelectorAll('[data-existing]');
        const newImages = document.querySelectorAll('.position-relative:not([data-existing])');
        const totalImages = existingImages.length + newImages.length;
        const maxFiles = 50;
        
        // Always show file input if we haven't reached max files
        fileInput.style.display = totalImages >= maxFiles ? 'none' : 'block';
        
        // Update the file input's multiple attribute based on remaining slots
        fileInput.multiple = (maxFiles - totalImages) > 1;
    }

    document.addEventListener('DOMContentLoaded', function() {
        const imagePreviews = document.getElementById('image-previews');
        const fileInput = document.getElementById('images');
        if (!fileInput) return;
        
        const maxFiles = 50; // Maximum number of files allowed
        const maxSize = 1024 * 1024 * 100; // 100MB max file size

        // Initialize file input visibility and multiple attribute
        fileInput.multiple = true;
        toggleFileInputVisibility();
        
        // Make the label clickable
        const fileInputLabel = fileInput.previousElementSibling;
        if (fileInputLabel && fileInputLabel.tagName === 'LABEL') {
            fileInputLabel.style.cursor = 'pointer';
            fileInputLabel.addEventListener('click', function(e) {
                if (e.target !== fileInput) {
                    e.preventDefault();
                    fileInput.click();
                }
            });
        }

        // Handle file selection
        fileInput.addEventListener('change', function(e) {
            const files = Array.from(e.target.files);
            
            if (files.length > 0) {
                // Process new files
                let validFiles = [];
                
                // Validate files
                files.slice(0, maxFiles).forEach(file => {
                    if (!file.type.match('image.*')) {
                        alert(`File ${file.name} is not an image and will be skipped.`);
                        return;
                    }
                    
                    if (file.size > maxSize) {
                        alert(`File ${file.name} is too large. Maximum size is 100MB.`);
                        return;
                    }
                    
                    validFiles.push(file);
                });
                
                // Clear existing file input
                fileInput.value = '';
                
                // Process valid files
                validFiles.forEach(file => {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        const preview = document.createElement('div');
                        preview.className = 'position-relative d-inline-block me-2 mb-2';
                        preview.innerHTML = `
                            <div class="card" style="width: 120px;">
                                <img src="${e.target.result}" class="card-img-top" style="height: 100px; object-fit: cover;">
                                <div class="card-body p-2 text-center">
                                    <button type="button" class="btn btn-danger btn-sm w-100 remove-new-image">
                                        <i class="ti ti-trash"></i> Remove
                                    </button>
                                </div>
                            </div>
                        `;
                        
                        // Insert after all existing images
                        imagePreviews.appendChild(preview);
                    };
                    
                    reader.readAsDataURL(file);
                });
                
                // Update file input to include the new files
                const dataTransfer = new DataTransfer();
                validFiles.forEach(file => dataTransfer.items.add(file));
                fileInput.files = dataTransfer.files;
                
                // Update file input visibility
                toggleFileInputVisibility();
            }
        });
        
        // Handle click on remove buttons for new images
        document.addEventListener('click', function(e) {
            if (e.target.closest('.remove-new-image')) {
                const button = e.target.closest('.remove-new-image');
                const previewElement = button.closest('.position-relative');
                
                if (previewElement) {
                    previewElement.remove();
                    
                    // Update file input to remove the file
                    const dataTransfer = new DataTransfer();
                    const fileList = Array.from(fileInput.files);
                    const index = Array.from(imagePreviews.children).indexOf(previewElement);
                    
                    if (index !== -1) {
                        fileList.splice(index, 1);
                        fileList.forEach(file => dataTransfer.items.add(file));
                        fileInput.files = dataTransfer.files;
                    }
                    
                    // Update file input visibility
                    toggleFileInputVisibility();
                }
            }
        });

        // Add attribute functionality
        const addAttributeBtn = document.getElementById('add-attribute');
        if (addAttributeBtn) {
            addAttributeBtn.addEventListener('click', function() {
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
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="product_attributes[${index}][value]" placeholder="Value">
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" name="product_attributes[${index}][hex]" placeholder="Hex Color (optional)">
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="btn btn-danger remove-attribute">
                                <i class="ti ti-trash"></i>
                            </button>
                        </div>
                    </div>`;
                container.insertAdjacentHTML('beforeend', newRow);
            });
        }

        // Handle remove attribute button
        document.addEventListener('click', function(e) {
            if (e.target.closest('.remove-attribute')) {
                e.target.closest('.row').remove();
            }
        });

        // Image preview for single image upload (if exists)
        const imageInput = document.getElementById('image');
        const preview = document.getElementById('image-preview');
        
        if (imageInput && preview) {
            imageInput.addEventListener('change', function(e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.innerHTML = `<img src="${e.target.result}" class="img-thumbnail" style="max-width: 150px;">`;
                    };
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
        }
    });
</script>
@endpush
@endsection