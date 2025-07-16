@extends('client.layouts.app')
@section('title', 'Thanh toán - Apple Store')

@section('content')

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .checkout-container {
            margin-top: 40px;
        }
         @media (max-width: 768px) {
            .checkout-container {
                margin-top: 70px;
            }
        }
        .payment-methods {
            display: flex;
            flex-direction: column;
            gap: 24px;
            margin-bottom: 24px;
        }

        .payment-option {
            display: flex;
            align-items: center;
            background: #fff;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 18px 24px;
            cursor: pointer;
            transition: border-color 0.2s, box-shadow 0.2s;
            position: relative;
        }

        .payment-option:hover, .payment-option input:checked ~ .custom-radio {
            border-color: #007bff;
        }

        .payment-option input[type="radio"] {
            display: none;
        }

        .custom-radio {
            width: 22px;
            height: 22px;
            border: 2px solid #bbb;
            border-radius: 50%;
            margin-right: 18px;
            position: relative;
            background: #fff;
            transition: border-color 0.2s;
        }

        .payment-option input[type="radio"]:checked ~ .custom-radio {
            border-color: #007bff;
            background: #007bff;
        }

        .payment-option input[type="radio"]:checked ~ .custom-radio::after {
            content: '';
            display: block;
            width: 10px;
            height: 10px;
            background: #fff;
            border-radius: 50%;
            position: absolute;
            top: 5px;
            left: 5px;
        }

        .payment-icon {
            width: 48px;
            height: 48px;
            object-fit: contain;
            margin-right: 18px;
        }

        .payment-label {
            font-size: 1.1rem;
            font-weight: 500;
            color: #222;
        }
        .custom-alert {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-left: 5px solid;
            border-radius: 4px;
            padding: 16px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin: 10px auto;
            width: 360px;
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            animation: slideIn 0.3s ease;
        }

        .custom-alert .icon {
            font-size: 20px;
            margin-right: 12px;
        }

        .custom-alert .content {
            flex-grow: 1;
        }

        .custom-alert .content strong {
            display: block;
            font-weight: bold;
            color: #333;
        }

        .custom-alert .content p {
            margin: 0;
            color: #666;
        }

        .custom-alert .close {
            font-size: 38px;
            cursor: pointer;
            color: #333;
            margin-left: 10px;
            margin-top: -32px;
        }

        .custom-alert.error {
            border-color: #dc3545;
            background-color: #ffffff;
        }

        .custom-alert.error .icon {
            color: #dc3545;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-10px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
    <div class="untree_co-section">
        <div class="container checkout-container">
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Thông tin đơn hàng của bạn</h2>
                    <div class="p-3 p-lg-5 border bg-white">
                        @if($errors->any())
                            @foreach ($errors->all() as $error)
                                <div class="custom-alert error" id="error-alert">
                                    <div class="icon"><i class="fas fa-times-circle"></i></div>
                                    <div class="content">
                                        <strong>ERROR</strong>
                                        <p>{{ $error }}</p>
                                    </div>
                                    <div class="close" onclick="this.parentElement.style.display='none';">&times;</div>
                                </div>
                            @endforeach
                        @endif
                        <form action="{{ isset($variant) ? route('checkout.store') : route('cart.checkout.store') }}" method="POST" id="checkoutForm">
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
                            <div id="address-fields">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="c_fname" class="text-black">Họ và tên <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_fname" name="c_fname" required
                                            value="{{ old('c_fname', Auth::check() ? Auth::user()->name : '') }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="c_address" class="text-black">Địa chỉ <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_address" name="c_address" required
                                            value="{{ old('c_address', Auth::check() ? Auth::user()->address : '') }}">
                                    </div>
                                </div>
                                <div class="form-group row mb-5">
                                    <div class="col-md-6">
                                        <label for="c_email_address" class="text-black">Email <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_email_address" name="c_email_address" required
                                            value="{{ old('c_email_address', Auth::check() ? Auth::user()->email : '') }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="c_phone" class="text-black">Số điện thoại <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_phone" name="c_phone" required
                                            value="{{ old('c_phone', Auth::check() ? Auth::user()->phone : '') }}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="c_order_notes" class="text-black">Ghi chú đơn hàng</label>
                                <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control"
                                    placeholder="Write your notes here..."></textarea>
                            </div>

                            <div class="form-group mt-4">
                                <label class="text-black fw-bold mb-2">Phương thức thanh toán <span class="text-danger">*</span></label>
                                    <div class="payment-methods">
                                        <label class="payment-option">
                                        <input type="radio" name="payment_method" id="pm_cod" value="cod" required checked>
                                            <span class="custom-radio"></span>
                                            <img src="{{ asset('/images/logo/cod.png') }}" alt="COD" class="payment-icon">
                                            <span class="payment-label">Thanh toán khi nhận hàng (COD)</span>
                                        </label>
                                        <label class="payment-option">
                                            <input type="radio" name="payment_method" id="pm_vnpay" value="vnpay" required>
                                            <span class="custom-radio"></span>
                                            <img src="{{ asset('/images/logo-primary.svg') }}" alt="VNPay" class="payment-icon">
                                            <span class="payment-label">Thanh toán qua VNPay</span>
                                        </label>
                                    </div>
                            </div>
                            <div class="form-group mt-4">
                                <button class="btn btn-black btn-lg py-3 btn-block w-100" type="submit" id="checkout-button">
                                    Đặt hàng
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Mã giảm giá</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                <label for="c_code" class="text-black mb-3">Nhập mã giảm giá nếu bạn có</label>
                                <div class="input-group w-75 couponcode-wrap">
                                    <input type="text" class="form-control" id="c_code"
                                        placeholder="Mã giảm giá" aria-label="Mã giảm giá"
                                        {{ isset($hasDiscountedProducts) && $hasDiscountedProducts ? 'disabled' : '' }}>
                                </div>
                                @if(isset($hasDiscountedProducts) && $hasDiscountedProducts)
                                    <div class="text-danger mt-2">
                                        <small><i class="fas fa-info-circle"></i> Không thể áp dụng mã giảm giá cho sản phẩm đang khuyến mãi</small>
                                    </div>
                                @endif
                                <div id="voucher-message" style="display: none;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Đơn hàng của bạn</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                        <th>Sản phẩm</th>
                                        <th>Tổng</th>
                                    </thead>
                                    <tbody>
                                        @php
                                            // Helper function to safely handle both JSON strings and arrays
                                            function getImagesArray($images) {
                                                if (is_array($images)) {
                                                    return $images;
                                                }
                                                if (is_string($images)) {
                                                    $decoded = json_decode($images, true);
                                                    return is_array($decoded) ? $decoded : [];
                                                }
                                                return [];
                                            }
                                        @endphp
                                        @if(isset($variant))
                                            <tr>
                                                <td style="vertical-align:middle;">
                                                    <div class="d-flex align-items-center gap-3">
                                                        @php
                                                            $variantImages = getImagesArray($variant->images);
                                                            if (empty($variantImages) || !$variantImages[0]) {
                                                                // Lấy ảnh sản phẩm cha nếu biến thể không có ảnh
                                                                $productImages = getImagesArray($variant->product->images ?? []);
                                                                $variantImage = $productImages[0] ?? 'uploads/default/default.jpg';
                                                            } else {
                                                                $variantImage = $variantImages[0];
                                                            }
                                                        @endphp
                                                        <img src="{{ asset($variantImage) }}" alt="Ảnh sản phẩm" style="width:64px;height:64px;object-fit:cover;border-radius:8px;border:1px solid #eee;">
                                                        <div>
                                                            <div class="fw-bold">{{ $variant->product->name }}</div>
                                                            <div class="small text-muted">Biến thể:
                                                                @foreach($attributes as $type => $value)
                                                                    <span class="badge bg-light text-dark border me-1">{{ $type }}: {{ $value }}</span>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="vertical-align:middle;">
                                                    <span class="fw-bold">{{ number_format($variant->selling_price, 0, ',', '.') }} VNĐ</span><br>
                                                    <span class="text-muted small">x {{ $quantity }}</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Tạm tính</strong></td>
                                                <td class="text-black">{{ number_format($variant->selling_price * $quantity, 0, ',', '.') }} VNĐ</td>
                                            </tr>
                                            <tr id="voucher-discount-row" style="display: none;">
                                                <td class="text-black font-weight-bold"><strong>Giảm giá</strong></td>
                                                <td class="text-black text-success">-<span id="voucher-discount-amount">0</span> VNĐ</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Tổng cộng</strong></td>
                                                <td class="text-black font-weight-bold">
                                                    <strong id="final-total">{{ number_format($variant->selling_price * $quantity, 0, ',', '.') }} VNĐ</strong>
                                                </td>
                                            </tr>
                                        @else
                                            @foreach($cartItems as $item)
                                                <tr>
                                                    <td style="vertical-align:middle;">
                                                        <div class="d-flex align-items-center gap-3">
                                                            @php
                                                                $imageUrl = 'assets/images/default-product.png';
                                                                if (!empty($item->variant) && !empty($item->variant->images)) {
                                                                    $variantImages = getImagesArray($item->variant->images);
                                                                    if (is_array($variantImages) && !empty($variantImages[0])) {
                                                                        $imageUrl = $variantImages[0];
                                                                    }
                                                                } elseif (!empty($item->product) && !empty($item->product->images)) {
                                                                    $productImages = getImagesArray($item->product->images);
                                                                    if (is_array($productImages) && !empty($productImages[0])) {
                                                                        $imageUrl = $productImages[0];
                                                                    }
                                                                }
                                                            @endphp
                                                            <img src="{{ asset($imageUrl) }}" alt="Ảnh sản phẩm" style="width:64px;height:64px;object-fit:cover;border-radius:8px;border:1px solid #eee;">
                                                            <div>
                                                                <div class="fw-bold">{{ $item->product->name }}</div>
                                                                @if($item->variant)
                                                                    <div class="small text-muted">
                                                                        @foreach($item->variant->combinations as $comb)
                                                                            <span class="badge bg-light text-dark border me-1">
                                                                                {{ $comb->attributeValue->attributeType->name }}: 
                                                                                {{ is_array($comb->attributeValue->value) ? $comb->attributeValue->value[0] : $comb->attributeValue->value }}
                                                                            </span>
                                                                        @endforeach
                                                                    </div>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        <span class="fw-bold">{{ number_format($item->variant ? $item->variant->selling_price : $item->product->selling_price, 0, ',', '.') }} VNĐ</span><br>
                                                        <span class="text-muted small">x {{ $item->quantity }}</span>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Tạm tính</strong></td>
                                                <td class="text-black">{{ number_format($subtotal, 0, ',', '.') }} VNĐ</td>
                                            </tr>
                                            <tr id="voucher-discount-row" style="display: none;">
                                                <td class="text-black font-weight-bold"><strong>Giảm giá</strong></td>
                                                <td class="text-black text-success">-<span id="voucher-discount-amount">0</span> VNĐ</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Tổng cộng</strong></td>
                                                <td class="text-black font-weight-bold">
                                                    <strong id="final-total">{{ number_format($subtotal, 0, ',', '.') }} VNĐ</strong>
                                                </td>
                                            </tr>
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- <script>
        localStorage.removeItem('checkout_product');
    </script> --}}
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const checkoutForm = document.getElementById('checkoutForm');
        const checkoutButton = document.getElementById('checkout-button');
        
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
