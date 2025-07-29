@extends('client.layouts.app')
@section('title', 'Thanh toán - Apple Store')

@section('content')
    <style>
.checkout-wrapper {
    padding: 120px 0 60px; /* Tăng padding-top để tránh bị header che */
    background-color: #f8f9fa;
    min-height: 100vh;
}

.checkout-title {
    font-size: 2.2rem;
    font-weight: 600;
    color: #1a1a1a;
}

.checkout-header {
    text-align: center;
    margin-bottom: 40px;
}

.checkout-header h1 {
    font-size: 2rem;
    font-weight: 700;
    color: #1a1a1a;
    margin-bottom: 20px;
}

/* Checkout Steps */
.checkout-steps {
            display: flex;
    align-items: center;
    justify-content: center;
    margin: 30px 0;
}

.step {
            display: flex;
    flex-direction: column;
            align-items: center;
            position: relative;
        }

.step-number {
    width: 35px;
    height: 35px;
    border-radius: 50%;
    background: #e2e8f0;
    color: #64748b;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    margin-bottom: 8px;
}

.step.active .step-number {
    background: #3b82f6;
    color: white;
}

.step-text {
    font-size: 0.9rem;
    color: #64748b;
    font-weight: 500;
}

.step.active .step-text {
    color: #3b82f6;
}

.step-line {
    width: 100px;
    height: 2px;
    background: #e2e8f0;
    margin: 0 15px;
}

.step-line.active {
    background: #3b82f6;
}

/* Alert Styles */
.alert-container {
    margin-bottom: 30px;
}

        .custom-alert {
            display: flex;
            align-items: center;
    padding: 15px;
    border-radius: 10px;
    background: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin-bottom: 10px;
}

.custom-alert.error {
    border-left: 4px solid #ef4444;
        }

        .custom-alert .icon {
    color: #ef4444;
            font-size: 20px;
    margin-right: 15px;
        }

        .custom-alert .content {
    flex: 1;
    color: #1f2937;
}

.custom-alert .close {
    background: none;
    border: none;
    color: #9ca3af;
    cursor: pointer;
    padding: 0;
    font-size: 18px;
}

/* Checkout Sections */
.checkout-section {
    background: white;
    border-radius: 15px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 25px;
    margin-bottom: 25px;
}

.section-header {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.section-icon {
    width: 40px;
    height: 40px;
    border-radius: 10px;
    background: #3b82f6;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    margin-right: 15px;
}

.section-header h2 {
    font-size: 1.25rem;
    font-weight: 600;
    color: #1f2937;
    margin: 0;
}

/* Form Styles */
.form-floating > .form-control {
    padding: 1rem 0.75rem;
}

.form-floating > .form-control:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.1);
}

.form-floating > label {
    padding: 1rem 0.75rem;
}

/* Custom Checkbox */
.custom-checkbox-container {
    display: flex;
    align-items: center;
    cursor: pointer;
    user-select: none;
    padding: 10px 0;
}

.custom-checkbox-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
}

.checkmark {
    position: relative;
    height: 24px;
    width: 24px;
    background-color: #fff;
    border: 2px solid #e2e8f0;
    border-radius: 6px;
    margin-right: 10px;
}

.custom-checkbox-container:hover .checkmark {
    border-color: #3b82f6;
}

.custom-checkbox-container input:checked ~ .checkmark {
    background-color: #3b82f6;
    border-color: #3b82f6;
}

.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

.custom-checkbox-container input:checked ~ .checkmark:after {
            display: block;
}

.custom-checkbox-container .checkmark:after {
    left: 8px;
    top: 4px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
}

.label-text {
    font-weight: 500;
    color: #1f2937;
}

