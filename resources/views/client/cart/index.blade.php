@extends('client.layouts.app')

@section('content')
    <div class="untree_co-section before-footer-section">
        <div class="container">

            <div class="row mb-5">
                <!-- Hiển thị thông báo -->
                @if (session('success'))
                    <div class="alert alert-success">
                        {{ session('success') }}
                    </div>
                @endif

                @if (session('error'))
                    <div class="alert alert-danger">
                        {{ session('error') }}
                    </div>
                @endif
                <div class="col-md-12">
                    <div class="site-blocks-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Select</th>
                                    <th class="product-thumbnail">Image</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-total">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if ($cartItems->count() > 0)
                                    @php
                                        function getFirstImage($image)
                                        {
                                            if (is_array($image) && !empty($image)) {
                                                return $image[0];
                                            } elseif (is_string($image)) {
                                                $decoded = json_decode($image, true);
                                                if (is_array($decoded) && !empty($decoded)) {
                                                    return $decoded[0];
                                                } else {
                                                    return $image;
                                                }
                                            }
                                            return '';
                                        }
                                    @endphp

                                    @foreach ($cartItems as $item)
                                        <tr>
                                            <td>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input"
                                                        id="customEnvelop{{ $item->id }}" name="selected_items[]"
                                                        value="{{ $item->id }}">
                                                    <label class="custom-control-label"
                                                        for="customEnvelop{{ $item->id }}"></label>
                                                </div>
                                            </td>
                                            <td class="product-thumbnail">
                                                @php
                                                    $imageUrl = '';
                                                    if ($item->variant && $item->variant->image) {
                                                        $imageUrl = getFirstImage($item->variant->image);
                                                    }
                                                    if (empty($imageUrl) && $item->product->image) {
                                                        $imageUrl = getFirstImage($item->product->image);
                                                    }
                                                @endphp
                                                <img src="{{ $imageUrl ? asset($imageUrl) : asset('images/default-product.png') }}"
                                                    alt="{{ $item->product->name }}" class="img-fluid"
                                                    style="max-width: 80px; height: 80px; object-fit: cover;">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black">{{-- {{ $item->product->name }} --}}
                                                    {{ $item->variant ? '(' . $item->variant->name . ')' : '' }}</h2>
                                            </td>
                                            <td class="product-price">
                                                <span class="price"
                                                    data-price="{{ $item->variant->selling_price ?? $item->product->selling_price }}">
                                                    {{ number_format($item->variant->selling_price ?? $item->product->selling_price, 0, ',', '.') }}
                                                    VNĐ
                                                </span>
                                            </td>
                                            <td>
                                                <div class="quantity-control">
                                                    <button type="button" class="btn btn-outline-black decrease"
                                                        data-item-id="{{ $item->id }}"
                                                        onclick="changeQuantity({{ $item->id }}, 'decrease')">−</button>
                                                    <input type="text" class="form-control text-center quantity-amount"
                                                        name="quantity[{{ $item->id }}]" value="{{ $item->quantity }}"
                                                        id="quantity-{{ $item->id }}"
                                                        data-item-id="{{ $item->id }}" aria-label="Quantity"
                                                        onchange="updateItemTotal({{ $item->id }})">
                                                    <button type="button" class="btn btn-outline-black increase"
                                                        data-item-id="{{ $item->id }}"
                                                        onclick="changeQuantity({{ $item->id }}, 'increase')">+</button>
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
                </div>
            </div>

            @if ($cartItems->count() > 0)
                <div class="row">
                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-12 text-right border-bottom mb-5">
                                <h3 class="text-black h4 text-uppercase">Tổng giỏ hàng</h3>
                            </div>
                        </div>
                        @php
                            $subtotal = 0;
                            foreach ($cartItems as $item) {
                                $subtotal +=
                                    ($item->variant->selling_price ?? $item->product->selling_price) * $item->quantity;
                            }
                        @endphp
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <span class="text-black">Tổng phụ</span>
                            </div>
                            <div class="col-md-6 text-right">
                                <strong class="text-black" id="cart-subtotal">{{ number_format($subtotal, 0, ',', '.') }}
                                    VNĐ</strong>
                            </div>
                        </div>
                        <div class="row mb-5">
                            <div class="col-md-6">
                                <span class="text-black">Tổng cộng</span>
                            </div>
                            <div class="col-md-6 text-right">
                                <strong class="text-black" id="cart-total">{{ number_format($subtotal, 0, ',', '.') }}
                                    VNĐ</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-black btn-lg py-3 btn-block">Tiến hành thanh toán</button>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
        </div>
    </div>

    <script>
        // Xóa có giao diện đẹp hơn
        document.querySelectorAll('.form-delete').forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault(); // Chặn submit mặc định

                Swal.fire({
                    title: 'Xác nhận xóa?',
                    text: "Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit(); // Nếu OK thì submit form
                    }
                });
            });
        });
        // function changeQuantity(itemId, type) {
        //     let input = document.getElementById('quantity-' + itemId);
        //     let currentQuantity = parseInt(input.value) || 0;
        //     if (type === 'increase') {
        //         input.value = currentQuantity + 1;
        //     } else if (type === 'decrease' && currentQuantity > 1) {
        //         input.value = currentQuantity - 1;
        //     }
        //     updateQuantityOnServer(itemId, input.value);
        // }

        // function updateQuantityOnServer(itemId, quantity) {
        //     fetch('/cart/update-quantity', {
        //             method: 'POST',
        //             headers: {
        //                 'Content-Type': 'application/json',
        //                 'X-CSRF-TOKEN': '{{ csrf_token() }}'
        //             },
        //             body: JSON.stringify({
        //                 item_id: itemId,
        //                 quantity: quantity
        //             })
        //         })
        //         .then(response => response.json())
        //         .then(data => {
        //             if (data.success) {
        //                 updateItemTotal(itemId);
        //             } else {
        //                 alert('Có lỗi xảy ra khi cập nhật số lượng.');
        //             }
        //         })
        //         .catch(error => {
        //             console.error('Error:', error);
        //             alert('Có lỗi xảy ra khi cập nhật số lượng.');
        //         });
        // }

        // function updateItemTotal(itemId) {
        //     let quantityInput = document.getElementById('quantity-' + itemId);
        //     let quantity = parseInt(quantityInput.value) || 0;
        //     let row = quantityInput.closest('tr');
        //     let priceElement = row.querySelector('.price');
        //     let price = parseFloat(priceElement.getAttribute('data-price')) || 0;
        //     let itemTotal = price * quantity;
        //     let totalElement = document.getElementById('total-' + itemId);
        //     totalElement.textContent = formatCurrency(itemTotal) + ' VNĐ';
        //     updateCartTotal();
        // }

        // function updateCartTotal() {
        //     let cartSubtotal = 0;
        //     document.querySelectorAll('input[id^="quantity-"]').forEach(function(input) {
        //         let itemId = input.getAttribute('data-item-id');
        //         let quantity = parseInt(input.value) || 0;
        //         let row = input.closest('tr');
        //         let priceElement = row.querySelector('.price');
        //         let price = parseFloat(priceElement.getAttribute('data-price')) || 0;
        //         cartSubtotal += (price * quantity);
        //     });
        //     document.getElementById('cart-subtotal').textContent = formatCurrency(cartSubtotal) + ' VNĐ';
        //     document.getElementById('cart-total').textContent = formatCurrency(cartSubtotal) + ' VNĐ';
        // }

        // function formatCurrency(amount) {
        //     return new Intl.NumberFormat('vi-VN').format(amount);
        // }

        // document.querySelectorAll('.quantity-amount').forEach(function(input) {
        //     input.addEventListener('change', function() {
        //         let itemId = this.getAttribute('data-item-id');
        //         updateQuantityOnServer(itemId, this.value);
        //     });
        // });
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
            document.querySelectorAll('input[id^="quantity-"]').forEach(function(input) {
                let itemId = input.getAttribute('data-item-id');
                let quantity = parseInt(input.value) || 0;
                let row = input.closest('tr');
                let priceElement = row.querySelector('.price');
                let price = parseFloat(priceElement.getAttribute('data-price')) || 0;
                cartSubtotal += (price * quantity);
            });
            document.getElementById('cart-subtotal').textContent = formatCurrency(cartSubtotal) + ' VNĐ';
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
    </style>
@endsection
