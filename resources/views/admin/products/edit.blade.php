@extends('admin.layouts.app')
@section('title', 'Chỉnh Sửa Sản Phẩm')

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

    .image-preview-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 10px;
    }

    .image-preview-wrapper {
        position: relative;
        width: 100px;
        height: 100px;
    }

    .image-preview {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 4px;
    }

    .delete-image {
        position: absolute;
        top: -5px;
        right: -5px;
        background: #dc3545;
        color: white;
        border: none;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        font-size: 12px;
        line-height: 20px;
        text-align: center;
        cursor: pointer;
    }

    .delete-image:hover {
        background: #c82333;
    }
</style>

@section('content')
    <!-- Add Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Chỉnh Sửa Sản Phẩm</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Trang Chủ</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Sản Phẩm</a></li>
                                <li class="breadcrumb-item" aria-current="page">Chỉnh Sửa</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card custom-shadow">
                        <div class="card-header">
                            <h5>Chỉnh Sửa Sản Phẩm: {{ $product->name }}</h5>
                        </div>
                        <div class="card-body">
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <h6><strong>Có một số lỗi:</strong></h6>
                                    <ul class="mb-2">
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>

                                    @if ($errors->has('variants.*.images.*'))
                                        <div class="mt-2 p-2 bg-warning text-dark rounded">
                                            <i class="fas fa-exclamation-triangle"></i>
                                            <strong>Lưu ý về hình ảnh:</strong> Do lỗi xác thực, bạn cần chọn lại hình ảnh cho các biến thể.
                                            Chúng tôi đã lưu thông tin về các tệp đã chọn trước đó để bạn tham khảo.
                                </div>
                            @endif

                                    <div class="mt-2 p-2 bg-info text-white rounded">
                                        <i class="fas fa-info-circle"></i>
                                        <strong>Hướng dẫn:</strong>
                                        <ul class="mt-1 mb-0">
                                            <li>Kiểm tra và sửa các trường có lỗi ở trên</li>
                                            <li>Đảm bảo chọn ít nhất một thuộc tính với giá trị hợp lệ</li>
                                            <li>Không chọn trùng loại thuộc tính</li>
                                            <li>Chọn lại hình ảnh cho các biến thể nếu cần</li>
                                        </ul>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>

            <form action="{{ route('admin.products.update', $product) }}" method="POST" enctype="multipart/form-data" id="productForm">
                                @csrf
                                @method('PUT')

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                            <label for="name" class="form-label">Tên Sản Phẩm <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                id="name" 
                                name="name" 
                                value="{{ old('name', is_array($product->name) ? implode(', ', $product->name) : $product->name) }}" 
                                                required>
                                            @error('name')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                            <label for="category_id" class="form-label">Danh Mục <span class="text-danger">*</span></label>
                            <select class="form-select @error('category_id') is-invalid @enderror" id="category_id" name="category_id" required>
                                                <option value="">Chọn danh mục</option>
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
                            <label for="warranty_months" class="form-label">Thời Gian Bảo Hành (Tháng) <span class="text-danger">*</span></label>
                            <input type="number" class="form-control @error('warranty_months') is-invalid @enderror" id="warranty_months" name="warranty_months" value="{{ old('warranty_months', $product->warranty_months) }}" min="0" required>
                                            @error('warranty_months')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                            <label for="description" class="form-label">Mô Tả Ngắn</label>
                            <textarea class="form-control @error('description') is-invalid @enderror" 
                                id="description" 
                                name="description" 
                                rows="3">{{ old('description', is_array($product->description) ? implode("\n", $product->description) : $product->description) }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                            <label for="content" class="form-label">Nội Dung Chi Tiết</label>
                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" 
                                id="content" 
                                name="content">{{ old('content', is_array($product->content) ? implode("\n", $product->content) : $product->content) }}</textarea>
                                            @error('content')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                            <label class="form-label">Sản Phẩm Nổi Bật</label>
                                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="is_featured" name="is_featured" value="1" {{ old('is_featured', $product->is_featured) ? 'checked' : '' }}>
                                <label class="form-check-label" for="is_featured">Đặt làm sản phẩm nổi bật</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                            <label class="form-label">Trạng Thái</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="status" name="status" value="active" {{ old('status', $product->status) === 'active' ? 'checked' : '' }}>
                                <label class="form-check-label" for="status">Kích hoạt</label>
                                        </div>
                                    </div>
                                </div>
                </div>

                                <!-- Technical Specifications -->
                <div class="mb-3" id="specifications-section">
                    <label class="form-label">Thông Số Kỹ Thuật</label>
                                    <div id="categorySpecifications">
                        @if($specificationsData->isNotEmpty())
                                            <div id="specifications-wrapper">
                                @foreach($specificationsData->chunk(2) as $chunk)
                                    <div class="row mb-2 spec-row">
                                        @foreach($chunk as $spec)
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                    <label class="form-label">{{ is_array($spec['name']) ? implode(', ', $spec['name']) : $spec['name'] }}</label>
                                                    <input type="hidden" name="specifications[{{ $loop->parent->index * 2 + $loop->index }}][specification_id]" value="{{ $spec['id'] }}">
                                                    <input type="text" 
                                                        class="form-control" 
                                                        name="specifications[{{ $loop->parent->index * 2 + $loop->index }}][value]" 
                                                        value="{{ old('specifications.' . ($loop->parent->index * 2 + $loop->index) . '.value', is_array($spec['value']) ? implode(', ', $spec['value']) : $spec['value']) }}" 
                                                        placeholder="Nhập thông số (tùy chọn)">
                                                            </div>
                                                        </div>
                                        @endforeach
                                                        </div>
                                                @endforeach
                                            </div>
                        @else
                            <p class="text-muted">Không tìm thấy thông số kỹ thuật cho danh mục này.</p>
                                        @endif
                                    </div>
                                </div>

                                <!-- Variant Attributes -->
                <div class="mb-3" id="variant-attributes-section">
                    <label class="form-label">Thuộc Tính Biến Thể <span class="text-danger">*</span></label>
                                    <div id="variant-attributes">
                                        <div id="attributes-wrapper">
                                            <div class="row mb-2 attribute-row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                        <label class="form-label">Thuộc Tính 1</label>
                                        <select class="form-select attribute-type" name="attributes[0][attribute_type_id]" id="attribute_type_0">
                                                            <option value="">-- Chọn thuộc tính --</option>
                                                            @foreach ($attributeTypes as $type)
                                                                <option value="{{ $type->id }}" 
                                                    {{ (old('attributes.0.attribute_type_id') == $type->id || 
                                                        (isset($attributeValues[0]) && $attributeValues[0]['attribute_type_id'] == $type->id)) ? 'selected' : '' }}>
                                                                    {{ $type->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="mb-3">
                                        <label class="form-label">Giá Trị</label>
                                        <select class="form-select attribute-values" name="attributes[0][selected_values][]" id="values_0" multiple>
                                                            <option value="">-- Chọn giá trị --</option>
                                            @if(isset($attributeValues[0]))
                                                @foreach($attributeTypes->firstWhere('id', $attributeValues[0]['attribute_type_id'])->attributeValues as $value)
                                                                    <option value="{{ $value->id }}" 
                                                        {{ in_array($value->id, $attributeValues[0]['selected_values']) ? 'selected' : '' }}
                                                        data-hex="{{ is_array($value->hex) ? implode(', ', $value->hex) : $value->hex }}">
                                                                        {{ is_array($value->value) ? implode(', ', $value->value) : $value->value }}
                                                                    </option>
                                                                @endforeach
                                                            @endif
                                                        </select>
                                                        <div class="error-message" id="error-values-0">Vui lòng chọn ít nhất một giá trị.</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                        <label class="form-label">Thuộc Tính 2</label>
                                        <select class="form-select attribute-type" name="attributes[1][attribute_type_id]" id="attribute_type_1">
                                                            <option value="">-- Chọn thuộc tính --</option>
                                                            @foreach ($attributeTypes as $type)
                                                                <option value="{{ $type->id }}" 
                                                    {{ (old('attributes.1.attribute_type_id') == $type->id || 
                                                        (isset($attributeValues[1]) && $attributeValues[1]['attribute_type_id'] == $type->id)) ? 'selected' : '' }}>
                                                                    {{ $type->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="mb-3">
                                        <label class="form-label">Giá Trị</label>
                                        <select class="form-select attribute-values" name="attributes[1][selected_values][]" id="values_1" multiple>
                                                            <option value="">-- Chọn giá trị --</option>
                                            @if(isset($attributeValues[1]))
                                                @foreach($attributeTypes->firstWhere('id', $attributeValues[1]['attribute_type_id'])->attributeValues as $value)
                                                                    <option value="{{ $value->id }}" 
                                                        {{ in_array($value->id, $attributeValues[1]['selected_values']) ? 'selected' : '' }}
                                                        data-hex="{{ is_array($value->hex) ? implode(', ', $value->hex) : $value->hex }}">
                                                                        {{ is_array($value->value) ? implode(', ', $value->value) : $value->value }}
                                                                    </option>
                                                                @endforeach
                                                            @endif
                                                        </select>
                                                        <div class="error-message" id="error-values-1">Vui lòng chọn ít nhất một giá trị.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                    <div class="error-message" id="error-duplicate" style="display: none;">Không được chọn trùng loại thuộc tính.</div>
                                <div class="error-message" id="error-min-attributes" style="display: none;">Vui lòng chọn ít nhất một thuộc tính với giá trị hợp lệ.</div>
                </div>

                <!-- Generated Variants -->
                                <div class="mb-3">
                    <label class="form-label">Biến Thể Sản Phẩm</label> <br>
                    <button type="button" class="btn btn-primary mb-3" id="generate-variants">Tạo Biến Thể</button>
                                    <div id="variantsContainer">
                        @foreach($product->variants as $index => $variant)
                                            <div class="variant-row" data-index="{{ $index }}">
                                <h6>Biến Thể {{ $index + 1 }}: {{ is_array($variant->name) ? implode(' - ', $variant->name) : $variant->name }}</h6>
                                <input type="hidden" name="variants[{{ $index }}][id]" value="{{ $variant->id }}">
                                <input type="hidden" name="variants[{{ $index }}][name]" value="{{ is_array($variant->name) ? implode(' - ', $variant->name) : $variant->name }}">
                                <input type="hidden" name="variants[{{ $index }}][slug]" value="{{ is_array($variant->slug) ? implode('-', $variant->slug) : $variant->slug }}">
                                
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                            <label class="form-label">Tồn Kho</label>
                                            <input type="number" class="form-control" name="variants[{{ $index }}][stock]" min="0" value="{{ old("variants.{$index}.stock", $variant->stock) }}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                            <label class="form-label">Giá Nhập</label>
                                            <input type="number" class="form-control" name="variants[{{ $index }}][purchase_price]" min="0" step="0.01" value="{{ old("variants.{$index}.purchase_price", $variant->purchase_price) }}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                            <label class="form-label">Giá Bán</label>
                                            <input type="number" class="form-control" name="variants[{{ $index }}][selling_price]" min="0" step="0.01" value="{{ old("variants.{$index}.selling_price", $variant->selling_price) }}" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                            <label class="form-label">Hình Ảnh</label>
                                                            <input type="file" class="form-control variant-images" name="variants[{{ $index }}][images][]" multiple accept="image/*">
                                            <div class="image-preview-container" id="preview-{{ $index }}">
                                                @if($variant->images)
                                                    @php
                                                        $images = json_decode($variant->images, true);
                                                    @endphp
                                                    @if(is_array($images))
                                                        @foreach($images as $image)
                                                            <div class="image-preview-wrapper">
                                                                <img src="{{ asset($image) }}" class="image-preview">
                                                                <button type="button" class="delete-image" data-image="{{ $image }}" data-variant="{{ $variant->id }}">×</button>
                                                                        </div>
                                                                    @endforeach
                                                    @endif
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                            <label class="form-label">Biến Thể Mặc Định</label>
                                                            <div class="form-check form-switch">
                                                <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[{{ $index }}][is_default]" id="is_default_{{ $index }}" value="1" {{ old("variants.{$index}.is_default", $variant->is_default) ? 'checked' : '' }}>
                                                                <label class="form-check-label" for="is_default_{{ $index }}">Đặt làm mặc định</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                <!-- Hidden inputs for variant combinations -->
                                @foreach($variant->combinations as $combination)
                                    <input type="hidden" 
                                        name="variants[{{ $index }}][attributes][{{ $loop->index }}][attribute_type_id]" 
                                        value="{{ is_array($combination->attributeValue->attribute_type_id) ? $combination->attributeValue->attribute_type_id[0] : $combination->attributeValue->attribute_type_id }}">
                                    <input type="hidden" 
                                        name="variants[{{ $index }}][attributes][{{ $loop->index }}][selected_values]" 
                                        value="{{ is_array($combination->attribute_value_id) ? $combination->attribute_value_id[0] : $combination->attribute_value_id }}">
                                                    @endforeach
                                            </div>
                                        @endforeach
                                    </div>
                                </div>

                <!-- Hidden input for images to delete -->
                <input type="hidden" name="images_to_delete" id="images_to_delete" value="">
                <!-- Hidden input for variants to delete -->
                <input type="hidden" name="variants_to_delete" id="variants_to_delete" value="">

                                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">Cập Nhật Sản Phẩm</button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">Hủy</a>
                                </div>
                            </form>
                        </div>
                    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize Select2
            $('.attribute-values').select2({
                width: '100%',
                placeholder: 'Select values',
                allowClear: true,
                multiple: true,
                templateResult: formatAttributeValue,
                templateSelection: formatAttributeValue
            });

            function formatAttributeValue(data) {
                if (!data.id) return data.text;

                const option = data.element;
                const hex = option ? option.getAttribute('data-hex') : null;

                if (hex) {
                    return $(
                        `<span>${data.text} <span style="display:inline-block;width:15px;height:15px;background-color:${hex};margin-left:5px;vertical-align:middle;border:1px solid #ddd;"></span></span>`
                    );
                }

                return data.text;
            }

            // Handle category change
            const categorySelect = document.getElementById('category_id');
            let previousCategoryId = categorySelect.value;
            
            categorySelect.addEventListener('change', function() {
                const newCategoryId = this.value;
                const confirmMessage = 'CẢNH BÁO: Thay đổi danh mục sẽ:\n\n' +
                    '1. Xóa tất cả thông số kỹ thuật hiện tại\n' +
                    '2. Xóa tất cả thuộc tính và giá trị thuộc tính hiện tại\n' +
                    '3. Xóa tất cả biến thể (chúng sẽ được xóa mềm)\n' +
                    '4. Xóa tất cả hình ảnh liên quan\n\n' +
                    'Những thay đổi này sẽ có hiệu lực sau khi bạn nhấn Cập Nhật Sản Phẩm.\n\n' +
                    'Bạn có chắc chắn muốn thay đổi danh mục?';

                if (confirm(confirmMessage)) {
                    // Store old variants for deletion
                    const variantsToDelete = [];
                    document.querySelectorAll('.variant-row input[name$="[id]"]').forEach(input => {
                        if (input.value) {
                            variantsToDelete.push(input.value);
                        }
                    });
                    document.getElementById('variants_to_delete').value = JSON.stringify(variantsToDelete);

                    // Store old images for deletion
                    const imagesToDelete = [];
                    document.querySelectorAll('.image-preview-wrapper img').forEach(img => {
                        const imgSrc = img.src.split('/').slice(-3).join('/');
                        imagesToDelete.push(imgSrc);
                    });
                    document.getElementById('images_to_delete').value = JSON.stringify(imagesToDelete);

                    // Clear specifications
                    const specificationsWrapper = document.getElementById('specifications-wrapper');
                    if (specificationsWrapper) {
                        specificationsWrapper.innerHTML = '<p class="text-muted">Đang tải thông số kỹ thuật cho danh mục mới...</p>';
                    }

                    // Clear attributes and values
                    document.querySelectorAll('.attribute-type').forEach(select => {
                        select.value = '';
                        select.dispatchEvent(new Event('change'));
                    });

                    // Clear variants container
                    document.getElementById('variantsContainer').innerHTML = '';

                    // Add hidden input to track category change
                    let categoryChangeInput = document.getElementById('category_changed');
                    if (!categoryChangeInput) {
                        categoryChangeInput = document.createElement('input');
                        categoryChangeInput.type = 'hidden';
                        categoryChangeInput.name = 'category_changed';
                        categoryChangeInput.id = 'category_changed';
                        document.getElementById('productForm').appendChild(categoryChangeInput);
                    }
                    categoryChangeInput.value = 'true';

                    // Load new category data
                    loadCategoryData(newCategoryId);
                    previousCategoryId = newCategoryId;
                } else {
                    // Revert to previous category if user cancels
                    this.value = previousCategoryId;
                }
            });

            // Handle attribute type change
            $('.attribute-type').on('change', function() {
                const index = $(this).attr('id').replace('attribute_type_', '');
                const valueSelect = $(`#values_${index}`);
                const attributeTypeId = $(this).val();
                const selectedValues = valueSelect.val(); // Store current selected values
                const oldAttributeTypeId = $(this).data('old-value');

                if (attributeTypeId && oldAttributeTypeId && attributeTypeId !== oldAttributeTypeId) {
                    const confirmMessage = 'CẢNH BÁO: Thay đổi loại thuộc tính sẽ:\n\n' +
                        '1. Xóa tất cả giá trị đã chọn của thuộc tính này\n' +
                        '2. Xóa tất cả biến thể liên quan đến thuộc tính này\n' +
                        '3. Xóa tất cả hình ảnh của các biến thể bị ảnh hưởng\n\n' +
                        'Những thay đổi này sẽ có hiệu lực sau khi bạn nhấn Cập Nhật Sản Phẩm.\n\n' +
                        'Bạn có chắc chắn muốn thay đổi loại thuộc tính?';

                    if (!confirm(confirmMessage)) {
                        $(this).val(oldAttributeTypeId).trigger('change');
                    return;
                }
                }

                // Store new value as old value for next change
                $(this).data('old-value', attributeTypeId);

                if (attributeTypeId) {
                    fetch(`/admin/attributes/${attributeTypeId}/values`)
                        .then(response => response.json())
                        .then(data => {
                            valueSelect.empty();
                            
                            // Add placeholder option
                            valueSelect.append(new Option('-- Chọn giá trị --', '', false, false));

                            data.forEach(item => {
                                const option = new Option(item.value, item.id, false, false);
                                if (item.hex) {
                                    option.setAttribute('data-hex', item.hex);
                                }
                                valueSelect.append(option);
                            });

                            // Restore previously selected values if they exist in new options
                            if (selectedValues) {
                                valueSelect.val(selectedValues).trigger('change');
                            }
                        });
                        } else {
                    valueSelect.empty().trigger('change');
                    valueSelect.append(new Option('-- Chọn giá trị --', '', false, false));
                }
            });

            // Store initial attribute type values when page loads
            $('.attribute-type').each(function() {
                $(this).data('old-value', $(this).val());
            });

            // Handle attribute values change
            $('.attribute-values').on('change', function() {
                const index = $(this).attr('id').replace('values_', '');
                const attributeTypeId = $(`#attribute_type_${index}`).val();
                const oldValues = $(this).data('old-values') || [];
                const newValues = $(this).val() || [];

                // Only show warning if we're changing existing values and there are variants
                if (attributeTypeId && oldValues.length > 0 && 
                    JSON.stringify(oldValues.sort()) !== JSON.stringify(newValues.sort()) &&
                    $('#variantsContainer .variant-row').length > 0) {
                    
                    const confirmMessage = 'CẢNH BÁO: Thay đổi giá trị thuộc tính sẽ:\n\n' +
                        '1. Xóa tất cả biến thể hiện tại\n' +
                        '2. Xóa tất cả hình ảnh của các biến thể\n\n' +
                        'Bạn sẽ cần tạo lại các biến thể mới.\n' +
                        'Những thay đổi này sẽ có hiệu lực sau khi bạn nhấn Cập Nhật Sản Phẩm.\n\n' +
                        'Bạn có chắc chắn muốn thay đổi giá trị thuộc tính?';

                    if (!confirm(confirmMessage)) {
                        $(this).val(oldValues).trigger('change');
                                    return;
                                }

                    // Clear variants container since values changed
                    $('#variantsContainer').empty();
                }

                // Store new values as old values for next change
                $(this).data('old-values', $(this).val());
            });

            // Store initial attribute values
            $('.attribute-values').each(function() {
                $(this).data('old-values', $(this).val());
            });

            // Handle image deletion
            const imagesToDelete = new Set();
            document.querySelectorAll('.delete-image').forEach(button => {
                button.addEventListener('click', function() {
                    const imagePath = this.dataset.image;
                    const variantId = this.dataset.variant;
                    imagesToDelete.add(imagePath);
                    document.getElementById('images_to_delete').value = JSON.stringify(Array.from(imagesToDelete));
                    this.closest('.image-preview-wrapper').remove();
                });
            });

            // Handle variant generation
            document.getElementById('generate-variants').addEventListener('click', function() {
                if (!validateAllAttributes()) {
                    alert('Vui lòng kiểm tra lại các lựa chọn thuộc tính.');
                    return;
                }

                // Check if there are existing variants
                if ($('#variantsContainer .variant-row').length > 0) {
                    const confirmMessage = 'CẢNH BÁO: Tạo biến thể mới sẽ:\n\n' +
                        '1. Xóa tất cả biến thể hiện tại\n' +
                        '2. Xóa tất cả hình ảnh của các biến thể\n' +
                        '3. Tạo lại biến thể mới dựa trên các thuộc tính đã chọn\n\n' +
                        'Bạn có chắc chắn muốn tiếp tục?';

                    if (!confirm(confirmMessage)) {
                        return;
                    }
                }

                // Collect attribute data
                const attributeData = [];
            const selects = document.querySelectorAll('.attribute-type');
                const valueSelects = document.querySelectorAll('.attribute-values');

                selects.forEach((select, idx) => {
                    if (select && select.value) {
                        const valueSelect = valueSelects[idx];
                        if (valueSelect && $(valueSelect).val() && $(valueSelect).val().length > 0) {
                            const selectedValues = Array.from(valueSelect.selectedOptions).map(opt => ({
                                id: parseInt(opt.value),
                                value: opt.text.split(' ')[0],
                                attribute_type_id: parseInt(select.value),
                                hex: opt.getAttribute('data-hex')
                            }));

                            if (selectedValues.length > 0) {
                                attributeData.push({
                                    attribute_type_id: parseInt(select.value),
                                    selected_values: selectedValues
                                });
                            }
                        }
                    }
                });

                // Generate variants
                const combinations = generateCombinations(attributeData);
            const variantsContainer = document.getElementById('variantsContainer');
                const productName = document.getElementById('name').value;
                const existingVariants = Array.from(variantsContainer.children);
                const variantsToDelete = [];

                // Mark existing variants for deletion
                existingVariants.forEach(variant => {
                    const variantId = variant.querySelector('input[name$="[id]"]')?.value;
                if (variantId) {
                        variantsToDelete.push(variantId);
                    }
                });

                // Update variants to delete
                document.getElementById('variants_to_delete').value = JSON.stringify(variantsToDelete);

                // Clear and regenerate variants
            variantsContainer.innerHTML = '';
                combinations.forEach((combination, index) => {
                    const variantValues = combination.map(item => item.value).filter(Boolean);
                    const variantName = productName + (variantValues.length > 0 ? ' - ' + variantValues.join(' - ') : '');
                    const variantSlug = variantName
                        .toLowerCase()
                        .normalize('NFD')
                        .replace(/[\u0300-\u036f]/g, '')
                        .replace(/[^a-z0-9]+/g, '-')
                        .replace(/^-+|-+$/g, '');

                    const variantHtml = generateVariantHtml(index, variantName, variantSlug, combination);
                    variantsContainer.insertAdjacentHTML('beforeend', variantHtml);
                });

                initializeVariantListeners();
            });

            function generateVariantHtml(index, variantName, variantSlug, combination) {
                return `
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
                                    <input type="file" class="form-control variant-images" name="variants[${index}][images][]" multiple accept="image/*">
                                    <div id="preview-${index}" class="image-preview-container"></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Default Variant</label>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[${index}][is_default]" id="is_default_${index}" value="1" ${index === 0 ? 'checked' : ''}>
                                        <label class="form-check-label" for="is_default_${index}">Set as default</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        ${generateAttributeInputs(combination, index)}
                    </div>
                `;
            }

            function generateAttributeInputs(combination, variantIndex) {
                return combination.map((attrValue, attrIdx) => `
                    <input type="hidden" name="variants[${variantIndex}][attributes][${attrIdx}][attribute_type_id]" value="${attrValue.attribute_type_id}">
                    <input type="hidden" name="variants[${variantIndex}][attributes][${attrIdx}][selected_values]" value="${attrValue.id}">
                `).join('');
            }

            function generateCombinations(arrays) {
                if (!arrays || arrays.length === 0) return [];

                return arrays.reduce((acc, curr) => {
                    if (acc.length === 0) {
                        return curr.selected_values.map(value => [value]);
                    }

                    const combinations = [];
                    acc.forEach(combination => {
                        curr.selected_values.forEach(value => {
                            combinations.push([...combination, value]);
                        });
                    });
                    return combinations;
                }, []);
            }

        function validateAllAttributes() {
            const selects = document.querySelectorAll('.attribute-type');
                const valueSelects = document.querySelectorAll('.attribute-values');
            let valid = false;
            let hasError = false;

                // Reset error messages
            document.querySelectorAll('.error-message').forEach(error => {
                error.style.display = 'none';
            });

                // Check if at least one attribute is selected and valid
                selects.forEach((select, idx) => {
                    if (select.value && $(valueSelects[idx]).val() && $(valueSelects[idx]).val().length > 0) {
                valid = true;
            }
                });

                // Check for duplicate attribute types
                const selectedTypes = new Set();
                selects.forEach(select => {
                    if (select.value) {
                        if (selectedTypes.has(select.value)) {
                            document.getElementById('error-duplicate').style.display = 'block';
                        hasError = true;
                    }
                        selectedTypes.add(select.value);
                    }
                });

            if (!valid) {
                    document.getElementById('error-min-attributes').style.display = 'block';
            }

            return valid && !hasError;
        }

            function initializeVariantListeners() {
                // Initialize image preview
                document.querySelectorAll('.variant-images').forEach((input, index) => {
                    input.addEventListener('change', function() {
                        previewVariantImages(index, this);
                });
            });

                // Initialize default variant toggles
                document.querySelectorAll('.default-variant-toggle').forEach((checkbox, index) => {
                    checkbox.addEventListener('change', function() {
                    if (this.checked) {
                            // Uncheck all other default toggles
                            document.querySelectorAll('.default-variant-toggle').forEach((cb, idx) => {
                                if (idx !== index) {
                                    cb.checked = false;
                                }
                });
            } else {
                            // If unchecking, ensure at least one variant is default
                            const otherCheckboxes = Array.from(document.querySelectorAll('.default-variant-toggle'));
                            const hasDefaultChecked = otherCheckboxes.some(cb => cb !== this && cb.checked);
                            if (!hasDefaultChecked) {
                                // If no other variant is set as default, prevent unchecking
                                this.checked = true;
                                alert('Phải có ít nhất một biến thể được đặt làm mặc định.');
                            }
                    }
                });
            });
            }

            // Initialize default variant toggles for existing variants
            initializeVariantListeners();

            function previewVariantImages(index, input) {
                const previewContainer = document.getElementById(`preview-${index}`);
                if (input.files) {
                    Array.from(input.files).forEach(file => {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            const wrapper = document.createElement('div');
                            wrapper.className = 'image-preview-wrapper';

                            const img = document.createElement('img');
                            img.src = e.target.result;
                            img.className = 'image-preview';

                            const deleteBtn = document.createElement('button');
                            deleteBtn.type = 'button';
                            deleteBtn.className = 'delete-image';
                            deleteBtn.textContent = '×';
                            deleteBtn.onclick = function() {
                                wrapper.remove();
                            };

                            wrapper.appendChild(img);
                            wrapper.appendChild(deleteBtn);
                            previewContainer.appendChild(wrapper);
                        };
                        reader.readAsDataURL(file);
                    });
                }
            }

            // Load category data on page load if category is selected
            if (categorySelect.value) {
                loadCategoryData(categorySelect.value);
            }

            // Function to load category data
            function loadCategoryData(categoryId) {
                if (categoryId) {
                    // Load specifications
                    fetch(`/admin/categories/${categoryId}/specifications`)
                        .then(response => response.json())
                        .then(data => {
                            const container = document.getElementById('categorySpecifications');
                            if (data.length > 0) {
                                let html = '<div id="specifications-wrapper">';
                                for (let i = 0; i < data.length; i += 2) {
                                    html += '<div class="row mb-2 spec-row">';
                                    for (let j = 0; j < 2 && (i + j) < data.length; j++) {
                                        const spec = data[i + j];
                                        const oldValue = document.querySelector(`input[name="specifications[${i + j}][value]"]`)?.value || '';
                                        html += `
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">${spec.name}</label>
                                                    <input type="hidden" name="specifications[${i + j}][specification_id]" value="${spec.id}">
                                                    <input type="text" 
                                                        class="form-control" 
                                                        name="specifications[${i + j}][value]" 
                                                        value="${oldValue}"
                                                        placeholder="Enter specification (optional)">
                                                </div>
                                            </div>`;
                                    }
                                    html += '</div>';
                                }
                                html += '</div>';
                                container.innerHTML = html;
                            } else {
                                container.innerHTML = '<p class="text-muted">No specifications found for this category.</p>';
                            }
                        });

                    // Load attribute types
                    fetch(`/admin/categories/${categoryId}/attributes`)
                        .then(response => response.json())
                        .then(data => {
                            const attributeTypes = document.querySelectorAll('.attribute-type');
                            attributeTypes.forEach((select, index) => {
                                // Store current values before clearing
                                const currentTypeId = select.value;
                                const currentValues = $(`#values_${index}`).val();

                                select.options.length = 1; // Keep only the first option (placeholder)
                                data.forEach(attr => {
                                    const option = new Option(attr.name, attr.id);
                                    select.add(option);
                                });

                                // Restore previous selection if it exists in new options
                                if (currentTypeId && Array.from(select.options).some(opt => opt.value === currentTypeId)) {
                                    select.value = currentTypeId;
                                    // Trigger change event to load values
                                    $(select).trigger('change');
                                    // Store values to be restored after loading
                                    if (currentValues && currentValues.length) {
                                        setTimeout(() => {
                                            $(`#values_${index}`).val(currentValues).trigger('change');
                                        }, 500); // Wait for values to load
                                    }
                                }
                            });
                        });
                }
            }
        });
    </script>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
@endpush
