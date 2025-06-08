@extends('client.layouts.app')

@section('content')
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Shop Banner -->
    <div class="shop-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 data-aos="fade-up">Shop</h1>
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" data-aos="fade-up" data-aos-delay="200">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Shop</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Shop Section -->
    <div class="untree_co-section product-section">
        <div class="container">
            <!-- Flash Sale Section -->
            @if ($flashSaleItems->count() && $flashSaleTimeRange)
                @php
                    $startTime = $flashSaleTimeRange['start_time'];
                    $endTime = $flashSaleTimeRange['end_time'];
                @endphp

                <!-- Flash Sale Section -->
                {{-- <div class="row mb-5" data-aos="fade-up" style="background: rgb(211, 211, 211);border-radius: 10px">
                    <div class="col-12">
                        <div class="section-header d-flex justify-content-between align-items-center flex-wrap">
                            <div class="flash-sale-image col-md-4 col-sm-12 mb-2">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/icon-fs.png" alt="Flash Sale"
                                    class="img-fluid">
                            </div>

                            <div class="countdown-timer col-md-2 col-sm-6 mb-2">
                                <h5 class="time">KẾT THÚC TRONG:</h5>
                                <h3 id="countdown">00:00:00</h3>
                            </div>

                            <div class="ongoing-time col-md-3 col-sm-6 mb-2">
                                <h5 class="time">Đang diễn ra:</h5>
                                <h4 style="white-space: nowrap;">
                                    {{ $startTime->format('d/m/Y H:i') }} - {{ $endTime->format('d/m/Y H:i') }}
                                </h4>
                            </div> --}}
                <div class="row mb-5" data-aos="fade-up" style="background: rgb(211, 211, 211);border-radius: 10px">
                    <div class="col-12">
                        <div class="row section-header align-items-center">

                            <div class="flash-sale-image col-md-4 col-sm-12 mb-2">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/icon-fs.png" alt="Flash Sale"
                                    class="img-fluid">
                            </div>

                            <div class="countdown-timer col-md-3 col-sm-6 mb-2">
                                <h5 class="time">KẾT THÚC TRONG:</h5>
                                <h4 id="countdown" style="white-space: nowrap;">00:00:00</h3>
                            </div>

                            <div class="ongoing-time col-md-3 col-sm-6 mb-2">
                                <h5 class="time">ĐANG DIỄN RA:</h5>
                                <h4 style="white-space: nowrap;">
                                    {{ $startTime->format('d/m/Y H:i') }} - {{ $endTime->format('d/m/Y H:i') }}
                                </h4>
                            </div>


                            {{-- <div class="extra-info col-md-2 col-sm-6 mb-2">
                                <h5 class="time">Ngày:</h5>
                                <h4>{{ $startTime->format('d/m/Y') }}</h4>
                            </div> --}}
                        </div>

                        <div class="col-12">
                            <div class="product-slider flash-sale-slider">
                                @foreach ($flashSaleItems as $item)
                                    <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                        <a href="{{ route('product.detail', ['slug' => $item->product_slug]) }}">
                                            <div class="product-thumbnail">
                                                <img src="{{ asset($item->first_image) }}" class="img-fluid"
                                                    alt="{{ $item->variant_name }}">
                                                <div class="discount-badge">
                                                    @if ($item->discount_type == 'percent')
                                                        -{{ $item->discount }}%
                                                    @else
                                                        -{{ number_format($item->discount, 0) }}đ
                                                    @endif
                                                </div>
                                            </div>
                                            <h3 class="product-title">{{ $item->variant_name }}</h3>
                                            <h6>Count: {{ $item->count }}</h5>
                                            <div class="product-price-and-rating">
                                                <div class="price-wrapper">
                                                    @php
                                                        $original = $item->selling_price;
                                                        $discount =
                                                            $item->discount_type === 'percent'
                                                                ? $original * (1 - $item->discount / 100)
                                                                : $original - $item->discount;
                                                    @endphp
                                                    <strong
                                                        class="product-price">{{ number_format($discount, 0) }}$</strong>
                                                    <span
                                                        class="old-price"><del>{{ number_format($original, 0) }}$</del></span>
                                                </div>
                                                <div class="product-rating">
                                                    <i class="fas fa-star"></i><i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i><i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i><span>(4.9)</span>
                                                </div>
                                            </div>
                                            <div class="product-icons">
                                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                            </div>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Countdown Script -->
                <script>
                    const endTime = new Date("{{ $endTime->toIso8601String() }}").getTime();
                    const countdownElement = document.getElementById('countdown');

                    const countdownInterval = setInterval(() => {
                        const now = new Date().getTime();
                        const distance = endTime - now;

                        if (distance < 0) {
                            clearInterval(countdownInterval);
                            countdownElement.innerHTML = "Đã kết thúc";
                            return;
                        }

                        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                        countdownElement.innerHTML =
                            (days > 0 ? days + ' ngày ' : '') +
                            String(hours).padStart(2, '0') + ':' +
                            String(minutes).padStart(2, '0') + ':' +
                            String(seconds).padStart(2, '0');
                    }, 1000);
                </script>
            @endif


            {{-- để danh mục ở đây 6 cái nhé  --}}
            <div>
                <ul class="choose-cate d-flex justify-content-between">
                    <li class="box_category" data-aos="fade-up" data-aos-delay="100">
                        <a href="/iphone">
                            <div class="img-catesp cateiphone">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/desktop/IP_Desk.png" alt=""
                                    width="102" height="112">
                            </div>
                            <span>iPhone</span>
                        </a>
                    </li>
                    <li class="box_category" data-aos="fade-up" data-aos-delay="100">
                        <a href="/mac">
                            <div class="img-catesp catemac">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/desktop/Mac_Desk.png" alt=""
                                    width="150" height="97">
                            </div>
                            <span>Mac</span>
                        </a>
                    </li>
                    <li class="box_category" data-aos="fade-up" data-aos-delay="100">
                        <a href="/ipad">
                            <div class="img-catesp cateipad">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/desktop/Ipad_Desk.png" alt=""
                                    width="116" height="102">
                            </div>
                            <span>iPad</span>
                        </a>
                    </li>
                    <li class="box_category" data-aos="fade-up" data-aos-delay="100">
                        <a href="/apple-watch">
                            <div class="img-catesp catewatch">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/desktop/Watch_Desk.png" alt=""
                                    width="169" height="110">
                            </div>
                            <span>Watch</span>
                        </a>
                    </li>
                    <li class="box_category" data-aos="fade-up" data-aos-delay="100">
                        <a href="/am-thanh">
                            <div class="img-catesp cateisound">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/desktop/Speaker_Desk.png"
                                    alt="" width="169" height="124">
                            </div>
                            <span>Tai nghe, loa</span>
                        </a>
                    </li>
                    <li class="box_category" data-aos="fade-up" data-aos-delay="100">
                        <a href="/phu-kien">
                            <div class="img-catesp catephukien">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/desktop/Phukien_Desk.png"
                                    alt="" width="71" height="100">
                            </div>
                            <span>Phụ kiện</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Category Products -->
            @foreach ($categories as $category)
                @if ($category->products->count() > 0)
                    <div class="row mb-5" data-aos="fade-up">
                        <div class="col-12">
                            <h2 class="section-title text-center mb-3 mt-5">
                                <i class="fa-brands fa-apple"></i>{{ $category->name }}
                            </h2>
                        </div>
                        <div class="col-12">
                            @if ($category->products->count() >= 4)
                                <div class="product-slider category-slider">
                                    @foreach ($category->products as $product)
                                        <div class="product-item product-carousel" data-aos="fade-up"
                                            data-aos-delay="100">
                                            <a href="{{ route('product.detail', $product->slug) }}">
                                                <div class="product-thumbnail text-center">
                                                    @php
                                                        $defaultImage = asset('uploads/default/default.jpg');
                                                        $variantImage = null;
                                                        $defaultVariant = $product->variants->first();

                                                        if ($defaultVariant && $defaultVariant->images) {
                                                            $images = json_decode($defaultVariant->images, true);
                                                            if (!empty($images[0])) {
                                                                $variantImage = asset($images[0]);
                                                            }
                                                        }

                                                        if (!$variantImage) {
                                                            $otherVariant = $product->variants->skip(1)->first();
                                                            if ($otherVariant && $otherVariant->images) {
                                                                $images = json_decode($otherVariant->images, true);
                                                                if (!empty($images[0])) {
                                                                    $variantImage = asset($images[0]);
                                                                }
                                                            }
                                                        }
                                                    @endphp

                                                    <img src="{{ $variantImage ?? $defaultImage }}"
                                                        class="img-fluid mx-auto" alt="{{ $product->name }}"
                                                        style="max-height: 200px; object-fit: contain;">
                                                </div>
                                                <h3 class="product-title">{{ $product->name }}</h3>
                                                <div class="product-price-and-rating">
                                                    <div class="price-wrapper">
                                                        @if ($product->discount_price)
                                                            <strong
                                                                class="product-price">{{ number_format($product->discount_price) }}đ</strong>
                                                            <span
                                                                class="old-price"><del>{{ number_format($product->price) }}đ</del></span>
                                                        @else
                                                            <strong
                                                                class="product-price">{{ number_format($product->price) }}đ</strong>
                                                        @endif
                                                    </div>
                                                    <div class="product-rating">
                                                        @php
                                                            $rating = $product->reviews->avg('rating') ?? 0;
                                                            $fullStars = floor($rating);
                                                            $halfStar = $rating - $fullStars >= 0.5;
                                                        @endphp
                                                        @for ($i = 1; $i <= 5; $i++)
                                                            @if ($i <= $fullStars)
                                                                <i class="fas fa-star"></i>
                                                            @elseif($i == $fullStars + 1 && $halfStar)
                                                                <i class="fas fa-star-half-alt"></i>
                                                            @else
                                                                <i class="far fa-star"></i>
                                                            @endif
                                                        @endfor
                                                        <span>({{ number_format($product->views) }} lượt xem)</span>
                                                    </div>
                                                </div>
                                                <div class="product-icons">
                                                    <span class="icon-add-to-cart" data-product-id="{{ $product->id }}">
                                                        <i class="fas fa-cart-plus"></i>
                                                    </span>
                                                    <span class="icon-heart" data-product-id="{{ $product->id }}">
                                                        <i class="fas fa-heart"></i>
                                                    </span>
                                                    <span class="icon-quick-view" data-product-id="{{ $product->id }}">
                                                        <i class="fas fa-eye"></i>
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                    @endforeach
                                </div>
                            @else
                                <div class="row product-grid">
                                    @foreach ($category->products as $product)
                                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                                            <div class="product-item" data-aos="fade-up" data-aos-delay="100">
                                                <a href="{{ route('product.detail', $product->slug) }}">
                                                    <div class="product-thumbnail text-center">
                                                        @php
                                                            $defaultImage = asset('uploads/default/default.jpg');
                                                            $variantImage = null;
                                                            $defaultVariant = $product->variants->first();

                                                            if ($defaultVariant && $defaultVariant->images) {
                                                                $images = json_decode($defaultVariant->images, true);
                                                                if (!empty($images[0])) {
                                                                    $variantImage = asset($images[0]);
                                                                }
                                                            }

                                                            if (!$variantImage) {
                                                                $otherVariant = $product->variants->skip(1)->first();
                                                                if ($otherVariant && $otherVariant->images) {
                                                                    $images = json_decode($otherVariant->images, true);
                                                                    if (!empty($images[0])) {
                                                                        $variantImage = asset($images[0]);
                                                                    }
                                                                }
                                                            }
                                                        @endphp

                                                        <img src="{{ $variantImage ?? $defaultImage }}"
                                                            class="img-fluid mx-auto" alt="{{ $product->name }}"
                                                            style="max-height: 200px; object-fit: contain;">
                                                    </div>
                                                    <h3 class="product-title">{{ $product->name }}</h3>
                                                    <div class="product-price-and-rating">
                                                        <div class="price-wrapper">
                                                            @if ($product->discount_price)
                                                                <strong
                                                                    class="product-price">{{ number_format($product->discount_price) }}đ</strong>
                                                                <span
                                                                    class="old-price"><del>{{ number_format($product->price) }}đ</del></span>
                                                            @else
                                                                <strong
                                                                    class="product-price">{{ number_format($product->price) }}đ</strong>
                                                            @endif
                                                        </div>
                                                        <div class="product-rating">
                                                            @php
                                                                $rating = $product->reviews->avg('rating') ?? 0;
                                                                $fullStars = floor($rating);
                                                                $halfStar = $rating - $fullStars >= 0.5;
                                                            @endphp
                                                            @for ($i = 1; $i <= 5; $i++)
                                                                @if ($i <= $fullStars)
                                                                    <i class="fas fa-star"></i>
                                                                @elseif($i == $fullStars + 1 && $halfStar)
                                                                    <i class="fas fa-star-half-alt"></i>
                                                                @else
                                                                    <i class="far fa-star"></i>
                                                                @endif
                                                            @endfor
                                                            <span>({{ number_format($product->views) }} lượt xem)</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-icons">
                                                        <span class="icon-add-to-cart"
                                                            data-product-id="{{ $product->id }}">
                                                            <i class="fas fa-cart-plus"></i>
                                                        </span>
                                                        <span class="icon-heart" data-product-id="{{ $product->id }}">
                                                            <i class="fas fa-heart"></i>
                                                        </span>
                                                        <span class="icon-quick-view"
                                                            data-product-id="{{ $product->id }}">
                                                            <i class="fas fa-eye"></i>
                                                        </span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    </div>
                @endif
            @endforeach
        </div>
    </div>

    <!-- Quick View Modal -->
    <div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel"
        aria-hidden="true">
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
                                <div class="main-image mb-4 position-relative">
                                    <button id="quickViewPrevImageBtn" class="image-nav-btn" style="display:none;"><i
                                            class="fas fa-chevron-left"></i></button>
                                    <img src="" class="img-fluid quick-view-image" id="quickViewMainImage"
                                        alt="Product Image">
                                    <button id="quickViewNextImageBtn" class="image-nav-btn" style="display:none;"><i
                                            class="fas fa-chevron-right"></i></button>
                                </div>
                                <div class="thumbnail-slider position-relative">
                                    <button id="quickViewThumbPrevBtn" class="image-nav-btn"
                                        style="left:0;top:50%;transform:translateY(-50%);"
                                        onclick="quickViewScrollThumbnails(-1)"><i
                                            class="fas fa-chevron-left"></i></button>
                                    <div class="row flex-nowrap overflow-auto" id="quickViewThumbnailsRow"
                                        style="scroll-behavior:smooth; margin:0 48px;"></div>
                                    <button id="quickViewThumbNextBtn" class="image-nav-btn"
                                        style="right:0;top:50%;transform:translateY(-50%);"
                                        onclick="quickViewScrollThumbnails(1)"><i
                                            class="fas fa-chevron-right"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3 class="quick-view-title product-title"></h3>
                            <div class="product-price mb-4">
                                <span class="current-price quick-view-price"></span>
                            </div>
                            <div class="product-meta">
                                <div class="product-category mb-3">
                                    <strong>Category:</strong> <span class="quick-view-category"></span>
                                </div>
                                <div class="product-warranty mb-3">
                                    <strong>Warranty:</strong> <span class="quick-view-warranty"></span>
                                </div>
                            </div>
                            <div id="quickViewVariantGroups" class="product-variants">
                                <!-- Dynamic variant groups will be inserted here -->
                            </div>
                            <div class="quantity-selector mb-4">
                                <label class="form-label">Quantity:</label>
                                <div class="quantity-control">
                                    <button class="quantity-btn minus">-</button>
                                    <input type="number" id="quickViewQuantity" class="form-control" value="1"
                                        min="1" readonly>
                                    <button class="quantity-btn plus">+</button>
                                </div>
                            </div>
                            <div class="product-actions mb-4">
                                <button class="btn btn-primary buy-now-btn" id="quickViewBuyNowBtn">
                                    <i class="fas fa-bolt me-2"></i>Buy Now
                                </button>
                                <button class="btn btn-outline-primary add-to-cart-btn" id="quickViewAddToCartBtn">
                                    <i class="fas fa-cart-plus me-2"></i>Add to Cart
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize flash sale slider
            $('.flash-sale-slider').slick({
                slidesToShow: 4,
                slidesToScroll: 4,
                autoplay: true,
                autoplaySpeed: 3000,
                arrows: true,
                dots: false,
                variableWidth: false,
                infinite: false,
                responsive: [{
                        breakpoint: 1200,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });

            // Initialize blog slider
            $('.blog-slider').slick({
                dots: false,
                infinite: true,
                speed: 300,
                slidesToShow: 3,
                slidesToScroll: 3,
                arrows: true,
                variableWidth: false,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
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

            // Initialize all product category sliders
            $('.category-slider').each(function() {
                var $slider = $(this);
                var slideCount = $slider.find('.product-item').length;

                $slider.slick({
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    autoplay: true,
                    autoplaySpeed: 3000,
                    arrows: true,
                    dots: false,
                    variableWidth: false,
                    infinite: false,
                    responsive: [{
                            breakpoint: 1200,
                            settings: {
                                slidesToShow: 3,
                                slidesToScroll: 3
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 2,
                                slidesToScroll: 2
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1,
                                slidesToScroll: 1
                            }
                        }
                    ]
                });

                // Thêm class để xử lý CSS cho slider có ít sản phẩm
                if (slideCount < 4) {
                    $slider.addClass('few-items');
                }
            });

            // Countdown Timer for Flash Sale
            function updateCountdown() {
                // Add your countdown logic here
            }
            setInterval(updateCountdown, 1000);

            // Quick View Functionality
            $('.icon-quick-view').on('click', async function(e) {
                e.preventDefault();
                e.stopPropagation();

                const productId = $(this).data('product-id');

                try {
                    const response = await fetch(`/api/products/${productId}`);
                    const product = await response.json();

                    currentQuickViewProduct = product;

                    // Reset previous data
                    quickViewVariantData = {};
                    quickViewAttributeToVariant = {};
                    quickViewSelectedVariants = {};
                    quickViewSelectedValues = {};
                    quickViewRequiredTypes = [];

                    // Update modal content
                    $('#quickViewModalLabel').text(product.name);
                    $('.quick-view-title').text(product.name);
                    $('.quick-view-category').text(product.category ? product.category.name : 'N/A');
                    $('.quick-view-warranty').text(`${product.warranty_months || 'N/A'} months`);

                    // Setup variant data
                    product.variants.forEach(variant => {
                        quickViewVariantData[variant.id] = {
                            images: JSON.parse(variant.images || '[]'),
                            price: variant.selling_price
                        };

                        // Create attribute mapping
                        const attrValues = variant.combinations.map(comb => {
                            const value = comb.attribute_value.value;
                            return Array.isArray(value) ? value[0] : (typeof value ===
                                'string' ? value : value[0]);
                        });
                        quickViewAttributeToVariant[attrValues.join('|')] = variant.id;
                    });

                    // Generate variant groups HTML
                    const variantGroups = document.getElementById('quickViewVariantGroups');
                    variantGroups.innerHTML = '';

                    // Group variants by attribute type
                    const attributeGroups = {};
                    product.variants.forEach(variant => {
                        variant.combinations.forEach(comb => {
                            const typeName = comb.attribute_value.attribute_type.name;
                            if (!attributeGroups[typeName]) {
                                attributeGroups[typeName] = new Set();
                                quickViewRequiredTypes.push(typeName);
                            }
                            attributeGroups[typeName].add(JSON.stringify({
                                value: comb.attribute_value.value,
                                hex: comb.attribute_value.hex,
                                variantId: variant.id
                            }));
                        });
                    });

                    // Create HTML for each attribute group
                    Object.entries(attributeGroups).forEach(([typeName, valuesSet]) => {
                        const values = Array.from(valuesSet).map(v => JSON.parse(v));
                        const hasHex = values.some(v => v.hex && v.hex[0]);

                        const groupDiv = document.createElement('div');
                        groupDiv.className = 'variant-group mb-4';

                        const labelHtml = `
                            <label class="form-label variant-label">
                                ${typeName}
                                ${hasHex ? `<span id="quickview-selected-${typeName}-value" class="selected-value"></span>` : ''}
                            </label>
                        `;

                        const optionsDiv = document.createElement('div');
                        optionsDiv.className = 'variant-options';

                        if (hasHex) {
                            values.forEach(item => {
                                const value = Array.isArray(item.value) ? item.value[
                                    0] : item.value;
                                const hex = Array.isArray(item.hex) ? item.hex[0] : item
                                    .hex;

                                optionsDiv.innerHTML += `
                                    <div class="color-option"
                                        title="${value}"
                                        data-color="${value}"
                                        data-variant-id="${item.variantId}"
                                        data-attr-type="${typeName}"
                                        onclick="quickViewSelectVariant(${item.variantId}, '${value}', '${typeName}', this)"
                                        style="background-color: ${hex || '#f8f9fa'};">
                                    </div>
                                `;
                            });
                        } else {
                            values.forEach(item => {
                                const value = Array.isArray(item.value) ? item.value[
                                    0] : item.value;
                                optionsDiv.innerHTML += `
                                    <button type="button"
                                        class="variant-btn"
                                        data-variant-id="${item.variantId}"
                                        data-attr-type="${typeName}"
                                        onclick="quickViewSelectVariant(${item.variantId}, '${value}', '${typeName}', this)">
                                        ${value}
                                    </button>
                                `;
                            });
                        }

                        groupDiv.innerHTML = labelHtml;
                        groupDiv.appendChild(optionsDiv);
                        variantGroups.appendChild(groupDiv);
                    });

                    // Set initial variant
                    const defaultVariant = product.variants.find(v => v.is_default) || product.variants[
                        0];
                    if (defaultVariant) {
                        quickViewSelectAllAttributesOfVariant(defaultVariant.id);
                    }

                    // Show modal
                    $('#quickViewModal').modal('show');

                } catch (error) {
                    console.error('Error fetching product details:', error);
                }
            });

            // Quick View quantity controls
            document.querySelector('#quickViewModal .quantity-btn.minus').addEventListener('click', function() {
                const input = document.getElementById('quickViewQuantity');
                const currentValue = parseInt(input.value);
                if (currentValue > 1) {
                    input.value = currentValue - 1;
                }
            });

            document.querySelector('#quickViewModal .quantity-btn.plus').addEventListener('click', function() {
                const input = document.getElementById('quickViewQuantity');
                const currentValue = parseInt(input.value);
                input.value = currentValue + 1;
            });

            // Quick View action buttons
            document.getElementById('quickViewAddToCartBtn').addEventListener('click', function() {
                const variantId = getQuickViewSelectedVariantId();
                if (!variantId) {
                    alert('Vui lòng chọn đầy đủ thuộc tính sản phẩm trước khi thêm vào giỏ hàng!');
                    return;
                }
                // Add to cart logic here
            });

            document.getElementById('quickViewBuyNowBtn').addEventListener('click', function() {
                const variantId = getQuickViewSelectedVariantId();
                const quantity = parseInt(document.getElementById('quickViewQuantity').value) || 1;
                const mainImage = document.getElementById('quickViewMainImage').src;

                if (!variantId) {
                    alert('Vui lòng chọn đầy đủ thuộc tính sản phẩm trước khi đặt hàng!');
                    return;
                }
                window.location.href = '/checkout?variant_id=' + variantId + '&quantity=' + quantity +
                    '&image=' + encodeURIComponent(mainImage);
            });

            // Image navigation buttons
            document.getElementById('quickViewPrevImageBtn').addEventListener('click', quickViewShowPrevImage);
            document.getElementById('quickViewNextImageBtn').addEventListener('click', quickViewShowNextImage);
        });

        let quickViewCurrentImageIndex = 0;
        let quickViewCurrentImages = [];
        let quickViewVariantData = {};
        let quickViewAttributeToVariant = {};
        let quickViewSelectedVariants = {};
        let quickViewSelectedValues = {};
        let quickViewRequiredTypes = [];
        let currentQuickViewProduct = null;

        function updateQuickViewMainImageByIndex(idx) {
            if (quickViewCurrentImages.length > 0) {
                document.getElementById('quickViewMainImage').src = quickViewCurrentImages[idx];
                quickViewCurrentImageIndex = idx;
                updateQuickViewImageNavButtons();
                // Highlight thumbnail
                document.querySelectorAll('#quickViewThumbnailsRow img.thumbnail').forEach((el, i) => {
                    if (i === idx) el.classList.add('active');
                    else el.classList.remove('active');
                });
            }
        }

        function updateQuickViewImageNavButtons() {
            document.getElementById('quickViewPrevImageBtn').style.display =
                (quickViewCurrentImages.length > 1 && quickViewCurrentImageIndex > 0) ? '' : 'none';
            document.getElementById('quickViewNextImageBtn').style.display =
                (quickViewCurrentImages.length > 1 && quickViewCurrentImageIndex < quickViewCurrentImages.length - 1) ? '' :
                'none';
        }

        function quickViewShowPrevImage() {
            if (quickViewCurrentImages.length > 1 && quickViewCurrentImageIndex > 0) {
                updateQuickViewMainImageByIndex(quickViewCurrentImageIndex - 1);
            }
        }

        function quickViewShowNextImage() {
            if (quickViewCurrentImages.length > 1 && quickViewCurrentImageIndex < quickViewCurrentImages.length - 1) {
                updateQuickViewMainImageByIndex(quickViewCurrentImageIndex + 1);
            }
        }

        function updateQuickViewThumbnails(images) {
            const container = document.getElementById('quickViewThumbnailsRow');
            container.innerHTML = '';
            quickViewCurrentImages = images;
            quickViewCurrentImageIndex = 0;
            images.forEach((img, idx) => {
                const div = document.createElement('div');
                div.className = 'col-3';
                div.innerHTML =
                    `<img src="${img}" class="img-fluid thumbnail${idx===0?' active':''}" alt="Thumbnail" onclick="quickViewChangeMainImageByIndex(${idx})">`;
                container.appendChild(div);
            });
            updateQuickViewMainImageByIndex(0);
        }

        function quickViewChangeMainImageByIndex(idx) {
            updateQuickViewMainImageByIndex(idx);
        }

        function quickViewScrollThumbnails(direction) {
            const row = document.getElementById('quickViewThumbnailsRow');
            const scrollAmount = 120;
            row.scrollBy({
                left: direction * scrollAmount,
                behavior: 'smooth'
            });
        }

        function quickViewSelectAllAttributesOfVariant(variantId) {
            if (!currentQuickViewProduct) return;

            const selectedVariant = currentQuickViewProduct.variants.find(v => v.id === variantId);
            if (selectedVariant) {
                document.querySelectorAll('#quickViewModal .color-option, #quickViewModal .variant-btn')
                    .forEach(el => el.classList.remove('active'));

                selectedVariant.combinations.forEach(comb => {
                    const typeName = comb.attribute_value.attribute_type.name.trim();
                    const matchedType = quickViewRequiredTypes.find(t => t.toLowerCase() === typeName
                    .toLowerCase()) || typeName;
                    let value = comb.attribute_value.value;
                    if (typeof value === 'string') {
                        try {
                            value = JSON.parse(value);
                        } catch {
                            value = [value];
                        }
                    }
                    value = Array.isArray(value) ? value[0] : value;

                    quickViewSelectedValues[matchedType] = value;
                    quickViewSelectedVariants[matchedType] = variantId;

                    document.querySelectorAll('#quickViewModal [data-attr-type="' + typeName + '"]').forEach(el => {
                        let elValue = el.getAttribute('data-color') || el.textContent.trim();
                        if (elValue == value) {
                            el.classList.add('active');
                        }
                    });

                    const labelSpan = document.getElementById('quickview-selected-' + typeName + '-value');
                    if (labelSpan) labelSpan.textContent = value;
                });

                if (quickViewVariantData[variantId]) {
                    if (quickViewVariantData[variantId].images.length > 0) {
                        const baseUrl = window.location.origin + '/';
                        const images = quickViewVariantData[variantId].images.map(img => baseUrl + img);
                        updateQuickViewThumbnails(images);
                    }
                    document.querySelector('#quickViewModal .quick-view-price').textContent =
                        quickViewVariantData[variantId].price.toLocaleString('vi-VN') + ' VNĐ';
                }
            }
        }

        function quickViewSelectVariant(variantId, value, typeName, el) {
            if (el.classList.contains('color-option')) {
                quickViewSelectAllAttributesOfVariant(variantId);
                return;
            }

            document.querySelectorAll('#quickViewModal [data-attr-type="' + typeName + '"]')
                .forEach(opt => opt.classList.remove('active'));
            el.classList.add('active');

            const labelSpan = document.getElementById('quickview-selected-' + typeName + '-value');
            if (labelSpan) labelSpan.textContent = value;

            const matchedType = quickViewRequiredTypes.find(t => t.toLowerCase() === typeName.toLowerCase()) || typeName;
            quickViewSelectedVariants[matchedType] = variantId;
            quickViewSelectedValues[matchedType] = value;

            let key = quickViewRequiredTypes.map(type => quickViewSelectedValues[type] || '').join('|');
            let matchedVariantId = quickViewAttributeToVariant[key];

            if (matchedVariantId && quickViewVariantData[matchedVariantId]) {
                if (quickViewVariantData[matchedVariantId].images.length > 0) {
                    const baseUrl = window.location.origin + '/';
                    const images = quickViewVariantData[matchedVariantId].images.map(img => baseUrl + img);
                    updateQuickViewThumbnails(images);
                }
                document.querySelector('#quickViewModal .quick-view-price').textContent =
                    quickViewVariantData[matchedVariantId].price.toLocaleString('vi-VN') + ' VNĐ';
            }
        }

        function getQuickViewSelectedVariantId() {
            let key = quickViewRequiredTypes.map(type => quickViewSelectedValues[type] || '').join('|');
            return quickViewAttributeToVariant[key] || null;
        }
    </script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1700,
            once: false,
        });
    </script>

    <style>
        /* CSS để xử lý hiển thị cho slider có ít sản phẩm */
        .category-slider.few-items {
            display: flex;
            justify-content: flex-start;
        }

        .category-slider.few-items .product-item {
            flex: 0 0 calc(25% - 20px);
            /* 25% cho 4 items trên 1 hàng, trừ đi margin */
            max-width: calc(25% - 20px);
            margin: 0 10px;
        }

        .category-slider .product-item {
            margin: 0 10px;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .category-slider.few-items .product-item {
                flex: 0 0 calc(33.333% - 20px);
                max-width: calc(33.333% - 20px);
            }
        }

        @media (max-width: 768px) {
            .category-slider.few-items .product-item {
                flex: 0 0 calc(50% - 20px);
                max-width: calc(50% - 20px);
            }
        }

        @media (max-width: 480px) {
            .category-slider.few-items .product-item {
                flex: 0 0 calc(100% - 20px);
                max-width: calc(100% - 20px);
            }
        }

        /* Quick View Modal Styles */
        #quickViewModal .modal-dialog {
            max-width: 1200px;
            margin: 30px auto;
        }

        #quickViewModal .modal-content {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        #quickViewModal .modal-body {
            padding: 30px;
        }

        #quickViewModal .product-title {
            font-size: 32px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }

        #quickViewModal .product-price {
            font-size: 28px;
            color: #333;
            font-weight: 600;
            margin-bottom: 25px;
        }

        #quickViewModal .product-meta {
            margin: 25px 0;
            padding: 20px 0;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }

        #quickViewModal .product-meta>div {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        #quickViewModal .product-meta strong {
            min-width: 120px;
            color: #666;
        }

        #quickViewModal .variant-label {
            font-size: 16px;
            color: #333;
            margin-bottom: 12px;
        }

        #quickViewModal .color-option {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid #ddd;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #quickViewModal .color-option:not([data-hex]) {
            border-radius: 4px;
            background-color: #f8f9fa;
            position: relative;
        }

        #quickViewModal .color-option:not([data-hex])::after {
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

        #quickViewModal .color-option.active {
            border-color: #007bff !important;
            box-shadow: 0 0 0 2px #007bff33;
            position: relative;
        }

        #quickViewModal .color-option:hover {
            transform: scale(1.08);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.18);
            z-index: 2;
        }

        #quickViewModal .variant-btn {
            padding: 8px 16px;
            margin-right: 10px;
            border: 1px solid #ddd;
            background: #fff;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        #quickViewModal .variant-btn.active {
            background: #fff !important;
            color: #000 !important;
            border: 2px solid #007bff !important;
            box-shadow: 0 0 0 2px #007bff33;
        }

        #quickViewModal .variant-btn:hover {
            border-color: #007bff;
        }

        #quickViewModal .quantity-control {
            display: flex;
            align-items: center;
            max-width: 150px;
        }

        #quickViewModal .quantity-btn {
            padding: 8px 12px;
            border: 1px solid #ddd;
            background: #fff;
            cursor: pointer;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #quickViewModal .quantity-control input {
            text-align: center;
            border-left: none;
            border-right: none;
            border-radius: 0;
            width: 70px;
            height: 40px;
        }

        #quickViewModal .product-gallery {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        #quickViewModal .main-image {
            position: relative;
            margin-bottom: 20px;
        }

        #quickViewModal .main-image img {
            width: 100%;
            height: auto;
            object-fit: contain;
            border-radius: 8px;
        }

        #quickViewModal .image-nav-btn {
            width: 48px;
            height: 48px;
            background: rgba(0,0,0,0.18);
            border: none;
            border-radius: 50%;
            color: #fff;
            font-size: 2rem;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 3;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.2s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.12);
        }

        #quickViewModal .image-nav-btn:hover {
            background: rgba(0,0,0,0.35);
        }

        #quickViewModal #quickViewPrevImageBtn { left: 12px; }
        #quickViewModal #quickViewNextImageBtn { right: 12px; }

        #quickViewModal .thumbnail-slider {
            position: relative;
            padding: 0 48px;
        }

        #quickViewModal #quickViewThumbPrevBtn,
        #quickViewModal #quickViewThumbNextBtn {
            width: 36px;
            height: 36px;
            background: rgba(0,0,0,0.18);
            border: none;
            border-radius: 50%;
            color: #fff;
            font-size: 1.3rem;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 2;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.2s;
        }

        #quickViewModal #quickViewThumbPrevBtn:hover,
        #quickViewModal #quickViewThumbNextBtn:hover {
            background: rgba(0,0,0,0.35);
        }

        #quickViewModal #quickViewThumbnailsRow {
            margin: 0 48px;
            overflow-x: auto;
            flex-wrap: nowrap !important;
            white-space: nowrap;
            scroll-behavior: smooth;
        }

        #quickViewModal #quickViewThumbnailsRow .col-3 {
            flex: 0 0 auto;
            width: 80px;
            max-width: 80px;
            padding: 0 4px;
        }

        #quickViewModal #quickViewThumbnailsRow img.thumbnail {
            border-radius: 8px;
            border: 2px solid transparent;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        #quickViewModal #quickViewThumbnailsRow img.thumbnail.active {
            border-color: #007bff;
        }

        #quickViewModal #quickViewThumbnailsRow img.thumbnail:hover {
            border-color: #000;
        }

        #quickViewModal .product-actions {
            display: flex;
            gap: 20px;
            margin-top: 30px;
        }

        #quickViewModal .buy-now-btn,
        #quickViewModal .add-to-cart-btn {
            flex: 1;
            padding: 12px 0;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.2s ease;
            text-transform: none;
        }

        #quickViewModal .buy-now-btn {
            background: #47624F;
            color: #fff;
            border: none;
        }

        #quickViewModal .buy-now-btn:hover {
            background: #3a4f40;
        }

        #quickViewModal .add-to-cart-btn {
            border: 1px solid #47624F;
            color: #47624F;
            background: transparent;
        }

        #quickViewModal .add-to-cart-btn:hover {
            background: rgba(71, 98, 79, 0.04);
        }

        #quickViewModal .variant-options {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        #quickViewModal .buy-now-btn i,
        #quickViewModal .add-to-cart-btn i {
            font-size: 18px;
        }

        #quickViewModal .main-image {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        #quickViewModal .main-image img {
            width: 100%;
            height: auto;
            object-fit: contain;
        }

        #quickViewModal .thumbnail-slider {
            padding: 0 40px;
            position: relative;
        }

        #quickViewModal .thumbnail-slider img {
            border: 2px solid transparent;
            border-radius: 8px;
            padding: 5px;
            cursor: pointer;
            transition: all 0.2s ease;
            max-width: 80px;
        }

        #quickViewModal .thumbnail-slider img.active {
            border-color: #0071e3;
        }

        #quickViewPrevImageBtn {
            left: 0;
        }

        #quickViewNextImageBtn {
            right: 0;
        }

        #quickViewModal .selected-value {
            margin-left: 10px;
            color: #666;
            font-weight: normal;
        }
    </style>
@endsection
