@extends('client.layouts.app')

@section('content')

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
</head>
    <div class="untree_co-section">
        <div class="container">
            {{-- bật cái này khi checkout chưa dăng nhập (khách vẵng lai) --}}
            {{-- <div class="row mb-5">
                <div class="col-md-12">
                    <div class="border p-4 rounded" role="alert">
                        Returning customer? <a href="#">Click here</a> to login
                    </div>
                </div>
            </div> --}}
            {{--  --}}
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Thông tin đơn hàng của bạn</h2>
                    <div class="p-3 p-lg-5 border bg-white">
                        @if($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <form action="{{ route('vnpay.payment') }}" method="POST" id="checkoutForm">
                            @csrf
                            <input type="hidden" name="variant_id" value="{{ $variant ? $variant->id : '' }}">
                            <input type="hidden" name="quantity" value="{{ $quantity ?? 1 }}">
                            <div class="form-group">
                                <label for="c_country" class="text-black">Quốc gia <span class="text-danger">*</span></label>
                                <select id="c_country" class="form-control">
                                    <option value="1">Chọn quốc gia</option>
                                    <option value="2">Việt Nam</option>
                                    <option value="3">Lào</option>
                                    <option value="4">Campuchia</option>
                                    <option value="5">Thái Lan</option>
                                    <option value="6">Malaysia</option>
                                    <option value="7">Nhật Bản</option>
                                    <option value="8">Hàn Quốc</option>
                                    <option value="9">Trung Quốc</option>
                                </select>
                            </div>
                            <div id="address-fields">
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="c_fname" class="text-black">Tên <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_fname" name="c_fname" required
                                            value="{{ old('c_fname', Auth::check() ? explode(' ', Auth::user()->name)[0] : '') }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="c_lname" class="text-black">Họ <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_lname" name="c_lname" required
                                            value="{{ old('c_lname', Auth::check() ? explode(' ', Auth::user()->name)[1] ?? '' : '') }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="c_address" class="text-black">Địa chỉ <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_address" name="c_address" required
                                            value="{{ old('c_address', Auth::check() ? Auth::user()->address : '') }}">
                                    </div>
                                </div>
                                {{-- <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="c_state_country" class="text-black">Tỉnh / Quốc gia <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_state_country" name="c_state_country">
                                    </div>
                                    <div class="col-md-6">
                                            <label for="c_postal_zip" class="text-black">Mã bưu điện <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_postal_zip" name="c_postal_zip">
                                    </div>
                                </div> --}}
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
                                <div class="d-flex flex-column gap-2">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="payment_method" id="pm_cod" value="cod" checked>
                                        <label class="form-check-label" for="pm_cod">
                                            <i class="fas fa-box-open me-2"></i> Thanh toán khi nhận hàng (COD)
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="payment_method" id="pm_vnpay" value="vnpay">
                                        <label class="form-check-label" for="pm_vnpay">
                                            <i class="fas fa-qrcode me-2"></i> Thanh toán qua VNPay
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="payment_method" id="pm_bank" value="bank_transfer">
                                        <label class="form-check-label" for="pm_bank">
                                            <i class="fas fa-university me-2"></i> Chuyển khoản ngân hàng
                                        </label>
                                    </div>
                                </div>
                            </div>

                            @if(Auth::check())
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="use_new_address">
                                    <label class="form-check-label" for="use_new_address">
                                        Sử dụng địa chỉ giao hàng khác
                                    </label>
                                </div>
                            @endif

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
                                    <input type="text" class="form-control me-2" id="c_code"
                                        placeholder="Mã giảm giá" aria-label="Mã giảm giá"
                                        aria-describedby="button-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-black btn-sm" type="button"
                                            id="button-addon2">Áp dụng</button>
                                    </div>
                                </div>
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
                                        @if($variant)
                                            <tr>
                                                <td style="vertical-align:middle;">
                                                    <div class="d-flex align-items-center gap-3">
                                                        @php
                                                            $variantImages = json_decode($variant->images, true);
                                                            if (empty($variantImages) || !$variantImages[0]) {
                                                                // Lấy ảnh sản phẩm cha nếu biến thể không có ảnh
                                                                $productImages = json_decode($variant->product->images ?? '[]', true);
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
                                                <td class="text-black font-weight-bold"><strong>Tổng tiền</strong></td>
                                                <td class="text-black">{{ number_format($variant->selling_price * $quantity, 0, ',', '.') }} VNĐ</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Tổng đơn hàng</strong></td>
                                                <td class="text-black font-weight-bold"><strong>{{ number_format($variant->selling_price * $quantity, 0, ',', '.') }} VNĐ</strong></td>
                                            </tr>
                                        @else
                                            <tr><td colspan="2">Không có sản phẩm nào trong đơn hàng.</td></tr>
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
    <script>
        localStorage.removeItem('checkout_product');
    </script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const checkoutForm = document.getElementById('checkoutForm');
        const checkoutButton = document.getElementById('checkout-button');
        const originalAction = checkoutForm.action; // Lưu action mặc định (VNPay)

        checkoutForm.addEventListener('submit', function(e) {
            const paymentMethod = document.querySelector('input[name="payment_method"]:checked').value;
            if (paymentMethod === 'vnpay') {
                checkoutForm.action = originalAction; // Gửi về VNPay
                checkoutButton.disabled = true;
                checkoutButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
            } else {
                // Gửi về route checkout.store (COD, bank_transfer)
                checkoutForm.action = "{{ route('checkout.store') }}";
            }
        });
    });
    </script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const checkbox = document.getElementById('use_new_address');
        const addressFields = document.getElementById('address-fields');
        if (checkbox) {
            checkbox.addEventListener('change', function() {
                if (checkbox.checked) {
                    // Xóa giá trị các trường để nhập mới
                    addressFields.querySelectorAll('input').forEach(el => el.value = '');
                } else {
                    // Gán lại giá trị user
                    @if(Auth::check())
                        addressFields.querySelector('input[name="c_fname"]').value = "{{ explode(' ', Auth::user()->name)[0] }}";
                        addressFields.querySelector('input[name="c_lname"]').value = "{{ explode(' ', Auth::user()->name)[1] ?? '' }}";
                        addressFields.querySelector('input[name="c_address"]').value = "{{ Auth::user()->address }}";
                        addressFields.querySelector('input[name="c_email_address"]').value = "{{ Auth::user()->email }}";
                        addressFields.querySelector('input[name="c_phone"]').value = "{{ Auth::user()->phone }}";
                    @endif
                }
            });
        }
    });
    </script>
@endsection
