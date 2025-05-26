@extends('client.layouts.app')

@section('content')
    <!-- Start Product Detail Section -->
    <div class="untree_co-section product-section">
        <div class="container">
            <div class="row">
                <!-- Product Images -->
                <div class="col-lg-6 mb-5">
                    <div class="product-gallery">
                        <div class="main-image mb-4">
                            @php
                                $defaultVariant = $product->defaultVariant;
                                $images = $defaultVariant ? json_decode($defaultVariant->images, true) : [];
                                $mainImage = $images[0] ?? 'uploads/default/default.jpg';
                                // Gom tất cả ảnh của mọi biến thể
                                $allImages = [];
                                foreach ($product->variants as $variant) {
                                    $imgs = json_decode($variant->images, true) ?? [];
                                    foreach ($imgs as $img) {
                                        if (!in_array($img, $allImages)) {
                                            $allImages[] = $img;
                                        }
                                    }
                                }
                                $defaultPrice = $defaultVariant
                                    ? $defaultVariant->selling_price
                                    : $product->variants->min('selling_price');
                            @endphp
                            <img src="{{ asset($mainImage) }}" class="img-fluid" alt="{{ $product->name }}"
                                id="mainProductImage">
                        </div>
                        <div class="thumbnail-images">
                            <div class="row" id="thumbnailsRow">
                                @foreach ($allImages as $image)
                                    <div class="col-3">
                                        <img src="{{ asset($image) }}" class="img-fluid thumbnail" alt="Thumbnail"
                                            onclick="changeMainImage(this.src)">
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Info -->
                <div class="col-lg-6">
                    <div class="product-info">
                        <h1 class="product-title">{{ $product->name }}</h1>

                        <!-- Price Section -->
                        <div class="product-price mb-4">
                            <span class="current-price" id="productPrice">{{ number_format($defaultPrice, 0, ',', '.') }}
                                VNĐ</span>
                        </div>

                        <!-- Category -->
                        <div class="product-category mb-3">
                            <strong>Category:</strong> {{ $product->category ? $product->category->name : 'N/A' }}
                        </div>

                        <!-- Warranty -->
                        <div class="product-warranty mb-3">
                            <strong>Warranty:</strong> {{ $product->warranty_months ?? 'N/A' }} months
                        </div>

                        <!-- Dynamic Attribute Variants (Color, Storage, ...) -->
                        @php
                            // Gom nhóm các thuộc tính theo loại (Color, Storage, ...)
                            $attributeGroups = [];
                            foreach ($product->variants as $variant) {
                                foreach ($variant->combinations as $combination) {
                                    $typeName = $combination->attributeValue->attributeType->name ?? null;
                                    if ($typeName) {
                                        $values = is_array($combination->attributeValue->value)
                                            ? $combination->attributeValue->value
                                            : json_decode($combination->attributeValue->value, true);
                                        $hexes = is_array($combination->attributeValue->hex)
                                            ? $combination->attributeValue->hex
                                            : json_decode($combination->attributeValue->hex, true);
                                        $attributeGroups[$typeName][] = [
                                            'values' => $values,
                                            'hexes' => $hexes,
                                            'variant_id' => $variant->id,
                                            'is_default' => $variant->is_default,
                                        ];
                                    }
                                }
                            }
                        @endphp
                        @foreach ($attributeGroups as $typeName => $group)
                            @php
                                $hasHex = false;
                                foreach ($group as $item) {
                                    if (!empty($item['hexes'][0])) {
                                        $hasHex = true;
                                        break;
                                    }
                                }
                                $defaultItem = collect($group)->first(fn($item) => $item['is_default']) ?? $group[0];
                                $defaultValue = $defaultItem['values'][0] ?? '';
                            @endphp
                            <div class="variant-group mb-4">
                                <label class="form-label">
                                    {{ ucfirst($typeName) }}
                                    @if ($hasHex)
                                        : <span id="selected-{{ $typeName }}-value"
                                            class="ms-2 badge bg-light text-dark border">{{ $defaultValue }}</span>
                                    @endif
                                </label>
                                <div class="variant-options mt-2 d-flex gap-3">
                                    @if ($hasHex)
                                        @foreach ($group as $item)
                                            @php
                                                $value = $item['values'][0] ?? '';
                                                $hex = $item['hexes'][0] ?? null;
                                            @endphp
                                            <div class="color-option {{ $item['is_default'] ? 'active' : '' }}"
                                                title="{{ $value }}" data-color="{{ $value }}"
                                                data-variant-id="{{ $item['variant_id'] }}"
                                                data-attr-type="{{ $typeName }}"
                                                onclick="selectVariant({{ $item['variant_id'] }}, '{{ addslashes($value) }}', '{{ $typeName }}', this)"
                                                style="background-color: {{ $hex ? $hex : '#f8f9fa' }}; border-radius: 50%; width: 40px; height: 40px; border: 2px solid #ddd; box-shadow: 0 2px 8px rgba(0,0,0,0.15); display: inline-block; cursor: pointer;">
                                            </div>
                                        @endforeach
                                    @else
                                        @php
                                            $uniqueValues = [];
                                            $uniqueItems = [];
                                            foreach ($group as $item) {
                                                $value = $item['values'][0] ?? '';
                                                if (!in_array($value, $uniqueValues)) {
                                                    $uniqueValues[] = $value;
                                                    $uniqueItems[] = $item;
                                                }
                                            }
                                        @endphp
                                        @foreach ($uniqueItems as $item)
                                            @php
                                                $value = $item['values'][0] ?? '';
                                                // Kiểm tra active đúng với thuộc tính của biến thể mặc định
                                                $isActive = false;
                                                if ($defaultVariant) {
                                                    foreach ($defaultVariant->combinations as $comb) {
                                                        if (
                                                            ($comb->attributeValue->attributeType->name ?? '') ===
                                                                $typeName &&
                                                            ($comb->attributeValue->value[0] ?? '') === $value
                                                        ) {
                                                            $isActive = true;
                                                            break;
                                                        }
                                                    }
                                                }
                                            @endphp
                                            <button type="button" class="storage-btn {{ $isActive ? 'active' : '' }}"
                                                data-variant-id="{{ $item['variant_id'] }}"
                                                data-attr-type="{{ $typeName }}"
                                                onclick="selectVariant({{ $item['variant_id'] }}, '{{ addslashes($value) }}', '{{ $typeName }}', this)">
                                                {{ $value }}
                                            </button>
                                        @endforeach
                                    @endif
                                </div>
                            </div>
                        @endforeach

                        <!-- Quantity Selector -->
                        <div class="quantity-selector mb-4">
                            <label class="form-label">Quantity:</label>
                            <div class="quantity-control">
                                <button class="quantity-btn minus">-</button>
                                <input type="number" id="quantity" class="form-control" value="1" min="1"
                                    readonly>
                                <button class="quantity-btn plus">+</button>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="product-actions mb-4">
                            <button class="btn btn-primary" id="buyNowBtn">
                                <i class="fas fa-bolt me-2"></i>Buy Now
                            </button>
                            <button class="btn btn-outline-primary" id="addToCartBtn">
                                <i class="fas fa-cart-plus me-2"></i>Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Tabs Section (bên dưới chi tiết sản phẩm) -->
            <div class="container mt-5">
                <div class="d-flex justify-content-center mb-4" style="gap: 18px;">
                    <button class="tab-btn-custom" id="tab-desc-btn" onclick="showTab('desc')">Mô tả</button>
                    <button class="tab-btn-custom" id="tab-spec-btn" onclick="showTab('spec')">Thông số kỹ thuật</button>
                    <button class="tab-btn-custom" id="tab-review-btn" onclick="showTab('review')">Đánh giá sản
                        phẩm</button>
                </div>
                <div id="tab-desc" class="tab-content" style="display: block;">
                    <div class="card">
                        <div class="card-body">
                            {!! $product->content !!}
                        </div>
                    </div>
                </div>
                <div id="tab-spec" class="tab-content" style="display: none;">
                    <div class="card">
                        <div class="card-body p-0">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th colspan="2" class="bg-light fw-bold">Cấu hình & Bộ nhớ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if ($product->specifications && $product->specifications->isNotEmpty())
                                        @foreach ($product->specifications as $spec)
                                            <tr>
                                                <td class="text-secondary" style="width: 220px;">
                                                    {{ $spec->specification->name }}</td>
                                                <td>{{ $spec->value }}</td>
                                            </tr>
                                        @endforeach
                                    @else
                                        <tr>
                                            <td colspan="2">Chưa có thông số kỹ thuật.</td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="tab-review" class="tab-content" style="display: none;">
                    <div class="card">
                        <div class="card-body">
                            <em>Chức năng đánh giá sản phẩm sẽ sớm ra mắt.</em>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Detail Section -->

    <style>
        .color-variants {
            margin-bottom: 2rem;
        }

        .color-options {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .color-variant-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }

        .color-name {
            font-size: 0.9rem;
            color: #666;
        }

        .color-option {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid #ddd;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .color-option:not([data-hex]) {
            border-radius: 4px;
            background-color: #f8f9fa;
            position: relative;
        }

        .color-option:not([data-hex])::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 20px;
            height: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        .color-option.active {
            border-color: #007bff !important;
            box-shadow: 0 0 0 2px #007bff33;
            position: relative;
        }

        .color-option:hover {
            transform: scale(1.08);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.18);
            z-index: 2;
        }

        .storage-btn {
            padding: 8px 16px;
            margin-right: 10px;
            border: 1px solid #ddd;
            background: #fff;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .storage-btn.active {
            background: #fff !important;
            color: #000 !important;
            border: 2px solid #007bff !important;
            box-shadow: 0 0 0 2px #007bff33;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            max-width: 150px;
        }

        .quantity-btn {
            padding: 8px 12px;
            border: 1px solid #ddd;
            background: #fff;
            cursor: pointer;
        }

        .quantity-control input {
            text-align: center;
            border-left: none;
            border-right: none;
            border-radius: 0;
        }

        .spec-item {
            background: #f8f9fa;
            padding: 10px 14px;
            border-radius: 6px;
            margin-bottom: 8px;
            display: flex;
            justify-content: space-between;
        }

        .thumbnail {
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .thumbnail:hover {
            border-color: #000;
        }

        .color-option::after {
            display: none !important;
        }

        .tab-content {
            min-height: 200px;
        }

        .tab-btn-custom {
            border: 2px solid #0d6efd;
            background: #fff;
            color: #0d6efd;
            font-weight: 500;
            border-radius: 24px;
            padding: 12px 40px;
            font-size: 1.1rem;
            transition: all 0.2s;
            outline: none;
            box-shadow: 0 2px 8px rgba(13, 110, 253, 0.08);
            margin-bottom: 0;
        }

        .tab-btn-custom:hover,
        .tab-btn-custom:focus {
            background: #e6f0ff;
            color: #0a58ca;
            border-color: #0a58ca;
            box-shadow: 0 4px 16px rgba(13, 110, 253, 0.12);
        }

        .tab-btn-custom.active {
            background: #0d6efd;
            color: #fff;
            border-color: #0d6efd;
            box-shadow: 0 2px 8px rgba(13, 110, 253, 0.18);
        }

        .table th,
        .table td {
            vertical-align: middle;
        }

        .table th.bg-light {
            background: #f8f9fa !important;
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Quantity controls
            const quantityInput = document.getElementById('quantity');
            const minusBtn = document.querySelector('.quantity-btn.minus');
            const plusBtn = document.querySelector('.quantity-btn.plus');

            minusBtn.addEventListener('click', () => {
                const currentValue = parseInt(quantityInput.value);
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                }
            });

            plusBtn.addEventListener('click', () => {
                const currentValue = parseInt(quantityInput.value);
                quantityInput.value = currentValue + 1;
            });
        });

        // Lưu thông tin variantId -> ảnh, giá
        let variantData = {};
        @foreach ($product->variants as $variant)
            variantData[{{ $variant->id }}] = {
                images: {!! json_encode(json_decode($variant->images, true) ?? []) !!},
                price: {{ $variant->selling_price }}
            };
        @endforeach

        // Mapping: key là chuỗi các value thuộc tính, value là variantId
        let attributeToVariant = {};
        @foreach ($product->variants as $variant)
            @php
                $attrValues = [];
                foreach ($variant->combinations as $comb) {
                    $attrValues[] = $comb->attributeValue->value[0] ?? (is_array($comb->attributeValue->value) ? $comb->attributeValue->value[0] : json_decode($comb->attributeValue->value, true)[0]);
                }
                $key = implode('|', $attrValues);
            @endphp
            attributeToVariant["{{ $key }}"] = {{ $variant->id }};
        @endforeach

        let selectedVariants = {};
        let selectedValues = {};
        let requiredTypes = [];
        document.querySelectorAll('.variant-group').forEach(function(group) {
            const label = group.querySelector('label.form-label');
            if (label) {
                // Lấy tên thuộc tính từ label
                let typeName = label.textContent.split(':')[0].trim();
                requiredTypes.push(typeName);
            }
        });

        function selectVariant(variantId, value, typeName, el) {
            // Remove active class from all swatches of this attribute type
            document.querySelectorAll('.color-option[data-attr-type="' + typeName + '"], .storage-btn[data-attr-type="' +
                typeName + '"]').forEach(opt => opt.classList.remove('active'));
            // Add active to current
            el.classList.add('active');
            // Update label nếu có
            const labelSpan = document.getElementById('selected-' + typeName + '-value');
            if (labelSpan) labelSpan.textContent = value;
            // Lưu lựa chọn
            selectedVariants[typeName] = variantId;
            selectedValues[typeName] = value;

            // Tìm variant id đúng với tất cả thuộc tính đã chọn
            let key = requiredTypes.map(type => selectedValues[type] || '').join('|');
            let matchedVariantId = attributeToVariant[key];

            // Cập nhật ảnh và giá nếu tìm được variant id hợp lệ
            if (matchedVariantId && variantData[matchedVariantId]) {
                if (variantData[matchedVariantId].images.length > 0) {
                    document.getElementById('mainProductImage').src = '{{ asset('') }}' + variantData[matchedVariantId]
                        .images[0];
                    updateThumbnails(variantData[matchedVariantId].images);
                }
                document.getElementById('productPrice').textContent = variantData[matchedVariantId].price.toLocaleString(
                    'vi-VN') + ' VNĐ';
            }
        }

        function getSelectedVariantId() {
            let key = requiredTypes.map(type => selectedValues[type] || '').join('|');
            return attributeToVariant[key] || null;
        }

        document.getElementById('addToCartBtn').addEventListener('click', function(e) {
            const variantId = getSelectedVariantId();
            if (!variantId) {
                alert('Vui lòng chọn đầy đủ thuộc tính sản phẩm trước khi thêm vào giỏ hàng!');
                e.preventDefault();
                return false;
            }
            // Thực hiện logic thêm vào giỏ hàng với variantId
            // ...
        });

        document.getElementById('buyNowBtn').addEventListener('click', function(e) {
            const variantId = getSelectedVariantId();
            if (!variantId) {
                alert('Vui lòng chọn đầy đủ thuộc tính sản phẩm trước khi đặt hàng!');
                e.preventDefault();
                return false;
            }
            // Thực hiện logic đặt hàng với variantId
            // ...
        });

        function changeMainImage(src) {
            document.getElementById('mainProductImage').src = src;
        }

        function updateThumbnails(images) {
            const container = document.getElementById('thumbnailsRow');
            container.innerHTML = '';
            images.forEach(img => {
                const div = document.createElement('div');
                div.className = 'col-3';
                div.innerHTML =
                    `<img src=\"{{ asset('') }}${img}\" class=\"img-fluid thumbnail\" alt=\"Thumbnail\" onclick=\"changeMainImage(this.src)\">`;
                container.appendChild(div);
            });
        }

        // Khi vào trang, hiển thị tất cả ảnh nhỏ
        window.addEventListener('DOMContentLoaded', function() {
            updateThumbnails(@json($allImages));
        });

        function showTab(tab) {
            document.getElementById('tab-desc').style.display = 'none';
            document.getElementById('tab-spec').style.display = 'none';
            document.getElementById('tab-review').style.display = 'none';
            document.getElementById('tab-desc-btn').classList.remove('active');
            document.getElementById('tab-spec-btn').classList.remove('active');
            document.getElementById('tab-review-btn').classList.remove('active');
            document.getElementById('tab-' + tab).style.display = 'block';
            document.getElementById('tab-' + tab + '-btn').classList.add('active');
        }
        // Mặc định tab đầu tiên active
        document.addEventListener('DOMContentLoaded', function() {
            showTab('desc');
        });
    </script>
@endsection
