@extends('client.layouts.app')
@section('title', 'Cửa hàng - Apple Store')

@section('content')

    <div class="untree_co-section before-footer-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="site-blocks-table">
                        <br>

                        <!-- Hiển thị thông báo -->
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert" id="alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        @if (session('error'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="alert-error">
                                {{ session('error') }}
                            </div>
                        @endif

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Chọn</th>
                                    <th class="product-thumbnail">Hình Ảnh</th>
                                    <th class="product-name">Sản Phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số Lượng</th>
                                    <th class="product-total">Tổng</th>
                                    <th class="product-remove">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if ($cartItems->count() > 0)
                                    @php
                                        if (!function_exists('getImagesArray')) {
                                            function getImagesArray($images)
                                            {
                                                if (is_array($images)) {
                                                    return $images;
                                                }
                                                if (is_string($images)) {
                                                    $decoded = json_decode($images, true);
                                                    return is_array($decoded) ? $decoded : [];
                                                }
                                                return [];
                                            }
                                        }
                                    @endphp

                                    @foreach ($cartItems as $item)
                                        <tr>
                                            <td>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input"
                                                        id="customEnvelop{{ $item->id }}" name="selected_items[]"
                                                        value="{{ $item->id }}"
                                                        {{ $item->is_invalid ? 'disabled' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="customEnvelop{{ $item->id }}"></label>
                                                </div>
                                            </td>
                                            <td class="product-thumbnail">
                                                @php
                                                    $imageUrl = 'assets/images/default-product.png';
                                                    if (!empty($item->variant) && !empty($item->variant->images)) {
                                                        $variantImages = getImagesArray($item->variant->images);
                                                        if (is_array($variantImages) && !empty($variantImages[0])) {
                                                            $imageUrl = $variantImages[0];
                                                        }
                                                    } elseif (
                                                        !empty($item->product) &&
                                                        !empty($item->product->images)
                                                    ) {
                                                        $productImages = getImagesArray($item->product->images);
                                                        if (is_array($productImages) && !empty($productImages[0])) {
                                                            $imageUrl = $productImages[0];
                                                        }
                                                    }
                                                @endphp
                                                <img src="{{ asset($imageUrl) }}" alt="Ảnh sản phẩm"
                                                    style="max-width:80px; height:80px; object-fit:cover;">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black">
                                                    {{ $item->variant ? '(' . $item->variant->name . ')' : '' }}
                                                </h2>
                                                @if ($item->is_invalid)
                                                    <div class="text-danger small">Biến thể này đã ngừng kinh doanh</div>
                                                @endif
                                            </td>
                                            <td class="product-price">
                                                <span style="font-weight: bold" class="price"
                                                    data-price="{{ $item->variant->selling_price ?? $item->product->selling_price }}">
                                                    {{ number_format($item->variant->selling_price ?? $item->product->selling_price, 0, ',', '.') }}
                                                    VNĐ
                                                </span>
                                            </td>
                                            <td>
                                                <div class="quantity-control">
                                                    <button type="button" class="btn btn-outline-black decrease"
                                                        data-item-id="{{ $item->id }}"
                                                        onclick="changeQuantity({{ $item->id }}, 'decrease')"
                                                        {{ $item->is_invalid ? 'disabled' : '' }}>−</button>
                                                    <input type="text" class="form-control text-center quantity-amount"
                                                        name="quantity[{{ $item->id }}]" value="{{ $item->quantity }}"
                                                        id="quantity-{{ $item->id }}"
                                                        data-item-id="{{ $item->id }}" aria-label="Quantity"
                                                        onchange="updateItemTotal({{ $item->id }})"
                                                        {{ $item->is_invalid ? 'readonly' : '' }}>
                                                    <button type="button" class="btn btn-outline-black increase"
                                                        data-item-id="{{ $item->id }}"
                                                        onclick="changeQuantity({{ $item->id }}, 'increase')"
                                                        {{ $item->is_invalid ? 'disabled' : '' }}>+</button>
                                                </div>
                                            </td>
                                            <td class="product-total">
                                                <span class="item-total" id="total-{{ $item->id }}">
                                                    {{ number_format(($item->variant->selling_price ?? $item->product->selling_price) * $item->quantity, 0, ',', '.') }}
                                                    VNĐ
                                                </span>
                                            </td>
                                            <td>
                                                <form action="{{ route('cart.remove', $item->id) }}" method="POST"
                                                    class="form-delete">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-black btn-sm">X</button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="7" class="text-center">Giỏ hàng của bạn đang trống!</td>
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>

                    @if ($cartItems->count() > 0)
                        <div class="row">
                            <div class="col-md-6 offset-md-6">
                                @php
                                    $subtotal = 0;
                                    foreach ($cartItems as $item) {
                                        $subtotal +=
                                            ($item->variant->selling_price ?? $item->product->selling_price) * $item->quantity;
                                    }
                                @endphp
                            </div>
                        </div>
                    @endif

                    @if ($cartItems->count() > 0)
                        <div class="cart-summary-sticky-bottom">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-md-9 d-flex align-items-center justify-content-between gap-3">
                                    <div style="margin-left: 20px" class="custom-control custom-checkbox d-inline-block">
                                        <input type="checkbox" class="custom-control-input" id="selectAll">
                                        <label class="custom-control-label" for="selectAll">Chọn tất cả</label>
                                    </div>
                                    <div class="cart-total">
                                        <strong>Tổng giỏ hàng:</strong>
                                        <span id="cart-total">{{ number_format($subtotal, 0, ',', '.') }} VNĐ</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-md-right mt-3 mt-md-0">
                                    <form action="{{ route('cart.checkout') }}" method="GET" id="checkout-form">
                                        <button type="submit" class="btn btn-checkout">Tiến hành thanh toán</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>

            @if ($cartItems->count() > 0)
                @php
                    $subtotal = 0;
                    $hasInvalidItems = false;
                    foreach ($cartItems as $item) {
                        $subtotal += ($item->variant->selling_price ?? $item->product->selling_price) * $item->quantity;
                        if ($item->is_invalid) {
                            $hasInvalidItems = true;
                        }
                    }
                @endphp

                @if ($hasInvalidItems)
                    <div class="alert alert-danger mt-3">
                        Giỏ hàng của bạn có sản phẩm không còn kinh doanh. Vui lòng xóa hoặc cập nhật giỏ hàng trước khi
                        thanh toán.
                    </div>
                @endif

            @endif
        </div>
    </div>

    <script>
        // Tự ẩn sau 3 giây
        setTimeout(function() {
            const successAlert = document.getElementById('alert-success');
            const errorAlert = document.getElementById('alert-error');

            if (successAlert) {
                successAlert.style.transition = 'opacity 0.5s ease';
                successAlert.style.opacity = '0';
                setTimeout(() => successAlert.remove(), 500); // Xoá sau khi mờ
            }

            if (errorAlert) {
                errorAlert.style.transition = 'opacity 0.5s ease';
                errorAlert.style.opacity = '0';
                setTimeout(() => errorAlert.remove(), 500);
            }
        }, 3000); // 3 giây
        function changeQuantity(itemId, type) {
            let input = document.getElementById('quantity-' + itemId);
            let currentQuantity = parseInt(input.value) || 0;
            let newQuantity = currentQuantity;

            // Tính toán số lượng mới
            if (type === 'increase') {
                newQuantity = currentQuantity + 1;
            } else if (type === 'decrease' && currentQuantity > 1) {
                newQuantity = currentQuantity - 1;
            }

            // Cập nhật giao diện ngay lập tức
            input.value = newQuantity;
            updateItemTotal(itemId);

            // Gửi yêu cầu AJAX tới server (không chờ phản hồi để cập nhật UI)
            updateQuantityOnServer(itemId, newQuantity, currentQuantity);
        }

        function updateQuantityOnServer(itemId, newQuantity, oldQuantity) {
            fetch('/cart/update-quantity', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: JSON.stringify({
                        item_id: itemId,
                        quantity: newQuantity
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (!data.success) {
                        // Nếu server trả về lỗi, khôi phục số lượng cũ
                        let input = document.getElementById('quantity-' + itemId);
                        input.value = oldQuantity;
                        updateItemTotal(itemId);
                        alert('Có lỗi xảy ra: ' + (data.message || 'Không thể cập nhật số lượng.'));
                    }
                })
                .catch(error => {
                    // Xử lý lỗi mạng hoặc server
                    console.error('Error:', error);
                    let input = document.getElementById('quantity-' + itemId);
                    input.value = oldQuantity;
                    updateItemTotal(itemId);
                    alert('Có lỗi xảy ra khi cập nhật số lượng.');
                });
        }

        function updateItemTotal(itemId) {
            let quantityInput = document.getElementById('quantity-' + itemId);
            let quantity = parseInt(quantityInput.value) || 0;
            let row = quantityInput.closest('tr');
            let priceElement = row.querySelector('.price');
            let price = parseFloat(priceElement.getAttribute('data-price')) || 0;
            let itemTotal = price * quantity;
            let totalElement = document.getElementById('total-' + itemId);
            totalElement.textContent = formatCurrency(itemTotal) + ' VNĐ';
            updateCartTotal();
        }

        function updateCartTotal() {
            let cartSubtotal = 0;
            document.querySelectorAll('input[name="selected_items[]"]:checked').forEach(function(checkbox) {
                let itemId = checkbox.value;
                let quantityInput = document.getElementById('quantity-' + itemId);
                let quantity = parseInt(quantityInput.value) || 0;
                let row = checkbox.closest('tr');
                let priceElement = row.querySelector('.price');
                let price = parseFloat(priceElement.getAttribute('data-price')) || 0;
                cartSubtotal += (price * quantity);
            });
            document.getElementById('cart-total').textContent = formatCurrency(cartSubtotal) + ' VNĐ';
        }

        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN').format(amount);
        }

        // Xử lý khi người dùng thay đổi số lượng trực tiếp trong input
        document.querySelectorAll('.quantity-amount').forEach(function(input) {
            input.addEventListener('change', function() {
                let itemId = this.getAttribute('data-item-id');
                let newQuantity = parseInt(this.value) || 1;
                let oldQuantity = parseInt(this.getAttribute('data-old-quantity')) || 1;
                this.setAttribute('data-old-quantity', newQuantity);

                // Cập nhật UI ngay lập tức
                updateItemTotal(itemId);

                // Gửi yêu cầu AJAX
                updateQuantityOnServer(itemId, newQuantity, oldQuantity);
            });
        });
        document.getElementById('selectAll').addEventListener('change', function() {
            let isChecked = this.checked;
            let itemCheckboxes = document.querySelectorAll('input[name="selected_items[]"]');
            itemCheckboxes.forEach(function(checkbox) {
                checkbox.checked = isChecked;
            });
            updateCartTotal();
        });

        // Thêm hàm để lấy danh sách sản phẩm được chọn
        function getSelectedItems() {
            let selectedItems = [];
            document.querySelectorAll('input[name="selected_items[]"]:checked').forEach(function(checkbox) {
                selectedItems.push(checkbox.value);
            });
            return selectedItems;
        }

        // Cập nhật form checkout để chỉ gửi các sản phẩm được chọn
        document.getElementById('checkout-form').addEventListener('submit', function(e) {
            e.preventDefault();
            let selectedItems = getSelectedItems();
            if (selectedItems.length === 0) {
                alert('Vui lòng chọn ít nhất một sản phẩm để thanh toán!');
                return;
            }
            
            // Thêm các sản phẩm được chọn vào form
            selectedItems.forEach(function(itemId) {
                let input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'selected_items[]';
                input.value = itemId;
                this.appendChild(input);
            }, this);
            
            this.submit();
        });

        // Thêm sự kiện change cho từng checkbox
        document.querySelectorAll('input[name="selected_items[]"]').forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                updateCartTotal();
            });
        });
    </script>
    <style>
        .alert {
            position: relative;
            padding: 0.75rem 1.25rem;
            margin-bottom: 1rem;
            border: 1px solid transparent;
            border-radius: 0.375rem;
            z-index: 1050;
        }

        .alert-success {
            color: #0f5132;
            background-color: #d1e7dd;
            border-color: #badbcc;
        }

        .alert-danger {
            color: #842029;
            background-color: #f8d7da;
            border-color: #f5c2c7;
        }

        .cart-summary-sticky {
            position: sticky;
            top: 80px;
            /* hoặc 20px, tuỳ header của bạn */
            right: 0;
            z-index: 100;
            background: #fff;
            border: 1px solid #eee;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 24px 16px;
            min-width: 320px;
            max-width: 100%;
        }

        @media (max-width: 991px) {
            .cart-summary-sticky {
                position: fixed;
                bottom: 0;
                left: 0;
                right: 0;
                top: auto;
                border-radius: 0;
                box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.08);
                min-width: unset;
                padding: 16px 8px;
            }
        }

        .cart-summary-fixed {
            position: fixed;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 999;
            background: #fff;
            border-top: 1px solid #eee;
            box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.08);
            padding: 12px 0;
        }

        @media (max-width: 767px) {
            .cart-summary-fixed .btn {
                width: 100%;
                margin-top: 8px;
            }

            .cart-summary-fixed .row {
                flex-direction: column;
                text-align: center;
            }
        }

        /* .cart-summary-sticky-bottom {
            position: sticky;
            bottom: 0;
            z-index: 10;
            background: #fff;
            border-top: 1px solid #eee;
            box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.08);
            padding: 12px 0;
        } */

        .cart-summary-sticky-bottom {
            position: sticky;
            bottom: 0;
            padding: 16px 24px;
            z-index: 999;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            font-size: 15px;
        }

        .cart-total {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-right: 51px
        }

        .cart-total strong {
            font-weight: 500;
            color: #333;
        }

        #cart-total {
            color: #ee4d2d;
            font-weight: bold;
            font-size: 17px;
        }

        .custom-control-label {
            color: #444;
            font-weight: 500;
            padding-left: 6px;
        }

        .btn-checkout {
            background-color: #2f2f2f;
            color: white;
            border: none;
            padding: 13px 20px;
            border-radius: 22px;
            font-weight: 600;
            font-size: 15px;
            transition: background 0.3s ease;
        }

        .btn-checkout:hover {
            background-color: #222222;
        }

        @media (max-width: 768px) {
            .cart-summary-sticky-bottom {
                padding: 12px 16px;
            }

            .btn-checkout {
                width: 100%;
            }

            .row.align-items-center {
                flex-direction: column;
                gap: 12px;
            }

            .cart-total {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
@endsection
