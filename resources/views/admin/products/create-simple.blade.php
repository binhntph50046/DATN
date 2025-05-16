@extends('admin.layouts.app')
@section('title', 'Create Simple Product')

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
                            <h5 class="m-b-10">Create Simple Product</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                            <li class="breadcrumb-item" aria-current="page">Create Simple</li>
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
                        <h5>Create New Simple Product</h5>
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
                        <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('POST')
                            <input type="hidden" name="has_variants" value="0">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}">
                                        @error('name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="slug" id="slug" value="{{ old('slug') }}">
                            <div class="row">
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description (optional)</label>
                                    <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description">{{ old('description') }}</textarea>
                                    @error('description')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="content" class="form-label">Content (optional)</label>
                                    <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content" rows="10">{{ old('content') }}</textarea>
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
                                        <label for="warranty_months" class="form-label">Warranty Months</label>
                                        <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', 12) }}" min="0">
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
                                        <input type="text" class="form-control @error('model') is-invalid @enderror" id="model" name="model" value="{{ old('model') }}">
                                        @error('model')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="series" class="form-label">Series (optional)</label>
                                        <input type="text" class="form-control @error('series') is-invalid @enderror" id="series" name="series" value="{{ old('series') }}">
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
                                            <option value="0" {{ old('is_featured', 0) == 0 ? 'selected' : '' }}>No</option>
                                            <option value="1" {{ old('is_featured') == 1 ? 'selected' : '' }}>Yes</option>
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
                                            <option value="active" {{ old('status', 'active') == 'active' ? 'selected' : '' }}>Active</option>
                                            <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
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
                                        <input type="number" class="form-control @error('stock') is-invalid @enderror" id="stock" name="stock" value="{{ old('stock', 0) }}" min="0" required>
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
                                            <input type="number" class="form-control @error('purchase_price') is-invalid @enderror" id="purchase_price" name="purchase_price" value="{{ old('purchase_price', 0) }}" min="0" step="0.01" required>
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
                                            <input type="number" class="form-control @error('selling_price') is-invalid @enderror" id="selling_price" name="selling_price" value="{{ old('selling_price', 0) }}" min="0" step="0.01" required>
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
                                            <input type="number" class="form-control @error('discount_price') is-invalid @enderror" id="discount_price" name="discount_price" value="{{ old('discount_price') }}" min="0" step="0.01">
                                            @error('discount_price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="mb-3">
                                        <label for="images" class="form-label">Product Images</label>
                                        <input type="file" class="form-control @error('images') is-invalid @enderror" id="images" name="images[]" multiple accept="image/*" onchange="previewImages(this)">
                                        <div class="form-text text-muted">
                                            You can upload multiple images (JPG, PNG, GIF, etc,...)
                                        </div>
                                        <div id="image-previews" class="d-flex flex-wrap gap-3 mt-3">
                                            <!-- Preview container for selected images -->
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
                            <!-- Product Attributes -->
                            <div class="mb-3">
                                <label class="form-label">Product Attributes</label>
                                <div id="product-attributes">
                                    <!-- Default Attribute -->
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
                                </div>
                                <button type="button" class="btn btn-outline-primary mt-2" id="add-attribute">Add Attribute</button>
                            </div>

                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Create Simple Product</button>
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
    // Hàm xử lý preview ảnh
    function previewImages(input) {
        const imagePreviews = document.getElementById('image-previews');
        imagePreviews.innerHTML = ''; // Xóa các preview cũ
        
        if (input.files && input.files.length > 0) {
            // Hiển thị preview cho từng file
            Array.from(input.files).forEach((file, index) => {
                if (!file.type.match('image.*')) {
                    alert(`File ${file.name} không phải là ảnh`);
                    return; // Bỏ qua nếu không phải là ảnh
                }
                
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.createElement('div');
                    preview.className = 'position-relative';
                    preview.style.width = '100px';
                    preview.style.height = '100px';
                    preview.style.overflow = 'hidden';
                    preview.style.borderRadius = '8px';
                    preview.style.border = '1px solid #ddd';
                    preview.style.position = 'relative';
                    preview.style.marginRight = '10px';
                    preview.style.marginBottom = '10px';
                    
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.style.width = '100%';
                    img.style.height = '100%';
                    img.style.objectFit = 'cover';
                    
                    // Thêm nút xóa
                    const removeBtn = document.createElement('button');
                    removeBtn.type = 'button';
                    removeBtn.className = 'btn btn-danger btn-sm';
                    removeBtn.style.position = 'absolute';
                    removeBtn.style.top = '2px';
                    removeBtn.style.right = '2px';
                    removeBtn.style.padding = '0.15rem 0.3rem';
                    removeBtn.style.fontSize = '0.6rem';
                    removeBtn.style.lineHeight = '1';
                    removeBtn.style.borderRadius = '50%';
                    removeBtn.innerHTML = '&times;';
                    removeBtn.onclick = function() {
                        // Xóa ảnh khỏi danh sách chọn
                        const dt = new DataTransfer();
                        const { files } = input;
                        
                        for (let i = 0; i < files.length; i++) {
                            if (index !== i) {
                                dt.items.add(files[i]);
                            }
                        }
                        
                        input.files = dt.files;
                        preview.remove(); // Xóa preview
                        
                        // Kích hoạt sự kiện change để cập nhật lại danh sách file
                        const event = new Event('change');
                        input.dispatchEvent(event);
                    };
                    
                    preview.appendChild(img);
                    preview.appendChild(removeBtn);
                    imagePreviews.appendChild(preview);
                };
                
                reader.readAsDataURL(file);
            });
        }
    }
    
    // Khởi tạo khi DOM đã tải xong
    document.addEventListener('DOMContentLoaded', function() {
        const maxFiles = 50; // Tăng giới hạn số lượng file lên 50
        // Bỏ giới hạn kích thước file và loại file

        // Function to create preview element
        function createPreviewElement(file, dataUrl) {
            const previewId = 'preview-' + Math.random().toString(36).substr(2, 9);
            const preview = document.createElement('div');
            preview.className = 'position-relative d-inline-block me-3 mb-3';
            preview.id = previewId;
            
            preview.innerHTML = `
                <div class="card" style="width: 120px;">
                    <img src="${dataUrl}" class="card-img-top" alt="${file.name}" style="height: 100px; object-fit: cover;">
                    <div class="card-body p-2 text-center">
                        <button type="button" class="btn btn-danger btn-sm w-100 remove-image" data-preview-id="${previewId}">
                            <i class="ti ti-trash"></i> Remove
                        </button>
                    </div>
                </div>
            `;
            
            return { preview, previewId };
        }

        // Function to update file input
        function updateFileInput() {
            const dt = new DataTransfer();
            const currentPreviews = imagePreviews.querySelectorAll('[data-file-name]');
            const currentFileNames = Array.from(currentPreviews).map(el => el.dataset.fileName);
            
            // Add all files that are still in the preview
            if (fileInput.files) {
                for (let i = 0; i < fileInput.files.length; i++) {
                    if (currentFileNames.includes(fileInput.files[i].name)) {
                        dt.items.add(fileInput.files[i]);
                    }
                }
            }
            
            fileInput.files = dt.files;
        }

        // Handle file selection
        if (fileInput) {
            fileInput.addEventListener('change', function(e) {
                const files = Array.from(e.target.files || []);
                const existingPreviews = imagePreviews.querySelectorAll('[data-file-name]').length;
                
                if (files.length + existingPreviews > maxFiles) {
                    alert(`You can only upload up to ${maxFiles} images in total.`);
                    this.value = '';
                    return;
                }

                files.forEach(file => {
                    // Không kiểm tra loại file và kích thước file

                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const { preview } = createPreviewElement(file, e.target.result);
                        preview.dataset.fileName = file.name;
                        imagePreviews.appendChild(preview);

                        // Add event listener for the remove button
                        const removeBtn = preview.querySelector('.remove-image');
                        removeBtn.addEventListener('click', function() {
                            preview.remove();
                            updateFileInput();
                        });
                    };
                    reader.readAsDataURL(file);
                });

                // Reset the input to allow selecting the same file again
                this.value = '';
            });
        }

        // Handle remove buttons for existing images (in edit mode)
        document.addEventListener('click', function(e) {
            if (e.target.closest('.remove-image')) {
                const button = e.target.closest('.remove-image');
                const previewElement = button.closest('[data-file-name]');
                if (previewElement) {
                    previewElement.remove();
                    updateFileInput();
                }
            }
        });
    });

    // Function to remove an image
    function removeImage(button, imagePath) {
        if (confirm('Are you sure you want to remove this image?')) {
            // Create hidden input to track removed images
            let removedInput = document.querySelector('input[name="removed_images[]"][value="' + imagePath + '"]');
            if (!removedInput) {
                removedInput = document.createElement('input');
                removedInput.type = 'hidden';
                removedInput.name = 'removed_images[]';
                removedInput.value = imagePath;
                document.querySelector('form').appendChild(removedInput);
            }
            
            // Remove the image preview
            const previewElement = button.closest('[data-existing]');
            if (previewElement) {
                previewElement.remove();
            }
        }
    }

    document.getElementById('add-attribute').addEventListener('click', function () {
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
                <div class="col-md-3">
                    <input type="text" class="form-control" name="product_attributes[${index}][value]" placeholder="Value">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="product_attributes[${index}][hex]" placeholder="Hex Code (e.g., #FFFFFF)">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger remove-attribute">Remove</button>
                </div>
            </div>`;
        container.insertAdjacentHTML('beforeend', newRow);
    });

    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-attribute')) {
            e.target.closest('.row').remove();
        }
    });

    document.getElementById('name').addEventListener('input', function() {
        let slug = this.value
            .toLowerCase()
            .trim()
            .replace(/[^a-z0-9\s-]/g, '') // Remove special characters
            .replace(/\s+/g, '-')         // Replace spaces with hyphens
            .replace(/-+/g, '-');         // Replace multiple hyphens with single hyphen
        document.getElementById('slug').value = slug;
    });

    // Add image preview functionality
    document.getElementById('image').addEventListener('change', function(e) {
        const preview = document.getElementById('image-preview');
        const file = e.target.files[0];
        
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.style.display = 'block';
                preview.querySelector('img').src = e.target.result;
            }
            reader.readAsDataURL(file);
        } else {
            preview.style.display = 'none';
        }
    });
</script>
@endsection