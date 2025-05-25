@extends('admin.layouts.app')
@section('title', 'Edit Product')

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
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Edit Product</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">Edit</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card custom-shadow">
                        <div class="card-header">
                            <h5>Edit Product</h5>
                        </div>
                        <div class="card-body">
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <h6><strong>Errors occurred:</strong></h6>
                                    <ul class="mb-2">
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            @if ($errors->any())
                                <div class="alert alert-warning">
                                    <strong>Note:</strong> You need to reselect images for newly added variants because browsers cannot automatically retain file selections after errors.
                                </div>
                            @endif

                            <form action="{{ route('admin.products.update', $product->id) }}" method="POST"
                                enctype="multipart/form-data" id="productForm">
                                @csrf
                                @method('PUT')
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Product Name <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                id="name" name="name" value="{{ old('name', $product->name) }}"
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
                                            <label for="category_id" class="form-label">Category <span
                                                    class="text-danger">*</span></label>
                                            <select class="form-select @error('category_id') is-invalid @enderror"
                                                id="category_id" name="category_id" required>
                                                <option value="">Select Category</option>
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}"
                                                        {{ old('category_id', $product->category_id) == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}</option>
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
                                                value="{{ old('warranty_months', $product->warranty_months) }}"
                                                min="0" required>
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
                                                rows="3">{{ old('description', $product->description) }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="content" class="form-label">Detailed Description</label>
                                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content">{{ old('content', $product->content) }}</textarea>
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
                                                    {{ old('is_featured', $product->is_featured) ? 'checked' : '' }}>
                                                <label class="form-check-label" for="is_featured">Set as Featured</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Product Status <span class="text-danger">*</span></label>
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
                                <!-- Category Specifications -->
                                <div class="mb-3">
                                    <label class="form-label">Technical Specifications</label>
                                    <div id="categorySpecifications">
                                        @if (!empty($specificationsData) && count($specificationsData) > 0)
                                            <div id="specifications-wrapper">
                                                @for ($i = 0; $i < count($specificationsData); $i += 2)
                                                    <div class="row mb-2 spec-row">
                                                        <div class="col-md-6">
                                                            @php $spec = $specificationsData[$i]; @endphp
                                                            <div class="mb-3">
                                                                <label class="form-label">{{ $spec['name'] }} <span class="text-danger">*</span></label>
                                                                <input type="hidden" name="specifications[{{ $i }}][specification_id]" value="{{ $spec['id'] }}">
                                                                @php
                                                                    $oldValue = old('specifications.' . $i . '.value');
                                                                    $inputValue = ($oldValue !== null && $oldValue !== '') ? $oldValue : $spec['value'];
                                                                @endphp
                                                                <input type="text" class="form-control" name="specifications[{{ $i }}][value]" value="{{ $inputValue }}" required>
                                                            </div>
                                                        </div>
                                                        @if (isset($specificationsData[$i + 1]))
                                                            <div class="col-md-6">
                                                                @php $spec = $specificationsData[$i + 1]; @endphp
                                                                <div class="mb-3">
                                                                    <label class="form-label">{{ $spec['name'] }} <span class="text-danger">*</span></label>
                                                                    <input type="hidden" name="specifications[{{ $i + 1 }}][specification_id]" value="{{ $spec['id'] }}">
                                                                    @php
                                                                        $oldValue = old('specifications.' . ($i + 1) . '.value');
                                                                        $inputValue = ($oldValue !== null && $oldValue !== '') ? $oldValue : $spec['value'];
                                                                    @endphp
                                                                    <input type="text" class="form-control" name="specifications[{{ $i + 1 }}][value]" value="{{ $inputValue }}" required>
                                                                </div>
                                                            </div>
                                                        @endif
                                                    </div>
                                                @endfor
                                            </div>
                                        @else
                                            <p class="text-muted">No specifications found for this category.</p>
                                        @endif
                                    </div>
                                </div>
                                <!-- Variant Attributes -->
                                <div class="mb-3">
                                    <label class="form-label">Variant Attributes <span class="text-danger">*</span></label>
                                    <div id="variant-attributes">
                                        <div id="attributes-wrapper">
                                            <div class="row mb-2 attribute-row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Attribute 1 <span class="text-danger">*</span></label>
                                                        <select class="form-select attribute-type" name="attributes[0][attribute_type_id]" id="attribute_type_0" required>
                                                            <option value="">-- Select Attribute --</option>
                                                            @foreach ($attributeTypes as $type)
                                                                <option value="{{ $type->id }}" {{ old('attributes.0.attribute_type_id', $attributeValues[0]['attribute_type_id'] ?? '') == $type->id ? 'selected' : '' }}>{{ $type->name }}</option>
                                                            @endforeach
                                                        </select>
                                                        <div class="error-message" id="error-type-0">Please select an attribute type.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Values <span class="text-danger">*</span></label>
                                                        @php
                                                            // Xử lý value và hex cho thuộc tính 1
                                                            $valueArr0 = $attributeValues[0]['value'] ?? [];
                                                            if (is_string($valueArr0)) {
                                                                $decoded = json_decode($valueArr0, true);
                                                                $valueArr0 = is_array($decoded) ? $decoded : [$valueArr0];
                                                            }
                                                            $valueStr0 = implode(', ', $valueArr0);
                                                            $hexArr0 = $attributeValues[0]['hex'] ?? [];
                                                            if (is_string($hexArr0)) {
                                                                $decoded = json_decode($hexArr0, true);
                                                                $hexArr0 = is_array($decoded) ? $decoded : [$hexArr0];
                                                            }
                                                            $hexStr0 = implode(', ', $hexArr0);
                                                        @endphp
                                                        <input type="text" class="form-control attribute-values" name="attributes[0][value]" id="values_0" placeholder="Values (e.g., Red, Blue)" value="{{ old('attributes.0.value', $valueStr0) }}" required>
                                                        <div class="error-message" id="error-values-0">Please enter valid values.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Color Code (if any)</label>
                                                        @php
                                                            // Xử lý value và hex cho thuộc tính 1
                                                            $valueArr0 = $attributeValues[0]['value'] ?? [];
                                                            if (is_string($valueArr0)) {
                                                                $decoded = json_decode($valueArr0, true);
                                                                $valueArr0 = is_array($decoded) ? $decoded : [$valueArr0];
                                                            }
                                                            $valueStr0 = implode(', ', $valueArr0);
                                                            $hexArr0 = $attributeValues[0]['hex'] ?? [];
                                                            if (is_string($hexArr0)) {
                                                                $decoded = json_decode($hexArr0, true);
                                                                $hexArr0 = is_array($decoded) ? $decoded : [$hexArr0];
                                                            }
                                                            $hexStr0 = implode(', ', $hexArr0);
                                                        @endphp
                                                        <input type="text" class="form-control attribute-hex" name="attributes[0][hex]" id="hex_0" placeholder="#000000" value="{{ old('attributes.0.hex', $hexStr0) }}">
                                                        <div class="error-message" id="error-hex-0">Invalid color code.</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Attribute 2</label>
                                                        <select class="form-select attribute-type" name="attributes[1][attribute_type_id]" id="attribute_type_1">
                                                            <option value="">-- Select Attribute --</option>
                                                            @foreach ($attributeTypes as $type)
                                                                <option value="{{ $type->id }}" {{ old('attributes.1.attribute_type_id', $attributeValues[1]['attribute_type_id'] ?? '') == $type->id ? 'selected' : '' }}>{{ $type->name }}</option>
                                                            @endforeach
                                                        </select>
                                                        <div class="error-message" id="error-type-1">Please select an attribute type.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Values</label>
                                                        @php
                                                            // Xử lý value và hex cho thuộc tính 2
                                                            $valueArr1 = $attributeValues[1]['value'] ?? [];
                                                            if (is_string($valueArr1)) {
                                                                $decoded = json_decode($valueArr1, true);
                                                                $valueArr1 = is_array($decoded) ? $decoded : [$valueArr1];
                                                            }
                                                            $valueStr1 = implode(', ', $valueArr1);
                                                            $hexArr1 = $attributeValues[1]['hex'] ?? [];
                                                            if (is_string($hexArr1)) {
                                                                $decoded = json_decode($hexArr1, true);
                                                                $hexArr1 = is_array($decoded) ? $decoded : [$hexArr1];
                                                            }
                                                            $hexStr1 = implode(', ', $hexArr1);
                                                        @endphp
                                                        <input type="text" class="form-control attribute-values" name="attributes[1][value]" id="values_1" placeholder="Values (e.g., Red, Blue)" value="{{ old('attributes.1.value', $valueStr1) }}">
                                                        <div class="error-message" id="error-values-1">Please enter valid values.</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Color Code (if any)</label>
                                                        <input type="text" class="form-control attribute-hex" name="attributes[1][hex]" id="hex_1" placeholder="#000000" value="{{ old('attributes.1.hex', $hexStr1) }}">
                                                        <div class="error-message" id="error-hex-1">Invalid color code.</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="error-message" id="error-min-attributes">At least one valid attribute is required.</div>
                                            <div class="error-message" id="error-duplicate">Cannot select the same attribute type.</div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Product Variants -->
                                <div class="mb-3">
                                    <label class="form-label">Product Variants</label> <br>
                                    <button type="button" class="btn btn-primary mb-3" id="generate-variants">Regenerate Variants</button>
                                    <div id="variantsContainer">
                                        @php
                                            $variants = old('variants', $product->variants->toArray());
                                        @endphp
                                        @foreach ($variants as $index => $variant)
                                            <div class="variant-row" data-index="{{ $index }}">
                                                <h6>Variant {{ $index + 1 }}: {{ $variant['name'] ?? '' }}</h6>
                                                <input type="hidden" name="variants[{{ $index }}][id]" value="{{ $variant['id'] ?? '' }}">
                                                <input type="hidden" name="variants[{{ $index }}][name]" value="{{ $variant['name'] ?? '' }}">
                                                <input type="hidden" name="variants[{{ $index }}][slug]" value="{{ $variant['slug'] ?? '' }}">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Stock</label>
                                                            <input type="number" class="form-control" name="variants[{{ $index }}][stock]" min="0" value="{{ $variant['stock'] ?? 0 }}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Purchase Price</label>
                                                            <input type="number" class="form-control" name="variants[{{ $index }}][purchase_price]" min="0" step="0.01" value="{{ $variant['purchase_price'] ?? 0 }}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="mb-3">
                                                            <label class="form-label">Selling Price</label>
                                                            <input type="number" class="form-control" name="variants[{{ $index }}][selling_price]" min="0" step="0.01" value="{{ $variant['selling_price'] ?? 0 }}" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Images</label>
                                                            <input type="file" class="form-control variant-images" name="variants[{{ $index }}][images][]" multiple accept="image/*">
                                                            <div id="preview-{{ $index }}" class="preview-images-container mt-2 d-flex flex-wrap gap-2">
                                                                @if (!empty($variant['images']))
                                                                    @foreach (is_array($variant['images']) ? $variant['images'] : json_decode($variant['images'], true) as $image)
                                                                        <div class="position-relative">
                                                                            <img src="{{ asset($image) }}" class="preview-image">
                                                                            <button type="button" class="btn btn-danger btn-sm position-absolute top-0 end-0 remove-image" data-variant="{{ $index }}" data-image="{{ $image }}">
                                                                                <i class="ti ti-x"></i>
                                                                            </button>
                                                                        </div>
                                                                    @endforeach
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Default Variant</label>
                                                            <div class="form-check form-switch">
                                                                <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[{{ $index }}][is_default]" id="is_default_{{ $index }}" value="1" {{ !empty($variant['is_default']) ? 'checked' : '' }}>
                                                                <label class="form-check-label" for="is_default_{{ $index }}">Set as Default</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                @if (isset($variant['attributes']) && is_array($variant['attributes']))
                                                    @foreach ($variant['attributes'] as $attrIdx => $attr)
                                                        <input type="hidden" name="variants[{{ $index }}][attributes][{{ $attrIdx }}][attribute_type_id]" value="{{ $attr['attribute_type_id'] }}">
                                                        <input type="hidden" name="variants[{{ $index }}][attributes][{{ $attrIdx }}][value]" value="{{ $attr['value'] }}">
                                                        <input type="hidden" name="variants[{{ $index }}][attributes][{{ $attrIdx }}][hex]" value="{{ $attr['hex'] ?? '' }}">
                                                    @endforeach
                                                @endif
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Update Product</button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // Truyền dữ liệu old specifications từ Blade sang JavaScript
        const oldSpecifications = @json(old('specifications', []));
        const productSpecifications = @json($product->specifications->pluck('pivot.value', 'id')); // Lấy giá trị theo ID spec

        let attributeIndex = 0;
        let selectedTypes = new Set();
        let imagesToDelete = new Set();
        let variantsToDelete = new Set(); // Thêm set để theo dõi biến thể cần xóa
        let askedCategory = false;
        let askedAttribute = false;
        let askedValueOrHex = false;

        document.addEventListener('DOMContentLoaded', function() {
            const categorySelect = document.getElementById('category_id');
            if (categorySelect) {
                categorySelect.setAttribute('data-old-category', categorySelect.value);
            }
            restoreImagesFromTemp(); // Khôi phục ảnh tạm thời nếu có

            // Lưu lại phần thuộc tính của từng biến thể khi load trang
            const variantsContainer = document.getElementById('variantsContainer');
            variantsContainer.querySelectorAll('.variant-row').forEach(row => {
                const variantNameInput = row.querySelector('input[name^="variants"][name$="[name]"]');
                if (variantNameInput) {
                    const currentVariantName = variantNameInput.value;
                    const parts = currentVariantName.split(' - ');
                    parts.shift(); // Bỏ tên sản phẩm cũ
                    // Lưu lại phần thuộc tính vào data-attributes
                    row.dataset.attributes = parts.join(' - ');
                }
            });

            // Thêm sự kiện cho input tên sản phẩm
            const productNameInput = document.getElementById('name');
            if (productNameInput) {
                productNameInput.addEventListener('input', function() {
                    const productName = this.value.trim();
                    variantsContainer.querySelectorAll('.variant-row').forEach(row => {
                        const variantTitle = row.querySelector('h6');
                        const variantNameInput = row.querySelector('input[name^="variants"][name$="[name]"]');
                        const variantSlugInput = row.querySelector('input[name^="variants"][name$="[slug]"]');
                        const attributes = row.dataset.attributes || '';
                        
                        if (variantTitle && variantNameInput && variantSlugInput) {
                            const newVariantName = attributes ? (productName + ' - ' + attributes) : productName;
                            variantTitle.textContent = `Variant ${parseInt(row.dataset.index) + 1}: ${newVariantName}`;
                            variantNameInput.value = newVariantName;
                            variantSlugInput.value = newVariantName.toLowerCase().replace(/\s+/g, '-');
                        }
                    });
                });
            }

            // Thêm sự kiện change cho các select box thuộc tính
            document.querySelectorAll('.attribute-type').forEach((select, idx) => {
                // Lưu giá trị ban đầu
                select.setAttribute('data-old-value', select.value);

                // Thêm sự kiện change
                select.addEventListener('change', function() {
                    const oldValue = this.getAttribute('data-old-value');
                    const newValue = this.value;

                    // Nếu giá trị không thay đổi hoặc đang xóa giá trị (chọn option rỗng) thì không cần xác nhận
                    if (oldValue === newValue || (!oldValue && !newValue)) {
                        this.setAttribute('data-old-value', newValue);
                        return;
                    }

                    // Hiển thị dialog xác nhận
                    if (confirm('Thay đổi thuộc tính sẽ xóa toàn bộ giá trị thuộc tính, mã màu và biến thể. Bạn có chắc chắn?')) {
                        askedAttribute = true;
                        markAllVariantImagesForDelete();
                        markAllAttributesForDelete();
                        // Xóa giá trị, mã màu (reset input)
                        if (document.getElementById(`values_${idx}`)) document.getElementById(`values_${idx}`).value = '';
                        if (document.getElementById(`hex_${idx}`)) document.getElementById(`hex_${idx}`).value = '';
                        this.setAttribute('data-old-value', newValue);
                    } else {
                        // Nếu người dùng không đồng ý, khôi phục lại giá trị cũ
                        this.value = oldValue;
                        return;
                    }

                    validateAttributeType(idx);
                });
            });
        });

        // Thay đổi danh mục
        const categorySelect = document.getElementById('category_id');
        if (categorySelect) {
            categorySelect.addEventListener('change', function() {
                const categoryId = this.value;
                const oldCategoryId = this.getAttribute('data-old-category');
                if (!oldCategoryId || oldCategoryId === categoryId) {
                    handleCategoryChange(categoryId);
                    return;
                }
                if (!askedCategory) {
                    if (confirm('Thay đổi danh mục sẽ xóa toàn bộ thuộc tính, giá trị thuộc tính, mã màu và biến thể. Bạn có chắc chắn?')) {
                        askedCategory = true;
                    markAllVariantImagesForDelete();
                        markAllAttributesForDelete();
                        // Xóa thuộc tính, giá trị, mã màu (reset input)
                        document.getElementById('attribute_type_0').selectedIndex = 0;
                        document.getElementById('attribute_type_1').selectedIndex = 0;
                        document.getElementById('values_0').value = '';
                        document.getElementById('values_1').value = '';
                        document.getElementById('hex_0').value = '';
                        document.getElementById('hex_1').value = '';
                    handleCategoryChange(categoryId);
                } else {
                    this.value = oldCategoryId;
                    }
                } else {
                    handleCategoryChange(categoryId);
                }
            });
        }

        // Thay đổi thuộc tính
        Array.from(document.querySelectorAll('.attribute-type')).forEach((select, idx) => {
            // Lưu giá trị ban đầu
            select.setAttribute('data-old-value', select.value);

            select.addEventListener('change', function() {
                const oldValue = this.getAttribute('data-old-value');
                const newValue = this.value;

                // Nếu giá trị không thay đổi hoặc đang xóa giá trị (chọn option rỗng) thì không cần xác nhận
                if (oldValue === newValue || (!oldValue && !newValue)) {
                    this.setAttribute('data-old-value', newValue);
                    return;
                }

                // Hiển thị dialog xác nhận
                if (confirm('Thay đổi thuộc tính sẽ xóa toàn bộ giá trị thuộc tính, mã màu và biến thể. Bạn có chắc chắn?')) {
                    askedAttribute = true;
                    markAllVariantImagesForDelete();
                    markAllAttributesForDelete();
                    // Xóa giá trị, mã màu (reset input)
                    if (document.getElementById(`values_${idx}`)) document.getElementById(`values_${idx}`).value = '';
                    if (document.getElementById(`hex_${idx}`)) document.getElementById(`hex_${idx}`).value = '';
                    this.setAttribute('data-old-value', newValue);
                } else {
                    // Nếu người dùng không đồng ý, khôi phục lại giá trị cũ
                    this.value = oldValue;
                    return;
                }

                validateAttributeType(idx);
            });
        });

        // Thay đổi giá trị hoặc mã màu
        ['values_0','hex_0','values_1','hex_1'].forEach(function(id) {
            const input = document.getElementById(id);
            if (input) {
                let oldVal = input.value;
            input.addEventListener('input', function() {
                    if (this.value !== oldVal) {
                        if (!askedValueOrHex) {
                            if (confirm('Thay đổi giá trị hoặc mã màu sẽ xóa toàn bộ biến thể. Bạn có chắc chắn?')) {
                                askedValueOrHex = true;
                markAllVariantImagesForDelete();
                                oldVal = this.value;
                            } else {
                                this.value = oldVal;
                            }
                        } else {
                            oldVal = this.value;
                        }
                    }
                });
            }
        });

        // Tạo lại biến thể
        const generateVariantsBtn = document.getElementById('generate-variants');
        if (generateVariantsBtn) {
            generateVariantsBtn.addEventListener('click', function() {
                if (validateAllAttributes()) {
                    markAllVariantImagesForDelete();
                    regenerateVariants();
                } else {
                    alert('Please check attribute information.');
                }
            });
        }

        // Khi submit form, truyền danh sách ảnh và biến thể cần xóa lên server
        const productForm = document.getElementById('productForm');
        if (productForm) {
            productForm.addEventListener('submit', function(event) {
                // Xóa các input cũ
                document.querySelectorAll('input[name="variants_to_delete[]"]').forEach(e => e.remove());
                document.querySelectorAll('input[name="images_to_delete[]"]').forEach(e => e.remove());

                // Xử lý variants_to_delete
                if (variantsToDelete && variantsToDelete.size > 0) {
                    Array.from(variantsToDelete).forEach(id => {
                        if (id) { // chỉ thêm nếu có id thực sự
                            const input = document.createElement('input');
                            input.type = 'hidden';
                            input.name = 'variants_to_delete[]';
                            input.value = id;
                            this.appendChild(input);
                        }
                    });
                }

                // Xử lý images_to_delete
                if (imagesToDelete && imagesToDelete.size > 0) {
                    Array.from(imagesToDelete).forEach(path => {
                        if (path) { // chỉ thêm nếu có path thực sự
                            const input = document.createElement('input');
                            input.type = 'hidden';
                            input.name = 'images_to_delete[]';
                            input.value = path;
                            this.appendChild(input);
                        }
                    });
                }
            });
        }

        // Tách logic xử lý thay đổi danh mục thành hàm riêng
        function handleCategoryChange(categoryId) {
            const selects = [document.getElementById('attribute_type_0'), document.getElementById('attribute_type_1')];
            const valueInputs = [document.getElementById('values_0'), document.getElementById('values_1')];
            const hexInputs = [document.getElementById('hex_0'), document.getElementById('hex_1')];

            // Đánh dấu tất cả biến thể và ảnh để xóa
            const variantsContainer = document.getElementById('variantsContainer');
            variantsContainer.querySelectorAll('.variant-row').forEach(row => {
                // Lấy ID của biến thể từ input hidden
                const variantId = row.querySelector('input[name^="variants"][name$="[id]"]')?.value;
                if (variantId) {
                    variantsToDelete.add(variantId);
                }
                
                // Đánh dấu ảnh để xóa
                row.querySelectorAll('.preview-image').forEach(img => {
                    const imagePath = img.src.split('/').pop();
                    if (imagePath) imagesToDelete.add(imagePath);
                });
            });

            // Xóa hết các thuộc tính biến thể cũ khi đổi danh mục
            selects.forEach(s => {
                s.selectedIndex = 0;
                s.setAttribute('data-old-value', '');
            });
            valueInputs.forEach(i => {
                i.value = '';
                i.setAttribute('data-old-value', '');
            });
            hexInputs.forEach(i => {
                i.value = '';
                i.setAttribute('data-old-value', '');
            });
            selectedTypes.clear();
            validateAllAttributes(); // Validate lại sau khi xóa

            // Xóa toàn bộ biến thể hiện tại
            variantsContainer.innerHTML = '';

            if (categoryId) {
                selects.forEach(s => s.disabled = false);
                valueInputs.forEach(i => i.disabled = false);
                hexInputs.forEach(i => i.disabled = false);

                // Fetch Specifications
                fetch(`/admin/categories/${categoryId}/specifications`)
                    .then(response => response.json())
                    .then(data => {
                        const container = document.getElementById('categorySpecifications');
                        container.innerHTML = ''; // Clear previous specs
                        if (data.length > 0) {
                            const wrapper = document.createElement('div');
                            wrapper.id = 'specifications-wrapper';
                            let row = null;
                            data.forEach((spec, idx) => {
                                if (idx % 2 === 0) {
                                    row = document.createElement('div');
                                    row.className = 'row mb-2 spec-row';
                                    // Ẩn bớt nếu nhiều hơn 3 hàng ban đầu
                                    if (idx / 2 >= 3) row.style.display = 'none';
                                    wrapper.appendChild(row);
                                }
                                const col = document.createElement('div');
                                col.className = 'col-md-6';

                                col.innerHTML = `
                                    <div class="mb-3">
                                        <label class="form-label">${spec.name} <span class="text-danger">*</span></label>
                                        <input type="hidden" name="specifications[${idx}][specification_id]" value="${spec.id}">
                                        <input type="text" class="form-control" name="specifications[${idx}][value]" value="" required>
                                    </div>
                                `;
                                if (row) row.appendChild(col);
                            });
                            container.appendChild(wrapper);
                            // Hiển thị nút "Xem thêm" nếu có nhiều hơn 6 thông số
                            if (data.length > 6) {
                                const seeMoreBtn = document.createElement('button');
                                seeMoreBtn.type = 'button';
                                seeMoreBtn.className = 'btn btn-link p-0';
                                seeMoreBtn.textContent = 'Xem thêm';
                                seeMoreBtn.onclick = function() {
                                    document.querySelectorAll('#categorySpecifications .spec-row').forEach((row) => {
                                        row.style.display = '';
                                    });
                                    this.style.display = 'none';
                                };
                                container.appendChild(seeMoreBtn);
                            }
                        } else {
                            container.innerHTML = '<p class="text-muted">No specifications found for this category.</p>';
                        }
                    });

                // Fetch Attributes
                fetch(`/admin/categories/${categoryId}/attributes`)
                    .then(response => response.json())
                    .then(data => {
                        selects.forEach(select => {
                            select.options.length = 1; // Xóa các option cũ trừ option đầu tiên
                            data.forEach(attr => {
                                const opt = document.createElement('option');
                                opt.value = attr.id;
                                opt.textContent = attr.name;
                                select.appendChild(opt);
                            });
                        });

                        selects.forEach((select, idx) => {
                            // Remove previous listeners to prevent duplicates
                            const newSelect = select.cloneNode(true);
                            select.parentNode.replaceChild(newSelect, select);
                            selects[idx] = newSelect;

                            // Thêm data-index để xác định select box
                            newSelect.setAttribute('data-index', idx);

                            // Cập nhật trạng thái disabled của các option
                            const otherSelect = selects[idx === 0 ? 1 : 0];
                            selects.forEach(s => {
                                Array.from(s.options).forEach(opt => {
                                    if (opt.value) opt.disabled = false;
                                });
                            });
                            if (newSelect.value) {
                                Array.from(otherSelect.options).forEach(opt => {
                                    if (opt.value === newSelect.value) opt.disabled = true;
                                });
                            }

                            validateAttributeType(idx);
                        });

                        validateAttributeType(0);
                        validateAttributeType(1);

                        valueInputs.forEach((input, idx) => {
                            const newValueInput = input.cloneNode(true);
                            input.parentNode.replaceChild(newValueInput, input);
                            valueInputs[idx] = newValueInput;

                            // Lưu giá trị cũ
                            newValueInput.setAttribute('data-old-value', newValueInput.value);

                            newValueInput.addEventListener('input', function() {
                                const oldValue = this.getAttribute('data-old-value');
                                const newValue = this.value;

                                // Nếu giá trị không thay đổi thì không cần xử lý
                                if (oldValue === newValue) {
                                    return;
                                }

                                // Tự động đánh dấu xóa biến thể và ảnh
                                markAllVariantImagesForDelete();
                                // Cập nhật giá trị cũ
                                this.setAttribute('data-old-value', newValue);

                                validateAttributeValues(idx);
                            });
                            validateAttributeValues(idx);
                        });

                        hexInputs.forEach((input, idx) => {
                            const newHexInput = input.cloneNode(true);
                            input.parentNode.replaceChild(newHexInput, input);
                            hexInputs[idx] = newHexInput;

                            // Lưu giá trị cũ
                            newHexInput.setAttribute('data-old-value', newHexInput.value);

                            newHexInput.addEventListener('input', function() {
                                const oldValue = this.getAttribute('data-old-value');
                                const newValue = this.value;

                                // Nếu giá trị không thay đổi thì không cần xử lý
                                if (oldValue === newValue) {
                                    return;
                                }

                                // Tự động đánh dấu xóa biến thể và ảnh
                                markAllVariantImagesForDelete();
                                // Cập nhật giá trị cũ
                                this.setAttribute('data-old-value', newValue);

                                validateHexValues(idx);
                            });
                            validateHexValues(idx);
                        });

                        setTimeout(() => {
                            validateAllAttributes();
                        }, 0);
                    });
            } else {
                // Clear specifications section
                const specContainer = document.getElementById('categorySpecifications');
                specContainer.innerHTML = '<p class="text-muted">Select a category to display specifications.</p>';

                selects.forEach(s => {
                    s.disabled = true;
                    s.selectedIndex = 0;
                });
                valueInputs.forEach(i => {
                    i.disabled = true;
                    i.value = '';
                });
                hexInputs.forEach(i => {
                    i.disabled = true;
                    i.value = '';
                });
                validateAllAttributes();
            }
        }

        // Cập nhật hàm validateAttributeType
        function validateAttributeType(index) {
            const select = document.getElementById(`attribute_type_${index}`);
            const error = document.getElementById(`error-type-${index}`);
            if (!select || !error) return; // Added safety check

            const value = select.value;
            // Update selectedTypes set based on current values of *both* selects
            selectedTypes.clear();
            document.querySelectorAll('.attribute-type').forEach(s => {
                if (s.value) selectedTypes.add(s.value);
            });

            if (index === 0) { // Thuộc tính 1 là bắt buộc
                if (value) {
                    error.style.display = 'none';
                } else {
                    error.style.display = 'block';
                }
            } else { // Thuộc tính 2 là tùy chọn, chỉ check khi có giá trị
                error.style.display = 'none'; // Mặc định ẩn lỗi nếu không chọn
            }
            validateAllAttributes();
        }

        // Cập nhật hàm validateAttributeValues
        function validateAttributeValues(index) {
            const input = document.getElementById(`values_${index}`);
            const error = document.getElementById(`error-values-${index}`);
            const typeSelect = document.getElementById(`attribute_type_${index}`);
            if (!input || !error || !typeSelect) return; // Added safety check

            const values = input.value.split(',').map(v => v.trim()).filter(v => v.length > 0);

            if (index === 0) { // Giá trị thuộc tính 1 là bắt buộc nếu chọn loại thuộc tính 1
                if (typeSelect.value && values.length === 0) {
                    error.style.display = 'block';
                } else {
                    error.style.display = 'none';
                }
            } else { // Giá trị thuộc tính 2 là tùy chọn, chỉ check khi có giá trị hoặc khi loại thuộc tính được chọn
                if (typeSelect.value && values.length === 0) {
                    error.style.display = 'block'; // Báo lỗi nếu chọn loại thuộc tính 2 mà không nhập giá trị
                } else {
                    error.style.display = 'none';
                }
            }
            validateAllAttributes();
        }

        // Cập nhật hàm validateHexValues
        function validateHexValues(index) {
            const input = document.getElementById(`hex_${index}`);
            const error = document.getElementById(`error-hex-${index}`);
            if (!input || !error) return; // Added safety check
            // Validation cho hex values thường không bắt buộc unless specified
            error.style.display = 'none'; // Assume hex is optional and doesn't cause validation errors here
            validateAllAttributes(); // Still call to update overall form state if needed
        }

        // Cập nhật hàm validateAllAttributes để xử lý chính xác validation
        function validateAllAttributes() {
            const selects = document.querySelectorAll('.attribute-type');
            const valueInputs = document.querySelectorAll('.attribute-values');
            let valid = false;
            let hasError = false;

            // Reset tất cả error messages
            document.querySelectorAll('.error-message').forEach(error => {
                error.style.display = 'none';
            });

            // Kiểm tra thuộc tính đầu tiên (bắt buộc)
            const firstSelect = selects[0];
            const firstValueInput = valueInputs[0];
            const errorType0 = document.getElementById('error-type-0');
            const errorValue0 = document.getElementById('error-values-0');
            const errorMinAttributes = document.getElementById('error-min-attributes');

            if (!firstSelect || !firstValueInput || !errorType0 || !errorValue0 || !errorMinAttributes) {
                console.error("Required attribute elements not found for validation.");
                return false;
            }

            if (!firstSelect.value) {
                errorType0.style.display = 'block';
                hasError = true;
            }

            const firstValues = firstValueInput.value.split(',').map(v => v.trim()).filter(v => v.length > 0);
            if (firstSelect.value && firstValues.length === 0) {
                errorValue0.style.display = 'block';
                hasError = true;
            } else if (firstSelect.value && firstValues.length > 0) {
                valid = true;
            }

            // Kiểm tra thuộc tính thứ hai (tùy chọn)
            if (selects[1]) {
                const secondSelect = selects[1];
                const secondValueInput = valueInputs[1];
                const errorType1 = document.getElementById('error-type-1');
                const errorValue1 = document.getElementById('error-values-1');
                const errorDuplicate = document.getElementById('error-duplicate');

                if (secondSelect && secondValueInput && errorType1 && errorValue1 && errorDuplicate) {
                    const secondValues = secondValueInput.value.split(',').map(v => v.trim()).filter(v => v.length > 0);

                    if (secondSelect.value && secondValues.length === 0) {
                        errorValue1.style.display = 'block';
                        hasError = true;
                    }

                    if (!secondSelect.value && secondValues.length > 0) {
                        errorType1.style.display = 'block';
                        hasError = true;
                    }

                    if (secondSelect.value && firstSelect.value === secondSelect.value) {
                        errorDuplicate.style.display = 'block';
                        hasError = true;
                    }
                }
            }

            if (!valid) {
                errorMinAttributes.style.display = 'block';
                hasError = true;
            }

            return valid && !hasError;
        }

        function markAllVariantImagesForDelete() {
            const variantsContainer = document.getElementById('variantsContainer');
            variantsContainer.querySelectorAll('.variant-row').forEach(row => {
                // Lấy ID của biến thể từ input hidden
                const variantId = row.querySelector('input[name^="variants"][name$="[id]"]')?.value;
                if (variantId) {
                    variantsToDelete.add(variantId);
                }
                
                // Đánh dấu ảnh để xóa
                row.querySelectorAll('.preview-image').forEach(img => {
                    const imagePath = img.src.split('/').pop();
                    if (imagePath) imagesToDelete.add(imagePath);
                });
            });
            variantsContainer.innerHTML = '';
        }

        function regenerateVariants() {
            const variantsContainer = document.getElementById('variantsContainer');
            const attributeType0 = document.getElementById('attribute_type_0');
            const attributeType1 = document.getElementById('attribute_type_1');
            const values0 = document.getElementById('values_0').value.split(',').map(v => v.trim()).filter(v => v);
            const values1 = document.getElementById('values_1').value.split(',').map(v => v.trim()).filter(v => v);
            const hex0 = document.getElementById('hex_0').value.split(',').map(v => v.trim()).filter(v => v);
            const hex1 = document.getElementById('hex_1').value.split(',').map(v => v.trim()).filter(v => v);

            // Lấy tên sản phẩm hiện tại
            const productName = document.getElementById('name').value.trim();

            // Chỉ tạo biến thể nếu có ít nhất một thuộc tính và giá trị
            if (!attributeType0.value || values0.length === 0 || !productName) {
                return;
            }

            // Tạo các tổ hợp giá trị
            let combinations = [];
            if (attributeType1.value && values1.length > 0) {
                // Tạo tổ hợp cho 2 thuộc tính
                values0.forEach((v0, i0) => {
                    values1.forEach((v1, i1) => {
                        combinations.push({
                            name: `${productName} - ${v0} - ${v1}`,
                            values: [v0, v1],
                            hex: [hex0[i0] || '', hex1[i1] || '']
                        });
                    });
                });
            } else {
                // Tạo tổ hợp cho 1 thuộc tính
                values0.forEach((v0, i0) => {
                    combinations.push({
                        name: `${productName} - ${v0}`,
                        values: [v0],
                        hex: [hex0[i0] || '']
                    });
                });
            }

            // Tạo HTML cho các biến thể
            combinations.forEach((combo, index) => {
                let attributesInputs = '';
                // Thuộc tính 1
                attributesInputs += `<input type="hidden" name="variants[${index}][attributes][0][attribute_type_id]" value="${attributeType0.value}">`;
                attributesInputs += `<input type="hidden" name="variants[${index}][attributes][0][value]" value="${combo.values[0]}">`;
                attributesInputs += `<input type="hidden" name="variants[${index}][attributes][0][hex]" value="${combo.hex[0] || ''}">`;
                // Thuộc tính 2 (nếu có)
                if (attributeType1.value && combo.values.length > 1) {
                    attributesInputs += `<input type="hidden" name="variants[${index}][attributes][1][attribute_type_id]" value="${attributeType1.value}">`;
                    attributesInputs += `<input type="hidden" name="variants[${index}][attributes][1][value]" value="${combo.values[1]}">`;
                    attributesInputs += `<input type="hidden" name="variants[${index}][attributes][1][hex]" value="${combo.hex[1] || ''}">`;
                }
                const variantHtml = `
                    <div class="variant-row" data-index="${index}">
                        <h6>Variant ${index + 1}: ${combo.name}</h6>
                        <input type="hidden" name="variants[${index}][name]" value="${combo.name}">
                        <input type="hidden" name="variants[${index}][slug]" value="${combo.name.toLowerCase().replace(/\s+/g, '-')}">
                        ${attributesInputs}
                        <div class="row">
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Stock</label>
                                    <input type="number" class="form-control" name="variants[${index}][stock]" min="0">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Purchase Price</label>
                                    <input type="number" class="form-control" name="variants[${index}][purchase_price]" min="0" step="0.01">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Selling Price</label>
                                    <input type="number" class="form-control" name="variants[${index}][selling_price]" min="0" step="0.01">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Images</label>
                                    <input type="file" class="form-control variant-images" name="variants[${index}][images][]" multiple accept="image/*">
                                    <div id="preview-${index}" class="preview-images-container mt-2 d-flex flex-wrap gap-2"></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Default Variant</label>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input default-variant-toggle" type="checkbox" name="variants[${index}][is_default]" id="is_default_${index}" value="1" ${index === 0 ? 'checked' : ''}>
                                        <label class="form-check-label" for="is_default_${index}">Set as Default</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                variantsContainer.insertAdjacentHTML('beforeend', variantHtml);
            });

            // Thêm sự kiện cho các input mới
            setupVariantEvents();
        }

        function setupVariantEvents() {
            // Sự kiện cho default variant toggle
            document.querySelectorAll('.default-variant-toggle').forEach(toggle => {
                toggle.addEventListener('change', function() {
                    if (this.checked) {
                        document.querySelectorAll('.default-variant-toggle').forEach(t => {
                            if (t !== this) t.checked = false;
                        });
                    }
                });
            });

            // Sự kiện cho variant images
            document.querySelectorAll('.variant-images').forEach(input => {
                input.addEventListener('change', function() {
                    const previewContainer = document.getElementById(`preview-${this.closest('.variant-row').dataset.index}`);
                    previewContainer.innerHTML = '';
                    
                    Array.from(this.files).forEach(file => {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            const img = document.createElement('img');
                            img.src = e.target.result;
                            img.className = 'preview-image';
                            previewContainer.appendChild(img);
                        };
                        reader.readAsDataURL(file);
                    });
                });
            });
        }

        function markAllAttributesForDelete() {
            // Lấy toàn bộ attribute_value_id từ các input hidden trong các variant-row
            const form = document.getElementById('productForm');
            // Xóa các input cũ để tránh trùng lặp
            document.querySelectorAll('input[name="attributes_to_delete[]"]').forEach(e => e.remove());
            document.querySelectorAll('.variant-row').forEach(row => {
                row.querySelectorAll('input[name*="[attributes]"][name$="[attribute_type_id]"]').forEach(input => {
                    const attrId = input.value;
                    if (attrId) {
                        // Thêm input ẩn vào form nếu chưa có
                        if (!form.querySelector(`input[name="attributes_to_delete[]"][value="${attrId}"]`)) {
                            const hidden = document.createElement('input');
                            hidden.type = 'hidden';
                            hidden.name = 'attributes_to_delete[]';
                            hidden.value = attrId;
                            form.appendChild(hidden);
                        }
                    }
                });
            });
        }
    </script>
@endsection
