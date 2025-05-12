@extends('admin.layouts.app')
@section('title', 'Add Simple Product')

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
    #image-preview {
        max-width: 200px;
        max-height: 200px;
        object-fit: cover;
        border-radius: 4px;
        display: none;
        margin-top: 10px;
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
                                <li class="breadcrumb-item" aria-current="page">Add Simple Product</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>Add Simple Product</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.products.store-simple') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="has_variants" value="0">

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
                                            <label for="purchase_price" class="form-label">Purchase Price <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <span class="input-group-text">₫</span>
                                                <input type="number" class="form-control @error('purchase_price') is-invalid @enderror" id="purchase_price" name="purchase_price" value="{{ old('purchase_price') }}" min="0" step="1000" required>
                                                @error('purchase_price')
                                                    <span class="invalid-feedback">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="price" class="form-label">Selling Price <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <span class="input-group-text">₫</span>
                                                <input type="number" class="form-control @error('price') is-invalid @enderror" id="price" name="price" value="{{ old('price') }}" min="0" step="1000" required>
                                                @error('price')
                                                    <span class="invalid-feedback">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="sale_price" class="form-label">Sale Price</label>
                                            <div class="input-group">
                                                <span class="input-group-text">₫</span>
                                                <input type="number" class="form-control @error('sale_price') is-invalid @enderror" id="sale_price" name="sale_price" value="{{ old('sale_price') }}" min="0" step="1000">
                                                @error('sale_price')
                                                    <span class="invalid-feedback">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="quantity" class="form-label">Stock Quantity <span class="text-danger">*</span></label>
                                            <input type="number" class="form-control @error('quantity') is-invalid @enderror" id="quantity" name="quantity" value="{{ old('quantity', 0) }}" min="0" required>
                                            @error('quantity')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>

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
                                            <label for="image" class="form-label">Product Image</label>
                                            <input type="file" class="form-control @error('image') is-invalid @enderror" id="image" name="image" accept="image/*">
                                            @error('image')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                            <div id="image-preview-container" class="mt-2">
                                                <img id="image-preview" src="#" alt="Preview" class="img-thumbnail" style="display: none; max-width: 200px; max-height: 200px;">
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="gallery" class="form-label">Product Gallery</label>
                                            <input type="file" class="form-control @error('gallery') is-invalid @enderror" id="gallery" name="gallery[]" multiple accept="image/*">
                                            @error('gallery')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                            <div id="gallery-preview" class="d-flex flex-wrap gap-2 mt-2"></div>
                                        </div>

                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" id="is_featured" name="is_featured" value="1" {{ old('is_featured') ? 'checked' : '' }}>
                                            <label class="form-check-label" for="is_featured">Featured Product</label>
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

                                        <!-- Product Attributes -->
                                        <div class="card mb-3">
                                            <div class="card-header">
                                                <h5>Product Attributes</h5>
                                                <button type="button" class="btn btn-sm btn-primary add-attribute">
                                                    <i class="ti ti-plus"></i> Add Attribute
                                                </button>
                                            </div>
                                            <div class="card-body" id="attributes-container">
                                                <!-- Attributes will be added here dynamically -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="ti ti-device-floppy me-1"></i> Save Product
                                    </button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">
                                        <i class="ti ti-x me-1"></i> Cancel
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@push('scripts')
<script>
    // Generate slug from name
    document.getElementById('generate-slug').addEventListener('click', function() {
        const name = document.getElementById('name').value;
        if (name) {
            fetch(`/admin/products/generate-slug?name=${encodeURIComponent(name)}`)
                .then(response => response.json())
                .then(data => {
                    document.getElementById('slug').value = data.slug;
                });
        }
    });

    // Image preview
    document.getElementById('image').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('image-preview');
                preview.src = e.target.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(file);
        }
    });

    // Gallery preview
    document.getElementById('gallery').addEventListener('change', function(e) {
        const container = document.getElementById('gallery-preview');
        container.innerHTML = '';
        
        Array.from(e.target.files).forEach(file => {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.className = 'img-thumbnail';
                img.style.maxWidth = '100px';
                img.style.maxHeight = '100px';
                img.style.marginRight = '5px';
                container.appendChild(img);
            }
            reader.readAsDataURL(file);
        });
    });

    // Add attribute field
    let attributeIndex = 0;
    document.querySelector('.add-attribute').addEventListener('click', function() {
        const container = document.getElementById('attributes-container');
        const index = attributeIndex++;
        
        const attributeHtml = `
            <div class="attribute-item" id="attribute-${index}">
                <div class="row">
                    <div class="col-md-5">
                        <input type="text" name="attributes[${index}][name]" class="form-control mb-2" placeholder="Attribute name (e.g., Camera)">
                    </div>
                    <div class="col-md-5">
                        <input type="text" name="attributes[${index}][value]" class="form-control mb-2" placeholder="Value (e.g., 48MP)">
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-danger btn-sm remove-attribute" data-index="${index}">
                            <i class="ti ti-trash"></i>
                        </button>
                    </div>
                </div>
            </div>`;
            
        container.insertAdjacentHTML('beforeend', attributeHtml);
    });

    // Remove attribute field
    document.addEventListener('click', function(e) {
        if (e.target.closest('.remove-attribute')) {
            const index = e.target.closest('.remove-attribute').dataset.index;
            document.getElementById(`attribute-${index}`).remove();
        }
    });
</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize CKEditor
            CKEDITOR.replace('content', {
                height: 300,
                filebrowserUploadUrl: "{{ route('admin.upload', ['_token' => csrf_token()]) }}",
                filebrowserUploadMethod: 'form'
            });

            // Generate slug from product name
            $('#generate-slug').click(function() {
                const name = $('#name').val();
                if (name) {
                    const slug = name.toLowerCase()
                        .replace(/[^\w\s-]/g, '') // Remove special chars
                        .replace(/\s+/g, '-')      // Replace spaces with -
                        .replace(/--+/g, '-');      // Replace multiple - with single -
                    $('#slug').val(slug);
                }
            });

            // Image preview
            function readURL(input, previewId) {
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $(previewId).attr('src', e.target.result).show();
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $('#image').change(function() {
                readURL(this, '#image-preview');
            });

            // Gallery preview
            $('#gallery').on('change', function() {
                const files = this.files;
                const previewContainer = $('#gallery-preview');
                previewContainer.empty();
                
                if (files.length > 0) {
                    for (let i = 0; i < files.length; i++) {
                        const file = files[i];
                        const reader = new FileReader();
                        
                        reader.onload = function(e) {
                            const preview = $('<img>', {
                                'src': e.target.result,
                                'class': 'img-thumbnail',
                                'style': 'width: 100px; height: 100px; object-fit: cover; margin-right: 5px; margin-bottom: 5px;'
                            });
                            previewContainer.append(preview);
                        };
                        
                        reader.readAsDataURL(file);
                    }
                }
            });
        });
    </script>
@endpush