/* Payment Methods */
.payment-methods {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.payment-method-option {
    cursor: pointer;
            margin: 0;
}

.payment-method-option input[type="radio"] {
    display: none;
}

.payment-method-content {
    display: flex;
    align-items: center;
    padding: 15px;
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    transition: all 0.3s ease;
}

.payment-method-option input[type="radio"]:checked + .payment-method-content {
    border-color: #3b82f6;
    background: #f0f9ff;
}

.payment-method-content img {
    width: 40px;
    height: 40px;
    object-fit: contain;
    margin-right: 15px;
}

.payment-method-info {
    display: flex;
    flex-direction: column;
}

.payment-method-name {
    font-weight: 600;
    color: #1f2937;
}

.payment-method-desc {
    font-size: 0.9rem;
    color: #6b7280;
}

/* Order Summary */
.order-summary-sticky {
    /* Xóa position: sticky và top */
    position: relative;
}

/* Thêm style cho order summary để đảm bảo layout vẫn đẹp */
.order-summary {
    background: white;
    border-radius: 16px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
    height: 100%;
}

.order-items {
    margin-bottom: 20px;
}

.order-item {
    display: flex;
    padding: 15px;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
    margin-bottom: 15px;
    background: #fff;
}

.order-item:last-child {
    margin-bottom: 0;
}

.item-image {
    width: 100px; /* Tăng kích thước ảnh */
    height: 100px;
    border-radius: 10px;
    overflow: hidden;
    margin-right: 15px;
    border: 1px solid #e2e8f0;
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
}

.item-image img {
    width: 100%;
    height: 100%;
    object-fit: contain; /* Đổi thành contain để hiển thị đầy đủ ảnh */
}

.item-info {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.item-info h4 {
    font-size: 1rem;
    font-weight: 600;
    color: #1f2937;
    margin: 0 0 8px 0;
    line-height: 1.4;
}

.item-variants {
    margin-bottom: 5px;
}

.variant-badge {
    display: inline-block;
    padding: 4px 12px;
    background: #f3f4f6;
    border-radius: 20px;
    font-size: 0.85rem;
    color: #4b5563;
    margin-right: 5px;
    margin-bottom: 5px;
}

.item-price {
    margin-top: auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.price {
    font-weight: 600;
    color: #1f2937;
    font-size: 1.1rem;
}

.quantity {
    color: #6b7280;
    font-size: 0.9rem;
    background: #f3f4f6;
    padding: 4px 12px;
    border-radius: 20px;
}

/* Voucher Section */
.voucher-section {
    padding: 20px 0;
    border-top: 1px solid #e5e7eb;
    border-bottom: 1px solid #e5e7eb;
}

.voucher-input {
    display: flex;
    gap: 10px;
}

.voucher-input .form-control {
    border-radius: 8px;
}

.btn-apply {
    padding: 0 20px;
    background: #3b82f6;
    color: white;
    border: none;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-apply:hover {
    background: #2563eb;
}

.voucher-notice {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-top: 10px;
    color: #ef4444;
    font-size: 0.9rem;
}

.voucher-message {
    margin-top: 10px;
    font-size: 0.9rem;
}

/* Order Total */
.order-total {
    padding: 20px 0;
}

.total-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
    color: #4b5563;
}

.total-row.grand-total {
    font-size: 1.2rem;
    font-weight: 700;
    color: #1f2937;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 2px solid #e5e7eb;
}

.discount {
    color: #10b981;
}

/* Place Order Button */
.btn-place-order {
    width: 100%;
    padding: 15px;
    background: #3b82f6;
    color: white;
    border: none;
    border-radius: 10px;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    transition: all 0.3s ease;
    margin-top: 20px;
}

.btn-place-order:hover {
    background: #2563eb;
    transform: translateY(-2px);
}

/* Responsive */
@media (max-width: 991px) {
    .order-summary-sticky {
        margin-top: 2rem;
    }
    
    .step-line {
        width: 60px;
    }
}

@media (max-width: 768px) {
    .checkout-wrapper {
        padding: 20px 0;
    }
    
    .checkout-section {
        padding: 20px;
    }
    
    .step-text {
        font-size: 0.8rem;
    }
    
    .step-line {
        width: 40px;
    }
}

/* Cập nhật style cho checkbox */
.ship-to-different-toggle {
    margin: 2rem 0;
}

.custom-checkbox-container {
    display: flex;
    align-items: center;
    cursor: pointer;
    user-select: none;
    color: #2d3748;
    font-weight: 500;
}

.custom-checkbox-container input {
    position: absolute;
                opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
}

.checkmark {
    position: relative;
    height: 20px;
    width: 20px;
    background-color: #fff;
    border: 2px solid #e2e8f0;
    border-radius: 4px;
    margin-right: 8px;
    transition: all 0.2s ease;
}

.custom-checkbox-container:hover .checkmark {
    border-color: #3b82f6;
}

.custom-checkbox-container input:checked ~ .checkmark {
    background-color: #3b82f6;
    border-color: #3b82f6;
}

.checkmark:after {
    content: "";
    position: absolute;
    display: none;
    left: 6px;
    top: 2px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
}

.custom-checkbox-container input:checked ~ .checkmark:after {
    display: block;
}

/* Style cho textarea ghi chú */
textarea.form-control {
    min-height: 80px;
    resize: vertical;
}

.form-floating > textarea.form-control {
    padding-top: 1.625rem;
        }
    </style>

<div class="checkout-wrapper">
    <div class="container">
        <div class="text-center" style="margin:40px;">
            <h1 class="checkout-title">Thanh toán đơn hàng</h1>
        </div>

                        @if($errors->any())
            <div class="alert-container mb-5">
                            @foreach ($errors->all() as $error)
                                <div class="custom-alert error" id="error-alert">
                        <div class="icon"><i class="fas fa-exclamation-circle"></i></div>
                        <div class="content">{{ $error }}</div>
                        <button class="close" onclick="this.parentElement.style.display='none';">
                            <i class="fas fa-times"></i>
                        </button>
                                </div>
                            @endforeach
            </div>
                        @endif

        <div class="checkout-content">
            <div class="row g-5">
                <div class="col-lg-8">
                    <form id="checkoutForm" action="{{ isset($variant) ? route('checkout.store') : route('cart.checkout.store') }}" method="POST">
                            @csrf
                            @if(isset($variant))
                                <input type="hidden" name="variant_id" value="{{ $variant->id }}">
                                <input type="hidden" name="quantity" value="{{ $quantity ?? 1 }}">
                            @endif
                            @foreach(request('selected_items', []) as $itemId)
                                <input type="hidden" name="selected_items[]" value="{{ $itemId }}">
                            @endforeach
                            <input type="hidden" name="voucher_code" id="voucher_code_input">
                            <input type="hidden" name="voucher_id" id="voucher_id_input">
                            <input type="hidden" name="discount_amount" id="discount_amount_input">

                        <!-- Thông tin người đặt -->
                        <div class="checkout-section mb-4">
                            <div class="section-header mb-4">
                                <div class="section-icon">
                                    <i class="fas fa-user-circle"></i>
                                </div>
                                <h2>Thông tin người đặt</h2>
                            </div>
                            <div class="section-content">
                                <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="c_fname" name="c_fname" required
                                        value="{{ old('c_fname', Auth::check() ? Auth::user()->name : '') }}"
                                        placeholder="Nhập họ và tên">
                                    <label for="c_fname">Họ và tên <span class="text-danger">*</span></label>
                                </div>
                                <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="c_address" name="c_address" required
                                        value="{{ old('c_address', Auth::check() ? Auth::user()->address : '') }}"
                                        placeholder="Nhập địa chỉ">
                                    <label for="c_address">Địa chỉ <span class="text-danger">*</span></label>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="c_email_address" name="c_email_address" required
                                                value="{{ old('c_email_address', Auth::check() ? Auth::user()->email : '') }}"
                                                placeholder="Nhập email">
                                            <label for="c_email_address">Email <span class="text-danger">*</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="c_phone" name="c_phone" required
                                                value="{{ old('c_phone', Auth::check() ? Auth::user()->phone : '') }}"
                                                placeholder="Nhập số điện thoại">
                                            <label for="c_phone">Số điện thoại <span class="text-danger">*</span></label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Giao hàng đến địa chỉ khác -->
                                <div class="ship-to-different-toggle mb-3">
                                    <label class="custom-checkbox-container">
                                        <input type="checkbox" id="ship_to_different" name="ship_to_different" value="1">
                                        <span class="checkmark"></span>
                                        <span class="label-text">Giao hàng đến địa chỉ khác</span>
                                    </label>
                                </div>

                                <!-- Thông tin người nhận -->
                                <div class="recipient-info mb-4" style="display: none;">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="shipping_name" name="shipping_name"
                                            placeholder="Nhập họ và tên người nhận">
                                        <label for="shipping_name">Họ và tên người nhận <span class="text-danger recipient-required" style="display: none;">*</span></label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="shipping_address" name="shipping_address"
                                            placeholder="Nhập địa chỉ giao hàng">
                                        <label for="shipping_address">Địa chỉ giao hàng <span class="text-danger recipient-required" style="display: none;">*</span></label>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3">
                                                <input type="email" class="form-control" id="shipping_email" name="shipping_email"
                                                    placeholder="Nhập email người nhận">
                                                <label for="shipping_email">Email người nhận</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="shipping_phone" name="shipping_phone"
                                                    placeholder="Nhập số điện thoại người nhận">
                                                <label for="shipping_phone">Số điện thoại người nhận <span class="text-danger recipient-required" style="display: none;">*</span></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Ghi chú -->
                                <div class="form-floating mb-4">
                                    <textarea class="form-control" id="c_order_notes" name="c_order_notes" 
                                        style="height: 100px" placeholder="Nhập ghi chú"></textarea>
                                    <label for="c_order_notes">Ghi chú đơn hàng</label>
                                </div>
                            </div>
                        </div>

                        <!-- Phương thức thanh toán -->
                        <div class="checkout-section mb-4">
                            <div class="section-header mb-4">
                                <div class="section-icon">
                                    <i class="fas fa-credit-card"></i>
                                </div>
                                <h2>Phương thức thanh toán</h2>
                            </div>
                            <div class="section-content">
                                    <div class="payment-methods">
                                    <label class="payment-method-option">
                                        <input type="radio" name="payment_method" value="cod" checked>
                                        <span class="payment-method-content">
                                            <img src="{{ asset('/images/logo/cod.png') }}" alt="COD">
                                            <div class="payment-method-info">
                                                <span class="payment-method-name">Thanh toán khi nhận hàng (COD)</span>
                                                <span class="payment-method-desc">Thanh toán bằng tiền mặt khi nhận hàng</span>
                                            </div>
                                        </span>
                                        </label>
                                    <label class="payment-method-option">
                                        <input type="radio" name="payment_method" value="vnpay">
                                        <span class="payment-method-content">
                                            <img src="{{ asset('/images/logo-primary.svg') }}" alt="VNPay">
                                            <div class="payment-method-info">
                                                <span class="payment-method-name">Thanh toán qua VNPay</span>
                                                <span class="payment-method-desc">Thanh toán an toàn với VNPay</span>
                                            </div>
                                        </span>
                                        </label>
                                    </div>
                            </div>
                            </div>
                        </form>
                </div>

                <div class="col-lg-4">
                    <div class="order-summary-sticky">
                        <!-- Thông tin đơn hàng -->
                        <div class="checkout-section">
                            <div class="section-header mb-4">
                                <div class="section-icon">
                                    <i class="fas fa-shopping-cart"></i>
                                </div>
                                <h2>Đơn hàng của bạn</h2>
                            </div>
                            <div class="section-content">
                                <div class="order-items">
                                    @if(isset($variant))
                                        <div class="order-item">
                                            <div class="item-image">
                                                <img src="{{ asset($variant->product->default_variant_image ?? 'images/no-image.png') }}" 
                                                    alt="{{ $variant->product->name }}">
                        </div>
                                            <div class="item-info">
                                                <h4>{{ $variant->product->name }}</h4>
                                                <div class="item-variants">
                                                                @foreach($attributes as $type => $value)
                                                        <span class="variant-badge">{{ $type }}: {{ $value }}</span>
                                                                @endforeach
                                                            </div>
                                                <div class="item-price">
                                                    <span class="price">{{ number_format($variant->selling_price, 0, ',', '.') }} VNĐ</span>
                                                    <span class="quantity">x {{ $quantity }}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                        @else
                                            @foreach($cartItems as $item)
                                            <div class="order-item">
                                                <div class="item-image">
                                                    @if($item->variant && $item->variant->image)
                                                        <img src="{{ asset($item->variant->image) }}" 
                                                            alt="{{ $item->product->name }}">
                                                    @elseif($item->product && $item->product->default_variant_image)
                                                        <img src="{{ asset($item->product->default_variant_image) }}" 
                                                            alt="{{ $item->product->name }}">
                                                    @else
                                                        <img src="{{ asset('images/no-image.png') }}" 
                                                            alt="{{ $item->product->name }}">
                                                    @endif
                                                </div>
                                                <div class="item-info">
                                                    <h4>{{ $item->product->name }}</h4>
                                                                @if($item->variant)
                                                        <div class="item-variants">
                                                                        @foreach($item->variant->combinations as $comb)
                                                                <span class="variant-badge">
                                                                                {{ $comb->attributeValue->attributeType->name }}: 
                                                                                {{ is_array($comb->attributeValue->value) ? $comb->attributeValue->value[0] : $comb->attributeValue->value }}
                                                                            </span>
                                                                        @endforeach
                                                                    </div>
                                                                @endif
                                                    <div class="item-price">
                                                        <span class="price">
                                                            {{ number_format($item->variant ? $item->variant->selling_price : $item->product->selling_price, 0, ',', '.') }} VNĐ
                                                        </span>
                                                        <span class="quantity">x {{ $item->quantity }}</span>
                                                    </div>
                                                            </div>
                                                        </div>
                                            @endforeach
                                    @endif
                                </div>

                                <!-- Mã giảm giá -->
                                <div class="voucher-section my-4">
                                    <div class="voucher-input">
                                        <input type="text" class="form-control" id="c_code" 
                                            placeholder="Nhập mã giảm giá"
                                            {{ isset($hasDiscountedProducts) && $hasDiscountedProducts ? 'disabled' : '' }}>
                                        <button type="button" class="btn-apply" onclick="checkVoucher()">
                                            <i class="fas fa-check"></i>
                                        </button>
                                    </div>
                                    @if(isset($hasDiscountedProducts) && $hasDiscountedProducts)
                                        <div class="voucher-notice">
                                            <i class="fas fa-info-circle"></i>
                                            <span>Không thể áp dụng mã giảm giá cho sản phẩm đang khuyến mãi</span>
                                        </div>
                                        @endif
                                    <div id="voucher-message" class="voucher-message"></div>
                                </div>

                                <!-- Tổng tiền -->
                                <div class="order-total mt-4">
                                    <div class="total-row">
                                        <span>Tạm tính</span>
                                        <span>{{ number_format(isset($variant) ? $variant->selling_price * $quantity : $subtotal, 0, ',', '.') }} VNĐ</span>
                                    </div>
                                    <div class="total-row" id="voucher-discount-row" style="display: none;">
                                        <span>Giảm giá</span>
                                        <span class="discount">-<span id="voucher-discount-amount">0</span> VNĐ</span>
                                    </div>
                                    <div class="total-row grand-total">
                                        <span>Tổng cộng</span>
                                        <span id="final-total">{{ number_format(isset($variant) ? $variant->selling_price * $quantity : $subtotal, 0, ',', '.') }} VNĐ</span>
                                    </div>
                                </div>

                                <button type="submit" class="btn-place-order mt-4" form="checkoutForm">
                                    <i class="fas fa-lock"></i>
                                    <span>Đặt hàng</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const checkoutForm = document.getElementById('checkoutForm');
        const checkoutButton = document.querySelector('.btn-place-order');
        
        checkoutForm.addEventListener('submit', function(e) {
            const paymentMethod = document.querySelector('input[name="payment_method"]:checked')?.value;
            
            // Thêm input ẩn để truyền thông tin voucher và giá đã giảm
            const finalTotalElement = document.getElementById('final-total');
            const finalTotalText = finalTotalElement.innerText;
            const finalTotalValue = parseInt(finalTotalText.replace(/[^\d]/g, '')); // Lấy số tiền cuối cùng
            
            const hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'final_total';
            hiddenInput.value = finalTotalValue;
            checkoutForm.appendChild(hiddenInput);

            if (paymentMethod === 'vnpay') {
                checkoutForm.setAttribute('action', "{{ isset($variant) ? route('vnpay.payment') : route('cart.checkout.vnpay') }}");
            } else {
                checkoutForm.setAttribute('action', "{{ isset($variant) ? route('checkout.store') : route('cart.checkout.store') }}");
            }
        });
    });
    </script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const voucherInput = document.getElementById('c_code');
        const voucherMsg = document.getElementById('voucher-message');
        const voucherDiscountRow = document.getElementById('voucher-discount-row');
        const voucherDiscountAmount = document.getElementById('voucher-discount-amount');
        const finalTotal = document.getElementById('final-total');
        const voucherCodeInput = document.getElementById('voucher_code_input');
        const voucherIdInput = document.getElementById('voucher_id_input');
        const discountAmountInput = document.getElementById('discount_amount_input');
        let debounceTimer;

        // Lấy tạm tính (subtotal) từ view
        let subtotal = {{ (isset($variant) ? $variant->selling_price * ($quantity ?? 1) : (isset($subtotal) ? $subtotal : 0)) }};

        const checkVoucher = () => {
            const code = voucherInput.value.trim();

            // Reset khi không có mã
            if (!code) {
                voucherMsg.style.display = 'none';
                voucherDiscountRow.style.display = 'none';
                finalTotal.innerText = subtotal.toLocaleString('vi-VN') + ' VNĐ';
                voucherCodeInput.value = '';
                voucherIdInput.value = '';
                discountAmountInput.value = '';
                return;
            }

            // Gọi API kiểm tra mã
            fetch('{{ route('voucher.check') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Accept': 'application/json'
                },
                credentials: 'same-origin',
                body: JSON.stringify({
                    voucher_code: code,
                    subtotal: subtotal,
                    email: document.getElementById('c_email_address').value
                })
            })
            .then(res => res.json())
            .then(data => {
                voucherMsg.style.display = 'block';
                if (data.success) {
                    voucherMsg.className = 'alert alert-success mt-2';
                    voucherMsg.innerText = data.message;
                    voucherDiscountRow.style.display = 'table-row';
                    voucherDiscountAmount.innerText = data.voucher.discount_amount.toLocaleString('vi-VN');
                    finalTotal.innerText = data.voucher.final_total.toLocaleString('vi-VN') + ' VNĐ';
                    
                    // Cập nhật các input hidden
                    voucherCodeInput.value = data.voucher.code;
                    voucherIdInput.value = data.voucher.id;
                    discountAmountInput.value = data.voucher.discount_amount;
                } else {
                    voucherMsg.className = 'alert alert-danger mt-2';
                    voucherMsg.innerText = data.message;
                    voucherDiscountRow.style.display = 'none';
                    finalTotal.innerText = subtotal.toLocaleString('vi-VN') + ' VNĐ';
                    
                    // Reset các input hidden
                    voucherCodeInput.value = '';
                    voucherIdInput.value = '';
                    discountAmountInput.value = '';
                }
            })
            .catch((error) => {
                console.error('Error:', error);
                voucherMsg.style.display = 'block';
                voucherMsg.className = 'alert alert-danger mt-2';
                voucherMsg.innerText = 'Có lỗi xảy ra, vui lòng thử lại!';
                
                // Reset các input hidden trong trường hợp lỗi
                voucherCodeInput.value = '';
                voucherIdInput.value = '';
                discountAmountInput.value = '';
            });
        };

        // Tự động kiểm tra khi người dùng nhập
        voucherInput.addEventListener('input', function() {
            clearTimeout(debounceTimer);
            debounceTimer = setTimeout(checkVoucher, 500);
        });
    });
    </script>
    <script>
