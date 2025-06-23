@extends('client.layouts.app')
@section('title', 'Trang chủ - Apple Store')

@section('banner')
    <!-- Start Hero Section -->
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            @foreach ($banners as $index => $banner)
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="{{ $index }}"
                    class="{{ $index == 0 ? 'active' : '' }}" aria-current="{{ $index == 0 ? 'true' : 'false' }}"
                    aria-label="Slide {{ $index + 1 }}"></button>
            @endforeach
        </div>
        <div class="carousel-inner">
            @foreach ($banners as $index => $banner)
                <div class="carousel-item {{ $index == 0 ? 'active' : '' }}"
                    style="background-image: url('{{ asset($banner->image) }}');">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="intro-excerpt">
                                    <h1>{{ $banner->title }}</h1>
                                    <p class="mb-4">{{ $banner->description }}</p>
                                    <p class="d-flex align-items-center gap-2">
                                        <a href="{{ $banner->link ?? '#' }}"
                                            class="btn btn-secondary text-nowrap me-2 d-inline-block">Shop Now</a>
                                        <a href="#" class="btn btn-white-outline d-inline-block">Explore</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
@endsection
@section('content')
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Toast Container -->
    <!-- (Remove this line and all custom alert code) -->

    <!-- Custom Alert Container -->
    <!-- (Remove this block) -->

    <!-- Start Why Choose Us Section -->
    <div class="why-choose-section" data-aos="fade-up">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    <h2 class="section-title">Vì Sao Bạn Chọn Chúng Tôi</h2>
                    <p>Chúng tôi cam kết mang đến trải nghiệm mua sắm Apple chính hãng dễ dàng, nhanh chóng và đáng tin cậy.
                        Dịch vụ tận tâm, sản phẩm chất lượng, giá cả hợp lý – tất cả đều vì bạn.</p>

                    <div class="row my-5">
                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/truck.svg" alt="Giao hàng nhanh" class="img-fluid">
                                </div>
                                <h3>Giao Hàng Nhanh & Miễn Phí</h3>
                                <p>Miễn phí giao hàng toàn quốc với tốc độ nhanh chóng, đảm bảo sản phẩm Apple đến tay bạn
                                    an toàn và đúng hẹn.</p>
                            </div>
                        </div>

                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="200">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/bag.svg" alt="Mua sắm dễ dàng" class="img-fluid">
                                </div>
                                <h3>Mua Sắm Dễ Dàng</h3>
                                <p>Website thân thiện, hỗ trợ tìm kiếm nhanh chóng các sản phẩm Apple chính hãng như iPhone,
                                    MacBook, AirPods và nhiều hơn nữa.</p>
                            </div>
                        </div>

                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="300">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/support.svg" alt="Hỗ trợ 24/7" class="img-fluid">
                                </div>
                                <h3>Hỗ Trợ Khách Hàng 24/7</h3>
                                <p>Đội ngũ tư vấn luôn sẵn sàng hỗ trợ bạn mọi lúc mọi nơi, từ chọn sản phẩm đến bảo hành và
                                    kỹ thuật.</p>
                            </div>
                        </div>

                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="400">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/return.svg" alt="Đổi trả dễ dàng" class="img-fluid">
                                </div>
                                <h3>Đổi Trả Nhanh Chóng</h3>
                                <p>Hỗ trợ đổi trả trong 7 ngày nếu sản phẩm gặp lỗi từ nhà sản xuất hoặc không đúng mô tả.
                                    Mua sắm không lo rủi ro.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="img-wrap" data-aos="zoom-in">
                        <img src="https://img.freepik.com/free-photo/business-man-holding-clipboard-with-why-choose-us-question_23-2148932313.jpg?semt=ais_hybrid&w=740"
                            alt="Image" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Why Choose Us Section -->

    <!-- Start Most Popular Products Section -->
    <div class="most-popular-section" data-aos="fade-up">
        <div class="container">
            <div class="row justify-content-between">
                <!-- Start Products Column -->
                <div class="col-lg-8">
                    <div class="product-slider">
                        @foreach ($mostViewedProducts as $product)
                            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="{{ $loop->iteration * 100 }}">
                                <a class="product-item" href="{{ route('product.detail', $product->slug) }}"
                                    onclick="incrementView('{{ $product->id }}')" data-product-id="{{ $product->id }}">
                                    <div class="product-thumbnail text-center">
                                        @php
                                            $images = getImagesArray($product->images);
                                            if (empty($images) && $product->variants->isNotEmpty()) {
                                                $variant = $product->variants->first();
                                                $images = getImagesArray($variant->images);
                                            }
                                            $mainImage = $images[0] ?? 'uploads/default/default.jpg';
                                            if (!empty($mainImage) && !str_starts_with($mainImage, 'uploads/')) {
                                                $mainImage = 'uploads/products/' . $mainImage;
                                            }
                                        @endphp

                                        <img src="{{ asset($mainImage) }}" class="img-fluid mx-auto"
                                            alt="{{ $product->name }}"
                                            style="max-height: 200px; object-fit: contain;">
                                    </div>
                                    <h3 class="product-title text-center">{{ $product->name }}</h3>
                                    <div class="product-price-and-rating text-center">
                                        @if ($product->variants->isNotEmpty())
                                            @php
                                                $variant = $product->variants->first();
                                            @endphp
                                            @if ($variant->discount_price)
                                                <strong
                                                    class="product-price text-decoration-line-through text-muted">{{ number_format($variant->selling_price) }}đ</strong>
                                                <strong
                                                    class="product-price text-danger ms-2">{{ number_format($variant->discount_price) }}đ</strong>
                                            @else
                                                <strong
                                                    class="product-price">{{ number_format($variant->selling_price) }}đ</strong>
                                            @endif
                                        @endif
                                        <div
                                            class="product-rating d-flex justify-content-center align-items-center">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>({{ number_format($product->views) }} views)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        @auth
                                            <form action="{{ route('wishlist.toggle', $product) }}" method="POST"
                                                style="display: none;" id="wishlist-form-{{ $product->id }}">
                                                @csrf
                                                <input type="hidden" name="product_name"
                                                    value="{{ $product->name }}">
                                            </form>
                                            <span
                                                class="icon-heart icon-add-to-wishlist {{ in_array($product->id, $wishlistProductIds) ? 'in-wishlist' : '' }}"
                                                onclick="event.preventDefault(); toggleWishlist('{{ $product->id }}', '{{ route('wishlist.toggle', $product) }}', this)"
                                                title="{{ in_array($product->id, $wishlistProductIds) ? 'Xóa khỏi yêu thích' : 'Thêm vào yêu thích' }}">
                                                <i class="fas fa-heart"></i>
                                            </span>
                                        @else
                                            <span class="icon-heart icon-add-to-wishlist"
                                                onclick="event.preventDefault(); showLoginPrompt()"
                                                title="Đăng nhập để thêm vào yêu thích">
                                                <i class="fas fa-heart"></i>
                                            </span>
                                        @endauth
                                        <span class="icon-quick-view"
                                            onclick="event.preventDefault(); showQuickView({{ $product->id }})"><i
                                                class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>
                </div>
                <!-- End Products Column -->

                <!-- Start Text Column -->
                <div class="col-lg-4">
                    <div class="popular-content" data-aos="fade-left" data-aos-delay="400">
                        <h2 class="section-title">Sản Phẩm Bán Chạy Nhất</h2>
                        <p class="mb-4">Khám phá những thiết bị Apple được ưa chuộng nhất hiện nay – nơi hội tụ đỉnh cao
                            công nghệ và thiết kế tinh tế. Đáp ứng mọi nhu cầu từ giải trí đến công việc.</p>

                        <div class="popular-features">
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Công Nghệ Đột Phá</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Thiết Kế Cao Cấp</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Đồng Bộ Hoàn Hảo</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Bảo Hành Toàn Cầu</span>
                            </div>
                        </div>

                        <p><a href="{{ route('shop') }}" class="btn">Xem Tất Cả Sản Phẩm</a></p>
                    </div>
                </div>
                <!-- End Text Column -->
            </div>
        </div>
    </div>
    <!-- End Most Popular Products Section -->

    <!-- Start Product Section -->
    <div class="product-section" data-aos="fade-up">
        <div class="container">
            <div class="row">
                <!-- Start Column 1 -->
                <div class="col-md-12 col-lg-3 mb-5 mb-lg-0" data-aos="fade-right" data-aos-delay="100">
                    <h2 class="mb-4 section-title">Thiết Kế Hướng Tới Tương Lai</h2>
                    <p class="mb-4">Các sản phẩm Apple của chúng tôi được chế tác tinh xảo, kết hợp giữa chất liệu cao
                        cấp và công nghệ tiên tiến. Mỗi chi tiết đều được chăm chút để mang đến trải nghiệm vượt xa một
                        thiết bị – là tuyên ngôn phong cách sống số hiện đại.</p>
                    <p><a href="{{ route('shop') }}" class="btn">Khám Phá Ngay</a></p>
                </div>
                <!-- End Column 1 -->

                <!-- Start Latest Products Column -->
                <div class="col-lg-9">
                    <div class="product-slider">
                        @foreach ($latestProducts as $product)
                            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="{{ $loop->iteration * 100 }}">
                                <a class="product-item" href="{{ route('product.detail', $product->slug) }}"
                                    onclick="incrementView('{{ $product->id }}')" data-product-id="{{ $product->id }}">
                                    <div class="product-thumbnail text-center">
                                        @php
                                            $images = getImagesArray($product->images);
                                            if (empty($images) && $product->variants->isNotEmpty()) {
                                                $variant = $product->variants->first();
                                                $images = getImagesArray($variant->images);
                                            }
                                            $mainImage = $images[0] ?? 'uploads/default/default.jpg';
                                            if (!empty($mainImage) && !str_starts_with($mainImage, 'uploads/')) {
                                                $mainImage = 'uploads/products/' . $mainImage;
                                            }
                                        @endphp

                                        <img src="{{ asset($mainImage) }}" class="img-fluid mx-auto"
                                            alt="{{ $product->name }}"
                                            style="max-height: 200px; object-fit: contain;">
                                    </div>
                                    <h3 class="product-title text-center">{{ $product->name }}</h3>
                                    <div class="product-price-and-rating text-center">
                                        @if ($product->variants->isNotEmpty())
                                            @php
                                                $variant = $product->variants->first();
                                            @endphp
                                            @if ($variant->discount_price)
                                                <strong
                                                    class="product-price text-decoration-line-through text-muted">{{ number_format($variant->selling_price) }}đ</strong>
                                                <strong
                                                    class="product-price text-danger ms-2">{{ number_format($variant->discount_price) }}đ</strong>
                                            @else
                                                <strong
                                                    class="product-price">{{ number_format($variant->selling_price) }}đ</strong>
                                            @endif
                                        @endif
                                        <div
                                            class="product-rating d-flex justify-content-center align-items-center">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>({{ number_format($product->views) }} views)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        @auth
                                            <form action="{{ route('wishlist.toggle', $product) }}" method="POST"
                                                style="display: none;" id="wishlist-form-{{ $product->id }}">
                                                @csrf
                                                <input type="hidden" name="product_name" value="{{ $product->name }}">
                                            </form>
                                            <span
                                                class="icon-heart icon-add-to-wishlist {{ in_array($product->id, $wishlistProductIds) ? 'in-wishlist' : '' }}"
                                                onclick="event.preventDefault(); toggleWishlist('{{ $product->id }}', '{{ route('wishlist.toggle', $product) }}', this)"
                                                title="{{ in_array($product->id, $wishlistProductIds) ? 'Xóa khỏi yêu thích' : 'Thêm vào yêu thích' }}">
                                                <i class="fas fa-heart"></i>
                                            </span>
                                        @else
                                            <span class="icon-heart icon-add-to-wishlist"
                                                onclick="event.preventDefault(); showLoginPrompt()"
                                                title="Đăng nhập để thêm vào yêu thích">
                                                <i class="fas fa-heart"></i>
                                            </span>
                                        @endauth
                                        <span class="icon-quick-view"
                                            onclick="event.preventDefault(); showQuickView({{ $product->id }})"><i
                                                class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>
                </div>
                <!-- End Latest Products Column -->

                <!-- JavaScript for Wishlist -->
                <script>
                    // Định nghĩa các hàm toàn cục
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

                    // Function to toggle wishlist status
                    async function toggleWishlist(productId, url, iconElement) {
                        const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');
                        if (!csrfToken) {
                            showCustomAlert('Lỗi hệ thống, vui lòng thử lại!', 'error');
                            return;
                        }
                        try {
                            const response = await fetch(url, {
                                method: 'POST',
                                headers: {
                                    'X-CSRF-TOKEN': csrfToken,
                                    'Accept': 'application/json',
                                    'Content-Type': 'application/json'
                                },
                                body: JSON.stringify({ product_id: productId })
                            });
                            const contentType = response.headers.get('content-type');
                            if (!contentType || !contentType.includes('application/json')) {
                                throw new Error('Invalid JSON response');
                            }
                            const data = await response.json();
                            if (data.status) {
                                showCustomAlert(data.message, data.type);
                                if (data.type === 'success') {
                                    // Cập nhật tất cả các trái tim của cùng một sản phẩm
                                    const allHeartIcons = document.querySelectorAll(`.icon-heart[onclick*="toggleWishlist('${productId}'"]`);
                                    allHeartIcons.forEach(icon => {
                                        if (data.in_wishlist) {
                                            icon.classList.add('in-wishlist');
                                            icon.title = 'Xóa khỏi yêu thích';
                                        } else {
                                            icon.classList.remove('in-wishlist');
                                            icon.title = 'Thêm vào yêu thích';
                                        }
                                    });
                                }
                            } else {
                                showCustomAlert(data.message || 'Đã xảy ra lỗi, vui lòng thử lại!', 'error');
                            }
                        } catch (error) {
                            showCustomAlert('Đã xảy ra lỗi: ' + (error.message || 'Unknown error'), 'error');
                        }
                    }

                    function showLoginPrompt() {
                        showCustomAlert('Vui lòng đăng nhập để thêm sản phẩm vào danh sách yêu thích.', 'error');
                    }
                </script>

                <!-- CSRF Meta Tag -->
                <meta name="csrf-token" content="{{ csrf_token() }}">
            </div>
        </div>
    </div>
    <!-- End Product Section -->

    <!-- Start We Help Section -->
    <div class="we-help-section" data-aos="fade-up">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-7 mb-5 mb-lg-0" data-aos="fade-right">
                    <div class="imgs-grid">
                        <div class="grid grid-1"><img src="https://product.hstatic.net/1000259254/product/apple_watch_series_6_gps-3_f473dbbd7a8a4eebb713eb4737a4bb3c_grande.jpg" alt="Untree.co"></div>
                        <div class="grid grid-2"><img src="https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/mac-card-100-customize-202503_FMT_WHH?wid=660&hei=492&fmt=png-alpha&.v=WGVJR1JzeVlHQndDQ0hPeUcxZEhIVVI0Q213c2R4MVpIbnhYSW0yemZZSjhCbGlKVjM2L2p6MTB1VFhaSTNQZTFpQTgzYnRLU3FIbktmUFFaOW9RVVI3OWM1K2xYY1BvNUdGM3NrY09OUVVBUlVVbndFOUhuNmlVSkZDVGZlRGc" alt="Untree.co"></div>
                        <div class="grid grid-3"><img src="https://www.apple.com/newsroom/images/2023/09/apple-debuts-iphone-15-and-iphone-15-plus/article/Apple-iPhone-15-lineup-hero-geo-230912_inline.jpg.large.jpg" alt="Untree.co"></div>
                    </div>
                </div>
                <div class="col-lg-5 ps-lg-5" data-aos="fade-left" data-aos-delay="100">
                    <h2 class="section-title mb-4">Chúng Tôi Giúp Bạn Sở Hữu Thiết Bị Apple Hiện Đại</h2>
                    <p>Chúng tôi không chỉ bán sản phẩm – chúng tôi mang đến giải pháp công nghệ toàn diện cho cuộc sống
                        hiện đại. Từ iPhone đến MacBook, tất cả đều được chọn lọc kỹ lưỡng để mang đến trải nghiệm đỉnh cao.
                    </p>

                    <ul class="list-unstyled custom-list my-4">
                        <li>Sản phẩm Apple chính hãng, bảo hành toàn quốc</li>
                        <li>Đa dạng mẫu mã từ iPhone, iPad, MacBook,...</li>
                        <li>Giao hàng nhanh chóng, hỗ trợ tận nơi</li>
                        <li>Hỗ trợ kỹ thuật & tư vấn tận tình 24/7</li>
                    </ul>
                    <p><a href="{{ route('shop') }}" class="btn">Khám Phá Ngay</a></p>
                </div>

            </div>
        </div>
    </div>
    <!-- End We Help Section -->

    <!-- Start Trust Banner Section -->
    {{-- <div class="trust-banner-section" data-aos="fade-up">
        <div class="container">
            <div class="row">
                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="100">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="https://yourdomain.com/images/experience.svg" alt="Experience" class="img-fluid">
                        </div>
                        <h3>10+ Năm Kinh Nghiệm</h3>
                        <p>Uy tín trong lĩnh vực kinh doanh thiết bị Apple chính hãng tại Việt Nam</p>
                    </div>
                </div>

                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="https://yourdomain.com/images/customers.svg" alt="Customers" class="img-fluid">
                        </div>
                        <h3>1000+ Khách Hàng Hài Lòng</h3>
                        <p>Phục vụ hàng nghìn khách hàng trên toàn quốc mỗi năm</p>
                    </div>
                </div>

                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="https://yourdomain.com/images/quality.svg" alt="Quality" class="img-fluid">
                        </div>
                        <h3>Chất Lượng Cao Cấp</h3>
                        <p>Sản phẩm Apple chính hãng, nguyên seal, bảo hành toàn cầu</p>
                    </div>
                </div>

                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="https://yourdomain.com/images/rating.svg" alt="Rating" class="img-fluid">
                        </div>
                        <h3>Đánh Giá 5 Sao</h3>
                        <p>Được đánh giá cao về chất lượng sản phẩm và dịch vụ khách hàng</p>
                    </div>
                </div>

            </div>
        </div>
    </div> --}}
    <!-- End Trust Banner Section -->

    <!-- Start Testimonial Slider -->
    <div class="testimonial-section" data-aos="fade-up">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 mx-auto text-center" data-aos="fade-up">
                    <h2 class="section-title">Testimonials</h2>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-12" data-aos="fade-up" data-aos-delay="100">
                    <div class="testimonial-slider-wrap text-center">
                        <div id="testimonial-nav">
                            <span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
                            <span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
                        </div>

                        <div class="testimonial-slider">
                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>"Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque."</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->

                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>"Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque."</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->

                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>"Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque."</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->

                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>"Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque."</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Testimonial Slider -->

    <!-- Start Blog Section -->
    <div class="blog-section" data-aos="fade-up">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-6" data-aos="fade-right">
                    <h2 class="section-title">Recent Blog</h2>
                </div>
                <div class="col-md-6 text-start text-md-end" data-aos="fade-left">
                    <a href="#" class="more">View All Posts</a>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0" data-aos="fade-up" data-aos-delay="100">
                    <div class="post-entry">
                        <a href="#" class="post-thumbnail"><img src="images/post-1.jpg" alt="Image"
                                class="img-fluid"></a>
                        <div class="post-content-entry">
                            <h3><a href="#">First Time Home Owner Ideas</a></h3>
                            <div class="meta">
                                <span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 19,
                                        2021</a></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0" data-aos="fade-up" data-aos-delay="200">
                    <div class="post-entry">
                        <a href="#" class="post-thumbnail"><img src="images/post-2.jpg" alt="Image"
                                class="img-fluid"></a>
                        <div class="post-content-entry">
                            <h3><a href="#">How To Keep Your Furniture Clean</a></h3>
                            <div class="meta">
                                <span>by <a href="#">Robert Fox</a></span> <span>on <a href="#">Dec 15,
                                        2021</a></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0" data-aos="fade-up" data-aos-delay="300">
                    <div class="post-entry">
                        <a href="#" class="post-thumbnail"><img src="images/post-3.jpg" alt="Image"
                                class="img-fluid"></a>
                        <div class="post-content-entry">
                            <h3><a href="#">Small Space Furniture Apartment Ideas</a></h3>
                            <div class="meta">
                                <span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 12,
                                        2021</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog Section -->

    <!-- Inline JavaScript for Icon Functionality -->
    <script>
        document.querySelectorAll('.product-item').forEach(item => {
            item.querySelector('.icon-add-to-cart').addEventListener('click', (e) => {
                e.preventDefault();
            });

            item.querySelector('.icon-quick-view').addEventListener('click', (e) => {
                e.preventDefault();
                const productId = item.dataset.productId;
                showQuickView(productId);
            });
        });

        function showQuickView(productId) {
            incrementView(productId);
                const modal = new bootstrap.Modal(document.getElementById('quickViewModal'));

            // Fetch product details from API
            fetch(`/api/products/${productId}`)
                .then(response => response.json())
                .then(product => {
                    if (!product) {
                        showCustomAlert('Sản phẩm không tồn tại hoặc đã bị xóa', 'error');
                        return;
                    }

                // Update modal content
                    document.querySelector('.quick-view-title').textContent = product.name;

                    // Hiển thị category và warranty
                    document.querySelector('.quick-view-category').textContent = product.category?.name || '';
                    document.querySelector('.quick-view-warranty').textContent = product.warranty ? product.warranty + ' months' : '';
                    
                    // Get first variant that is not deleted
                    const activeVariant = product.variants.find(v => !v.deleted_at);
                    if (!activeVariant) {
                        showCustomAlert('Sản phẩm hiện không có phiên bản khả dụng', 'error');
                        return;
                    }

                    // Update price
                    const priceElement = document.querySelector('.quick-view-price');
                    if (activeVariant.discount_price) {
                        priceElement.innerHTML = `
                            <span class="text-decoration-line-through text-muted">${activeVariant.selling_price.toLocaleString('vi-VN')}đ</span>
                            <span class="text-danger ms-2">${activeVariant.discount_price.toLocaleString('vi-VN')}đ</span>
                        `;
                    } else {
                        priceElement.textContent = `${activeVariant.selling_price.toLocaleString('vi-VN')}đ`;
                    }

                    // Update images
                    let images = [];
                    try {
                        images = typeof activeVariant.images === 'string' 
                            ? JSON.parse(activeVariant.images) 
                            : (Array.isArray(activeVariant.images) ? activeVariant.images : []);
                    } catch (e) {
                        console.error('Error parsing images:', e);
                        images = [];
                    }

                    if (images.length > 0) {
                        const mainImage = document.querySelector('.quick-view-image');
                        mainImage.src = images[0].startsWith('http') ? images[0] : `/${images[0]}`;

                // Update thumbnails
                        const thumbnailsContainer = document.querySelector('.thumbnail-images .row');
                        thumbnailsContainer.innerHTML = '';
                        images.forEach((img, index) => {
                            const col = document.createElement('div');
                            col.className = 'col-3';
                            col.innerHTML = `
                                <img src="${img.startsWith('http') ? img : `/${img}`}" 
                                     class="img-fluid thumbnail ${index === 0 ? 'active' : ''}" 
                                     alt="Thumbnail ${index + 1}"
                                     onclick="changeMainImage(this)">
                            `;
                            thumbnailsContainer.appendChild(col);
                        });
                    }

                    // Update variants
                    const variantGroups = document.getElementById('quickViewVariantGroups');
                    variantGroups.innerHTML = '';

                    // Group variants by attribute type
                    const attributeGroups = {};
                    product.variants.forEach(variant => {
                        if (variant.deleted_at) return; // Skip deleted variants
                        
                        variant.combinations.forEach(comb => {
                            if (!comb.attribute_value || comb.attribute_value.deleted_at) return; // Skip deleted attribute values
                            
                            const typeName = comb.attribute_value.attribute_type?.name;
                            if (!typeName) return;

                            if (!attributeGroups[typeName]) {
                                attributeGroups[typeName] = new Set();
                            }

                            let value = comb.attribute_value.value;
                            let hex = comb.attribute_value.hex;

                            try {
                                if (typeof value === 'string') {
                                    value = JSON.parse(value);
                                }
                                if (typeof hex === 'string') {
                                    hex = JSON.parse(hex);
                                }
                            } catch (e) {
                                console.error('Error parsing value/hex:', e);
                            }

                            attributeGroups[typeName].add(JSON.stringify({
                                value: Array.isArray(value) ? value[0] : value,
                                hex: Array.isArray(hex) ? hex[0] : hex,
                                variantId: variant.id
                            }));
            });
        });

                    // Create HTML for each attribute group
                    Object.entries(attributeGroups).forEach(([typeName, values]) => {
                        const groupDiv = document.createElement('div');
                        groupDiv.className = 'variant-group mb-4';
                        
                        const labelHtml = `
                            <label class="variant-label">${typeName}:</label>
                            <div class="variant-options"></div>
                        `;
                        
                        const optionsDiv = document.createElement('div');
                        optionsDiv.className = 'variant-options';
                        
                        values.forEach(item => {
                            const value = JSON.parse(item);
                            const isColor = typeName.toLowerCase().includes('color');
                            
                            if (isColor && value.hex) {
                                optionsDiv.innerHTML += `
                                    <div class="color-option ${value.variantId === activeVariant.id ? 'active' : ''}"
                                         style="background-color: ${value.hex}"
                                         data-variant-id="${value.variantId}"
                                         data-attr-type="${typeName}"
                                         onclick="selectVariant(${value.variantId}, '${value.value}', '${typeName}', this)">
                                    </div>
                                `;
                            } else {
                                optionsDiv.innerHTML += `
                                    <button type="button"
                                            class="variant-btn ${value.variantId === activeVariant.id ? 'active' : ''}"
                                            data-variant-id="${value.variantId}"
                                            data-attr-type="${typeName}"
                                            onclick="selectVariant(${value.variantId}, '${value.value}', '${typeName}', this)">
                                        ${value.value}
                                    </button>
                                `;
                            }
                        });

                        groupDiv.innerHTML = labelHtml;
                        groupDiv.appendChild(optionsDiv);
                        variantGroups.appendChild(groupDiv);
                    });

                    // Show modal
                    modal.show();
                })
                .catch(error => {
                    console.error('Error fetching product:', error);
                    showCustomAlert('Có lỗi xảy ra khi tải thông tin sản phẩm', 'error');
                });
        }

        function changeMainImage(thumbnail) {
            const mainImage = document.querySelector('.quick-view-image');
            mainImage.src = thumbnail.src;
            
            // Update active state
            document.querySelectorAll('.thumbnail').forEach(thumb => thumb.classList.remove('active'));
            thumbnail.classList.add('active');
        }

        function selectVariant(variantId, value, typeName, element) {
            // Remove active class from all options of this type
            document.querySelectorAll(`[data-attr-type="${typeName}"]`).forEach(opt => {
                opt.classList.remove('active');
            });
            
            // Add active class to selected option
            element.classList.add('active');
            
            // Fetch variant details
            fetch(`/api/variants/${variantId}`)
                .then(response => response.json())
                .then(variant => {
                    if (!variant || variant.deleted_at) {
                        showCustomAlert('Phiên bản sản phẩm không khả dụng', 'error');
                        return;
                    }

                    // Update price
                    const priceElement = document.querySelector('.quick-view-price');
                    if (variant.discount_price) {
                        priceElement.innerHTML = `
                            <span class="text-decoration-line-through text-muted">${variant.selling_price.toLocaleString('vi-VN')}đ</span>
                            <span class="text-danger ms-2">${variant.discount_price.toLocaleString('vi-VN')}đ</span>
                        `;
                    } else {
                        priceElement.textContent = `${variant.selling_price.toLocaleString('vi-VN')}đ`;
                    }

                    // Update images
                    const images = JSON.parse(variant.images || '[]');
                    if (images.length > 0) {
                        const mainImage = document.querySelector('.quick-view-image');
                        mainImage.src = images[0].startsWith('http') ? images[0] : `/${images[0]}`;
                        
                        // Update thumbnails
                        const thumbnailsContainer = document.querySelector('.thumbnail-images .row');
                        thumbnailsContainer.innerHTML = '';
                        images.forEach((img, index) => {
                            const col = document.createElement('div');
                            col.className = 'col-3';
                            col.innerHTML = `
                                <img src="${img.startsWith('http') ? img : `/${img}`}" 
                                     class="img-fluid thumbnail ${index === 0 ? 'active' : ''}" 
                                     alt="Thumbnail ${index + 1}"
                                     onclick="changeMainImage(this)">
                            `;
                            thumbnailsContainer.appendChild(col);
                        });
                    }
                })
                .catch(error => {
                    console.error('Error fetching variant:', error);
                    showCustomAlert('Có lỗi xảy ra khi tải thông tin phiên bản sản phẩm', 'error');
                });
        }

        function buyNow() {
            const variantId = document.querySelector('.variant-btn.active, .color-option.active')?.dataset.variantId;
            const quantity = document.getElementById('quickViewQuantity').value;
            
            if (!variantId) {
                showCustomAlert('Vui lòng chọn đầy đủ thuộc tính sản phẩm', 'error');
                return;
            }
            
            window.location.href = `/checkout?variant_id=${variantId}&quantity=${quantity}`;
        }

        function addToCart() {
            const variantId = document.querySelector('.variant-btn.active, .color-option.active')?.dataset.variantId;
            const quantity = document.getElementById('quickViewQuantity').value;
            
            if (!variantId) {
                showCustomAlert('Vui lòng chọn đầy đủ thuộc tính sản phẩm', 'error');
                return;
            }
            
            fetch('/cart/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    variant_id: variantId,
                    quantity: quantity
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showCustomAlert('Đã thêm sản phẩm vào giỏ hàng', 'success');
                    // Update cart count if needed
                    if (data.cart_count) {
                        document.querySelector('.cart-count').textContent = data.cart_count;
                    }
                } else {
                    showCustomAlert(data.message || 'Có lỗi xảy ra khi thêm vào giỏ hàng', 'error');
                }
            })
            .catch(error => {
                console.error('Error adding to cart:', error);
                showCustomAlert('Có lỗi xảy ra khi thêm vào giỏ hàng', 'error');
            });
        }

        // Initialize quantity controls
        document.addEventListener('DOMContentLoaded', function() {
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
        });
    </script>

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
                                    <div class="row"></div>
                                        </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3 class="quick-view-title"></h3>
                            <div class="mb-2"><strong>Category:</strong> <span class="quick-view-category"></span></div>
                            <div class="mb-2"><strong>Warranty:</strong> <span class="quick-view-warranty"></span></div>
                            <div class="quick-view-price mb-4"></div>
                            <div id="quickViewVariantGroups"></div>
                            <div class="quantity-selector mb-4">
                                <label class="form-label">Số lượng:</label>
                                <div class="quantity-control">
                                    <button class="quantity-btn minus">-</button>
                                    <input type="number" id="quickViewQuantity" class="form-control" value="1" min="1" readonly>
                                    <button class="quantity-btn plus">+</button>
                                </div>
                            </div>
                            <div class="product-actions">
                                <button class="btn btn-primary" onclick="buyNow()">
                                    <i class="fas fa-bolt me-2"></i>Mua ngay
                                </button>
                                <button class="btn btn-outline-primary" onclick="addToCart()">
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
        document.getElementById('quickViewModal').addEventListener('hidden.bs.modal', function () {
            document.body.classList.remove('modal-open');
            document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
        });
    </script>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 800,
            once: false,
        });
    </script>

    <script>
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
                        console.log('View incremented');
                    }
                });
        }
    </script>

