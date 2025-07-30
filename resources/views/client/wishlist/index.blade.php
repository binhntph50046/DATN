@extends('client.layouts.app')
@section('title', 'Danh sách yêu thích - Apple Store')

@section('content')
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Thêm Font Awesome cho các icon (fas fa-star, fa-cart-plus, fa-trash, fa-eye) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Thêm AOS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <div class="apple-wishlist-container" style="padding-top: 105px;">
        <header class="apple-wishlist-header">
            <div class="container">
                <h1><i class="bi bi-heart-fill"></i> Danh sách yêu thích</h1>
            </div>
        </header>

        <main class="apple-wishlist-main">
            @if ($wishlists->isEmpty())
                <div class="empty-wishlist">
                    <i class="bi bi-heart"></i>
                    <h3>Danh sách trống</h3>
                    <p>Bạn chưa thêm sản phẩm nào vào wishlist</p>
                </div>
            @else
                <!-- Start Wishlist Section -->
                <div class="product-section" data-aos="fade-up">
                    <div class="container">
                        <div class="row">
                            <!-- Start Wishlist Items -->
                            <div class="col-lg-9">
                                <div class="product-slider">
                                    <div class="product-row">
                                        @forelse ($wishlists as $wishlist)
                                            @php
                                                $defaultImage = asset('uploads/default/default.jpg');
                                                $variantImage = null;
                                                $defaultVariant = $wishlist->variants->first();

                                                if ($defaultVariant && $defaultVariant->images) {
                                                    $images = json_decode($defaultVariant->images, true);
                                                    if (!empty($images[0])) {
                                                        $variantImage = asset($images[0]);
                                                    }
                                                }

                                                if (!$variantImage) {
                                                    $otherVariant = $wishlist->variants->skip(1)->first();
                                                    if ($otherVariant && $otherVariant->images) {
                                                        $images = json_decode($otherVariant->images, true);
                                                        if (!empty($images[0])) {
                                                            $variantImage = asset($images[0]);
                                                        }
                                                    }
                                                }
                                            @endphp

                                            <div class="col-md-4 col-md-4-custom mb-4" data-aos="fade-up"
                                                data-aos-delay="{{ $loop->iteration * 100 }}">
                                                <a class="product-item"
                                                    href="{{ route('product.detail', $wishlist->slug) }}"
                                                    onclick="incrementView('{{ $wishlist->id }}')">
                                                    <div class="product-thumbnail text-center">
                                                        <img src="{{ $variantImage ?? $defaultImage }}"
                                                            class="img-fluid mx-auto" alt="{{ $wishlist->name }}"
                                                            style="max-height: 200px; object-fit: contain;">
                                                    </div>
                                                    <h3 class="product-title text-center">{{ $wishlist->name }}</h3>
                                                    <div class="product-price-and-rating text-center">
                                                        @if ($defaultVariant)
                                                            @if ($defaultVariant->discount_price)
                                                                <strong
                                                                    class="product-price text-decoration-line-through text-muted">
                                                                    {{ number_format($defaultVariant->selling_price) }}đ
                                                                </strong>
                                                                <strong class="product-price text-danger ms-2">
                                                                    {{ number_format($defaultVariant->discount_price) }}đ
                                                                </strong>
                                                            @else
                                                                <strong class="product-price">
                                                                    {{ number_format($defaultVariant->selling_price) }}đ
                                                                </strong>
                                                            @endif
                                                        @endif
                                                        <div
                                                            class="product-rating d-flex justify-content-center align-items-center">
                                                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                                                class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                                                            <span>({{ number_format($wishlist->views) }} views)</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-icons">
                                                        <form action="" method="POST" style="display: none;"
                                                            id="add-cart-form-{{ $wishlist->id }}">
                                                            @csrf
                                                        </form>
                                                        <span class="icon-add-to-cart"
                                                            onclick="document.getElementById('add-cart-form-{{ $wishlist->id }}').submit();">
                                                            <i class="fas fa-cart-plus"></i>
                                                        </span>
                                                        <span class="icon-quick-view"
                                                            onclick="event.preventDefault(); showQuickView({{ $wishlist->id }})">
                                                            <i class="fas fa-eye"></i>
                                                        </span>
                                                        <form action="{{ route('wishlist.toggle', $wishlist) }}"
                                                            method="POST" style="display: none;"
                                                            id="remove-wishlist-{{ $wishlist->id }}" class="wishlist-form">
                                                            @csrf
                                                        </form>
                                                        <span class="icon-trash icon-remove-from-wishlist"
                                                            onclick="event.preventDefault(); removeFromWishlist('{{ $wishlist->id }}', '{{ route('wishlist.toggle', $wishlist) }}');"
                                                            title="Xóa khỏi yêu thích">
                                                            <i class="fas fa-trash"></i>
                                                        </span>
                                                    </div>
                                                </a>
                                            </div>
                                        @empty
                                            <div class="col-12">
                                                <p class="text-center">Bạn chưa có sản phẩm nào trong danh sách yêu thích.
                                                </p>
                                            </div>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                            <!-- End Wishlist Items -->
                        </div>
                    </div>
                </div>
            @endif
        </main>
    </div>

    <!-- Quick View Modal -->
    <div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="quickViewModalLabel">Quick View</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="product-gallery">
                                <div class="main-image mb-4">
                                    <img src="" class="img-fluid quick-view-image" alt="Product Image">
                                </div>
                                <div class="thumbnail-images">
                                    <div class="row">
                                        <div class="col-3">
                                            <img src="images/product-1.png" class="img-fluid thumbnail" alt="Thumbnail 1">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-2.png" class="img-fluid thumbnail" alt="Thumbnail 2">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-3.png" class="img-fluid thumbnail" alt="Thumbnail 3">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-1.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3 class="quick-view-title"></h3>
                            <p class="quick-view-price"></p>
                            <p class="quick-view-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
                                do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                            <!-- Color Variants -->
                            <div class="color-variants mb-4">
                                <label class="form-label">Màu sắc:</label>
                                <div class="color-options">
                                    <div class="color-option active" data-color="purple"
                                        style="background-color: #8A2BE2;"></div>
                                    <div class="color-option" data-color="black" style="background-color: #000000;">
                                    </div>
                                    <div class="color-option" data-color="gold" style="background-color: #FFD700;"></div>
                                    <div class="color-option" data-color="silver" style="background-color: #C0C0C0;">
                                    </div>
                                </div>
                            </div>

                            <!-- Storage Options -->
                            <div class="storage-options mb-4">
                                <label class="form-label">Dung lượng:</label>
                                <div class="storage-buttons">
                                    <button class="storage-btn active" data-storage="128">128GB</button>
                                    <button class="storage-btn" data-storage="256">256GB</button>
                                    <button class="storage-btn" data-storage="512">512GB</button>
                                    <button class="storage-btn" data-storage="1024">1TB</button>
                                </div>
                            </div>

                            <!-- Quantity Selector -->
                            <div class="quantity-selector mb-4">
                                <label class="form-label">Số lượng:</label>
                                <div class="quantity-control">
                                    <button class="quantity-btn minus">-</button>
                                    <input type="number" id="quickViewQuantity" class="form-control" value="1"
                                        min="1" readonly>
                                    <button class="quantity-btn plus">+</button>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="product-actions mb-4">
                                <button class="btn btn-primary">
                                    <i class="fas fa-bolt me-2"></i>Mua ngay
                                </button>
                                <button class="btn btn-outline-primary">
                                    <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Khởi tạo AOS
        AOS.init({
            duration: 800,
            once: false,
        });

        // Xử lý sự kiện icon-add-to-cart
        document.querySelectorAll('.product-item').forEach(wishlist => {
            wishlist.querySelector('.icon-add-to-cart').addEventListener('click', (e) => {
                e.preventDefault();
                alert('Đã thêm vào giỏ hàng: ' + wishlist.querySelector('.product-title').textContent);
            });
        });

        function incrementView(productId) {
            fetch(`/increment-view/${productId}`, {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        console.log('Đã tăng lượt xem');
                    }
                });
        }

        function showQuickView(productId) {
            incrementView(productId);
            const modal = new bootstrap.Modal(document.getElementById('quickViewModal'));

            fetch(`/product/${productId}`, {
                    method: 'GET',
                    headers: {
                        'Accept': 'application/json',
                    }
                })
                .then(response => response.json())
                .then(data => {
                    document.querySelector('.quick-view-image').src = data.image ||
                        '{{ asset('uploads/default/default.jpg') }}';
                    document.querySelector('.quick-view-title').textContent = data.name;
                    document.querySelector('.quick-view-price').textContent = data.price ? `${data.price}đ` : 'N/A';
                    const thumbnails = document.querySelectorAll('#quickViewModal .thumbnail');
                    const images = data.images || [];
                    thumbnails.forEach((thumb, index) => {
                        thumb.src = images[index] || '{{ asset('uploads/default/default.jpg') }}';
                    });
                    modal.show();
                })
                .catch(error => console.error('Lỗi khi tải thông tin sản phẩm:', error));
        }

        // Quick View Modal Functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Thumbnail click handler
            document.querySelectorAll('#quickViewModal .thumbnail').forEach(thumb => {
                thumb.addEventListener('click', function() {
                    const mainImage = document.querySelector('#quickViewModal .quick-view-image');
                    mainImage.src = this.src;
                });
            });

            // Color variant selection
            document.querySelectorAll('#quickViewModal .color-option').forEach(option => {
                option.addEventListener('click', function() {
                    document.querySelectorAll('#quickViewModal .color-option').forEach(opt => opt
                        .classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Storage option selection
            document.querySelectorAll('#quickViewModal .storage-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    document.querySelectorAll('#quickViewModal .storage-btn').forEach(b => b
                        .classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Quantity controls
            const quantityInput = document.getElementById('quickViewQuantity');
            const minusBtn = document.querySelector('#quickViewModal .quantity-btn.minus');
            const plusBtn = document.querySelector('#quickViewModal .quantity-btn.plus');

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

            // Add to cart button
            document.querySelector('#quickViewModal .btn-outline-primary').addEventListener('click', function() {
                const quantity = document.getElementById('quickViewQuantity').value;
                const selectedColor = document.querySelector('#quickViewModal .color-option.active').dataset
                    .color;
                const selectedStorage = document.querySelector('#quickViewModal .storage-btn.active')
                    .dataset.storage;

                alert(
                    `Đã thêm vào giỏ:\nSố lượng: ${quantity}\nMàu: ${selectedColor}\nDung lượng: ${selectedStorage}GB`
                );
            });

            // Buy now button
            document.querySelector('#quickViewModal .btn-primary').addEventListener('click', function() {
                const quantity = document.getElementById('quickViewQuantity').value;
                const selectedColor = document.querySelector('#quickViewModal .color-option.active').dataset
                    .color;
                const selectedStorage = document.querySelector('#quickViewModal .storage-btn.active')
                    .dataset.storage;

                alert(
                    `Đang chuyển đến thanh toán:\nSố lượng: ${quantity}\nMàu: ${selectedColor}\nDung lượng: ${selectedStorage}GB`
                );
            });
        });

        function showCustomAlert(message, type = 'success') {
            const alertId = 'custom-alert-' + Date.now();
            const icon = type === 'success' ? 'fa-check-circle' : 'fa-times-circle';
            const alertDiv = document.createElement('div');
            alertDiv.className = `custom-alert ${type}`;
            alertDiv.id = alertId;
            alertDiv.innerHTML = `
                <div class="icon"><i class="fas ${icon}"></i></div>
                <div class="content">
                    <strong>${type.toUpperCase()}</strong>
                    <p>${message}</p>
                </div>
                <div class="close" onclick="this.parentElement.style.display='none';">&times;</div>
            `;
            document.body.appendChild(alertDiv);
            setTimeout(() => {
                alertDiv.style.display = 'none';
            }, 3000);
        }

        function removeFromWishlist(productId, url) {
            const form = document.getElementById(`remove-wishlist-${productId}`);
            const formData = new FormData(form);
            fetch(url, {
                method: 'POST',
                body: formData,
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Accept': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status) {
                    // Xóa sản phẩm khỏi DOM
                    const productCard = document.getElementById('remove-wishlist-' + productId)?.closest('.col-md-4, .col-md-4-custom');
                    if (productCard) productCard.remove();
                    showCustomAlert(data.message || 'Đã xóa khỏi danh sách yêu thích!', 'success');
                    // Nếu không còn sản phẩm nào, hiển thị trạng thái trống
                    if (document.querySelectorAll('.product-row .col-md-4, .product-row .col-md-4-custom').length === 0) {
                        document.querySelector('.apple-wishlist-main').innerHTML = `
                            <div class="empty-wishlist">
                                <i class="bi bi-heart"></i>
                                <h3>Danh sách trống</h3>
                                <p>Bạn chưa thêm sản phẩm nào vào wishlist</p>
                            </div>
                        `;
                    }
                } else {
                    showCustomAlert(data.message || 'Có lỗi xảy ra!', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showCustomAlert('Có lỗi xảy ra khi xóa sản phẩm khỏi wishlist!', 'error');
            });
        }
    </script>

    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Container chính */
        .apple-wishlist-container {
            max-width: 1200px;
            margin: 0 auto;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        /* Header cố định */
        .apple-wishlist-header {
            margin-top: 120px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: white;
            z-index: 998;
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .apple-wishlist-header h1 {
            font-size: 24px;
            font-weight: 600;
            color: #000;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .apple-wishlist-header i {
            color: #ff3b30;
        }

        /* Nội dung chính */
        .apple-wishlist-main {
            padding: 20px;
        }

        /* Trạng thái trống */
        .empty-wishlist {
            text-align: center;
            padding: 50px 20px;
            margin-top: 62px;
        }

        .empty-wishlist i {
            font-size: 60px;
            color: #86868b;
            margin-bottom: 20px;
        }

        .empty-wishlist h3 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .empty-wishlist p {
            color: #86868b;
            margin-bottom: 25px;
        }

        /* Nút mua sắm */
        .btn-shop-now {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            background: #0071e3;
            color: white;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-shop-now:hover {
            background: #0062c4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 113, 227, 0.3);
        }

        /* Style cho Quick View Modal */
        .color-option {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 10px;
            cursor: pointer;
            border: 2px solid transparent;
        }

        .color-option.active {
            border-color: #000;
        }

        .storage-btn {
            padding: 5px 10px;
            margin-right: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f8f9fa;
            cursor: pointer;
        }

        .storage-btn.active {
            background: #007bff;
            color: #fff;
            border-color: #007bff;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-btn {
            padding: 5px 10px;
            border: 1px solid #ddd;
            background: #f8f9fa;
            cursor: pointer;
        }

        .quantity-btn:hover {
            background: #e9ecef;
        }

        /* CSS từ trang home cho product-item */
        .product-slider {
            margin: 0 -15px;
        }

        .product-row {
            display: flex;
            margin: 0;
            /* Giảm margin để các items gần nhau hơn */
            justify-content: flex-start;
        }

        .col-md-4-custom {
            padding-left: 10px;
            /* Giảm padding để các items gần nhau hơn */
            padding-right: 10px;
        }

        .product-slider .slick-slide {
            padding: 0 15px;
        }

        .product-thumbnail {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 200px;
            margin-bottom: 15px;
        }

        .product-thumbnail img {
            max-width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }

        .product-item {
            display: block;
            text-decoration: none;
            color: inherit;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .product-item:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
        }

        .product-item:hover .product-thumbnail img {
            transform: scale(1.001);
            transition: transform 0.2s ease;
        }

        .product-title {
            font-size: 1.1rem;
            margin: 10px 0;
            color: #333;
        }

        .product-price-and-rating {
            margin: 10px 0;
        }

        .product-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 10px;
        }

        .product-icons span {
            cursor: pointer;
            padding: 8px;
            border-radius: 50%;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        .product-icons span:hover {
            background: #e9ecef;
            color: #007bff;
        }

        .product-slider .slick-prev,
        .product-slider .slick-next {
            z-index: 1;
            width: 40px;
            height: 40px;
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-slider .slick-prev {
            left: -20px;
        }

        .product-slider .slick-next {
            right: -20px;
        }

        .product-slider .slick-prev:before,
        .product-slider .slick-next:before {
            font-size: 20px;
            color: #333;
        }

        .product-slider .slick-dots {
            bottom: -30px;
        }

        .product-slider .slick-dots li button:before {
            font-size: 12px;
        }

        /* Latest Products Slider Styles (không áp dụng cho wishlist) */
        .latest-products-slider {
            margin: 0 -15px;
        }

        .latest-products-slider .slick-slide {
            padding: 0 15px;
        }

        .latest-products-slider .slick-prev,
        .latest-products-slider .slick-next {
            z-index: 1;
            width: 40px;
            height: 40px;
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .latest-products-slider .slick-prev {
            left: -20px;
        }

        .latest-products-slider .slick-next {
            right: -20px;
        }

        .latest-products-slider .slick-prev:before,
        .latest-products-slider .slick-next:before {
            font-size: 20px;
            color: #333;
        }

        .latest-products-slider .slick-dots {
            bottom: -30px;
        }

        .latest-products-slider .slick-dots li button:before {
            font-size: 12px;
        }

        @media (max-width: 768px) {
            .product-row {
                justify-content: center;
            }

            .col-md-4-custom {
                width: 100%;
                max-width: 300px;
                padding-left: 15px;
                /* Giữ padding mặc định trên mobile */
                padding-right: 15px;
            }
        }

        /* Responsive cho wishlist */
        @media (max-width: 768px) {
            .apple-wishlist-container {
                padding-top: 70px;
            }

            .apple-wishlist-header h1 {
                font-size: 20px;
            }
        }
    </style>
@endsection