document.addEventListener('DOMContentLoaded', function() {
    function hideAlert(alertId) {
        const alert = document.getElementById(alertId);
        if (alert) {
            setTimeout(() => {
                alert.style.display = 'none';
            }, 3000);
        }
    }

    // Tự động ẩn tất cả các thông báo lỗi
    document.querySelectorAll('.custom-alert').forEach((alert, index) => {
        alert.id = `error-alert-${index}`;
        hideAlert(`error-alert-${index}`);
    });
});
</script>
@endsection

<script>
document.addEventListener('DOMContentLoaded', function() {
    const shipToDifferentCheckbox = document.getElementById('ship_to_different');
    const recipientInfo = document.querySelector('.recipient-info');
    const recipientInputs = document.querySelectorAll('input[name^="shipping_"]');
    const requiredMarks = document.querySelectorAll('.recipient-required');
    
    function toggleRecipientFields(isChecked) {
        recipientInfo.style.display = isChecked ? 'block' : 'none';
        recipientInputs.forEach(input => {
            if (input.id !== 'shipping_email') { // Email không bắt buộc
                input.required = isChecked;
            }
        });
        requiredMarks.forEach(mark => {
            mark.style.display = isChecked ? 'inline' : 'none';
        });
    }
    
    shipToDifferentCheckbox.addEventListener('change', function() {
        toggleRecipientFields(this.checked);
    });
    
    // Initialize on page load
    toggleRecipientFields(shipToDifferentCheckbox.checked);
});
</script>
