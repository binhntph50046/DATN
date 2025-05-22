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
            <div class="row mb-5" data-aos="fade-up" style="background: rgb(211, 211, 211);border-radius: 10px">
                <div class="col-12">
                    <div class="section-header d-flex justify-content-between align-items-center">
                        <div class="flash-sale-image col-5">
                            <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/icon-fs.png" alt="Flash Sale"
                                class="img-fluid">
                        </div>
                        <div class="countdown-timer col-2 d-flex flex-wrap">
                            <h5 class="time">KẾT THÚC TRONG:</h5>
                            <h3>00:00:00</h3>
                        </div>
                        <div class="ongoing-time col-2">
                            <h5 class="time">Đang diễn ra:</h5>
                            <h4>08:00 - 23:59</h4>
                        </div>
                        <div class="extra-info col-2">
                            <h5 class="time">Ngày mai:</h5>
                            <h4>08:00 - 23:59</h4>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="product-slider flash-sale-slider">
                        <!-- Flash Sale Products -->
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/9118/328721/s16/apple-tv-4k-wifi-64gb-thumb-650x650.png"
                                            class="img-fluid" alt="Product">
                                        <div class="discount-badge">-20%</div>
                                    </div>
                                    <h3 class="product-title">Product Name</h3>
                                    <div class="product-price-and-rating">
                                        <div class="price-wrapper">
                                            <strong class="product-price">$50.00</strong>
                                            <span class="old-price">$60.00</span>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

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
            <!-- Category 1: Smartphones -->
            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5"><i class="fa-brands fa-apple"></i>iPhone</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="product-slider smartphones-slider">
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/42/329143/s16/iphone-16-pro-trang-650x650.png"
                                            class="img-fluid" alt="Product">
                                    </div>
                                    <h3 class="product-title">Smartphone Model</h3>
                                    <div class="product-price-and-rating">
                                        <strong class="product-price">$999.00</strong>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

            <!-- Category 2: Laptops -->
            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5"><i class="fa-brands fa-apple"></i>Mac</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="product-slider laptops-slider">
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/44/335362/s16/macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png"
                                            class="img-fluid" alt="Product">
                                    </div>
                                    <h3 class="product-title">Laptop Model</h3>
                                    <div class="product-price-and-rating">
                                        <strong class="product-price">$1299.00</strong>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

            <!-- Category 3: Tablets -->
            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5"><i class="fa-brands fa-apple"></i>iPad</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="product-slider tablets-slider">
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/522/335267/s16/ipad-air-m3-11-inch-wifi-starlight-thumb-650x650.png"
                                            class="img-fluid" alt="Product">
                                    </div>
                                    <h3 class="product-title">Tablet Model</h3>
                                    <div class="product-price-and-rating">
                                        <strong class="product-price">$499.00</strong>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

            <!-- Category 4: Accessories -->
            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5"><i class="fa-brands fa-apple"></i>WATCH</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="product-slider accessories-slider">
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7077/329153/s16/apple-watch-s10-den-tb-650x650.png"
                                            class="img-fluid" alt="Product">
                                    </div>
                                    <h3 class="product-title">Accessory Name</h3>
                                    <div class="product-price-and-rating">
                                        <strong class="product-price">$99.00</strong>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

            <!-- Category 5: Audio -->
            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5">Tai nghe, Loa</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="product-slider audio-slider">
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/54/315014/s16/tai-nghe-bluetooth-airpods-pro-2nd-gen-usb-c-charge-apple-thumb-12-1-650x650.png"
                                            class="img-fluid" alt="Product">
                                    </div>
                                    <h3 class="product-title">Audio Device</h3>
                                    <div class="product-price-and-rating">
                                        <strong class="product-price">$199.00</strong>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

            <!-- Category 6: Wearables -->
            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5">Phụ kiện</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="product-slider wearables-slider">
                        @for ($i = 0; $i < 8; $i++)
                            <div class="product-item product-carousel" data-aos="fade-up" data-aos-delay="100">
                                <a href="product-detail.html">
                                    <div class="product-thumbnail">
                                        <img src="https://cdn.tgdd.vn/Products/Images/58/315202/s16/cap-type-c-type-c-1m-apple-mqkj3-thumb-5-650x650.png"
                                            class="img-fluid" alt="Product">
                                    </div>
                                    <h3 class="product-title">Wearable Device</h3>
                                    <div class="product-price-and-rating">
                                        <strong class="product-price">$299.00</strong>
                                        <div class="product-rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>(4.9)</span>
                                        </div>
                                    </div>
                                    <div class="product-icons">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                        <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                    </div>
                                </a>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>

            <div class="row mb-5" data-aos="fade-up">
                <div class="col-12">
                    {{-- <div class="section-header d-flex justify-content-between align-items-center"> --}}
                    <h2 class="section-title text-center mb-3 mt-5">Blog</h2>
                    {{-- <a href="#" class="view-all">View All</a> --}}
                    {{-- </div> --}}
                </div>
                <div class="col-12">
                    <div class="blog-slider">
                        @for ($i = 0; $i < 6; $i++)
                            <div class="post-entry">
                                <a href="#" class="post-thumbnail"><img style="border-radius: 10px 10px 0 0;"
                                        src="images/post-3.jpg" alt="Image" class="img-fluid"></a>
                                <div class="post-content-entry"
                                    style="padding: 15px;background: #ffffff;border-radius: 0 0 10px 10px;">
                                    <h5><a href="#">Small Space Furniture Apartment Ideas</a></h5>
                                    <div class="meta pt-3">
                                        <span>by <a href="#">Kristin Watson</a></span> <span>on <a
                                                href="#">Dec
                                                12,
                                                2021</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>
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
                                <div class="main-image mb-4">
                                    <img src="" class="img-fluid quick-view-image" alt="Product Image">
                                </div>
                                <div class="thumbnail-images">
                                    <div class="row">
                                        <div class="col-3">
                                            <img src="images/product-1.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 1">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-2.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 2">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-3.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 3">
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
                                do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.</p>

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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize flash sale slider
            $('.flash-sale-slider').slick({
                slidesToShow: 6,
                slidesToScroll: 6,
                autoplay: true,
                autoplaySpeed: 3000,
                arrows: true,
                dots: false,
                responsive: [{
                        breakpoint: 1200,
                        settings: {
                            slidesToShow: 4
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1
                        }
                    }
                ]
            });

            $(document).ready(function() {
                $('.blog-slider').slick({
                    dots: true,
                    infinite: true,
                    speed: 300,
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    arrows: true,
                    dots: false,
                    responsive: [{
                            breakpoint: 1024,
                            settings: {
                                slidesToShow: 2,
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

            // Initialize other sliders
            $('.smartphones-slider, .laptops-slider, .tablets-slider, .accessories-slider, .audio-slider, .wearables-slider')
                .slick({
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    autoplay: true,
                    autoplaySpeed: 3000,
                    arrows: true,
                    dots: false,
                    responsive: [{
                            breakpoint: 1200,
                            settings: {
                                slidesToShow: 3
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 2
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1
                            }
                        }
                    ]
                });

            // Countdown Timer for Flash Sale
            function updateCountdown() {
                // Add your countdown logic here
            }
            setInterval(updateCountdown, 1000);

            // Quick View Functionality
            $('.icon-quick-view').on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();

                const productItem = $(this).closest('.product-item');
                const productTitle = productItem.find('.product-title').text();
                const productPrice = productItem.find('.product-price').text();
                const productImage = productItem.find('.product-thumbnail img').attr('src');

                // Update Quick View Modal content
                $('#quickViewModal .quick-view-title').text(productTitle);
                $('#quickViewModal .quick-view-price').text(productPrice);
                $('#quickViewModal .quick-view-image').attr('src', productImage);

                // Show modal
                $('#quickViewModal').modal('show');
            });

            // Color variant selection
            $('.color-option').on('click', function() {
                $('.color-option').removeClass('active');
                $(this).addClass('active');
            });

            // Storage option selection
            $('.storage-btn').on('click', function() {
                $('.storage-btn').removeClass('active');
                $(this).addClass('active');
            });

            // Quantity control
            $('.quantity-btn.minus').on('click', function() {
                const input = $('#quickViewQuantity');
                const currentValue = parseInt(input.val());
                if (currentValue > 1) {
                    input.val(currentValue - 1);
                }
            });

            $('.quantity-btn.plus').on('click', function() {
                const input = $('#quickViewQuantity');
                const currentValue = parseInt(input.val());
                input.val(currentValue + 1);
            });

            // Prevent quantity input from being edited directly
            $('#quickViewQuantity').on('keydown', function(e) {
                e.preventDefault();
            });
        });
    </script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1700,
            once: false,
        });
    </script>
@endsection