@section('scripts')
    <script>
        $(document).ready(function() {
            $('.product-slider, .latest-products-slider').slick({
                dots: true,
                infinite: true,
                speed: 300,
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3000,
                arrows: true,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });
        });
    </script>
@endsection


<style>
    .product-slider {
        margin: 0 -15px;
    }

    .product-row {
        display: flex !important;
        flex-wrap: nowrap;
        /* Giữ cho các phần tử không xuống dòng */
        justify-content: space-between;
        white-space: nowrap;
        /* Ngăn không cho các phần tử con xuống dòng */
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
        width: 95%;
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
        /* width: 40px;
        height: 40px;
        background: #fff;
        border-radius: 50%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
    }

    /* button bên trái */
    .product-slider .slick-prev {
        left: 20px;
    }

    .product-slider .slick-next {
        right: -20px;
    }

    /* button bên phải */
    .product-slider .slick-prev:before,
    .product-slider .slick-next:before {
        /* font-size: 20px;
        color: #333; */
        right: 10px;
        top: -35px;
    }

    .product-slider .slick-dots {
        bottom: -30px;
    }

    .product-slider .slick-dots li button:before {
        font-size: 12px;
    }

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

            .col-md-4 {
                width: 100%;
                max-width: 300px;
            }
        }

        .icon-heart {
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .icon-heart i {
            color: #000000;
            transition: all 0.3s ease;
        }

        .icon-heart.in-wishlist i {
            color: #ff4d4d;
        }

        .icon-heart:hover i {
            transform: scale(1.1);
        }

        .icon-heart:not(.in-wishlist):hover i {
            color: #ffffff;
        }
    </style>

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

{{-- @include('client.partials.quick-view-modal') --}}
@endsection
