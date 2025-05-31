@extends('client.layouts.app')
@section('banner')
    <!-- Start Hero Section -->
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            {{-- <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true"
             aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button> --}}
            @foreach ($banners as $index => $banner)
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="{{ $index }}"
                    class="{{ $index == 0 ? 'active' : '' }}" aria-current="{{ $index == 0 ? 'true' : 'false' }}"
                    aria-label="Slide {{ $index + 1 }}"></button>
            @endforeach
        </div>
        <div class="carousel-inner">
            @foreach ($banners as $index => $banner)
                <div class="carousel-item {{ $index == 0 ? 'active' : '' }}"
                    style="background-image: url('{{ asset('storage/' . $banner->image) }}');">
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

    <!-- Start Why Choose Us Section -->
    <div class="why-choose-section" data-aos="fade-up">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    <h2 class="section-title">Why Choose Us</h2>
                    <p>Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit
                        imperdiet dolor tempor tristique.</p>

                    <div class="row my-5">
                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/truck.svg" alt="Image" class="imf-fluid">
                                </div>
                                <h3>Fast &amp; Free Shipping</h3>
                                <p>Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                    vulputate.</p>
                            </div>
                        </div>

                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="200">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/bag.svg" alt="Image" class="imf-fluid">
                                </div>
                                <h3>Easy to Shop</h3>
                                <p>Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                    vulputate.</p>
                            </div>
                        </div>

                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="300">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/support.svg" alt="Image" class="imf-fluid">
                                </div>
                                <h3>24/7 Support</h3>
                                <p>Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                    vulputate.</p>
                            </div>
                        </div>

                        <div class="col-6 col-md-6" data-aos="fade-up" data-aos-delay="400">
                            <div class="feature">
                                <div class="icon">
                                    <img src="images/return.svg" alt="Image" class="imf-fluid">
                                </div>
                                <h3>Hassle Free Returns</h3>
                                <p>Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                    vulputate.</p>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="img-wrap" data-aos="zoom-in">
                        <img src="images/why-choose-us-img.jpg" alt="Image" class="img-fluid">
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
                        @foreach ($mostViewedProducts as $productGroup)
                            <div class="product-row">
                                @foreach ($productGroup as $product)
                                    <div class="col-md-4 mb-4" data-aos="fade-up"
                                        data-aos-delay="{{ $loop->iteration * 100 }}">
                                        <a class="product-item" href="{{ route('product.detail', $product->slug) }}"
                                            onclick="incrementView('{{ $product->id }}')">
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

                                                <img src="{{ $variantImage ?? $defaultImage }}" class="img-fluid mx-auto"
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
                                                    <form action="{{ route('wishlist.add', $product->id) }}" method="POST"
                                                        style="display: none;" id="wishlist-form-{{ $product->id }}">
                                                        @csrf
                                                    </form>
                                                    <span class="icon-heart icon-add-to-wishlist"
                                                        onclick="event.preventDefault(); document.getElementById('wishlist-form-{{ $product->id }}').submit();"
                                                        title="Thêm vào yêu thích">
                                                        <i class="fas fa-heart"></i>
                                                    </span>
                                                @else
                                                    <a href="{{ route('login') }}" class="icon-heart icon-add-to-wishlist"
                                                        title="Đăng nhập để thêm vào yêu thích">
                                                        <i class="fas fa-heart"></i>
                                                    </a>
                                                @endauth

                                                <span class="icon-quick-view"
                                                    onclick="event.preventDefault(); showQuickView({{ $product->id }})"><i
                                                        class="fas fa-eye"></i></span>
                                            </div>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        @endforeach
                    </div>
                </div>
                <!-- End Products Column -->

                <!-- Start Text Column -->
                <div class="col-lg-4">
                    <div class="popular-content" data-aos="fade-left" data-aos-delay="400">
                        <h2 class="section-title">Most Popular Products</h2>
                        <p class="mb-4">Experience our most sought-after devices that have redefined innovation and
                            design. These products represent the perfect blend of cutting-edge technology and elegant
                            craftsmanship, setting new standards in the industry.</p>

                        <div class="popular-features">
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Revolutionary Technology</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Premium Build Quality</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Seamless Integration</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-check-circle"></i>
                                <span>Global Warranty Support</span>
                            </div>
                        </div>

                        <p><a href="{{ route('shop') }}" class="btn">View All Products</a></p>
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
                    <h2 class="mb-4 section-title">Designed for the future.</h2>
                    <p class="mb-4">Our devices are crafted with precision and care, using the finest materials and most
                        advanced technology. Every detail is meticulously considered to create products that are not just
                        tools, but works of art that enhance your digital lifestyle.</p>
                    <p><a href="{{ route('shop') }}" class="btn">Explore</a></p>
                </div>
                <!-- End Column 1 -->

                <!-- Start Latest Products Column -->
                <div class="col-lg-9">
                    <div class="product-slider">
                        <div class="product-row">
                            @foreach ($latestProducts as $product)
                                <div class="col-md-4 mb-4" data-aos="fade-up"
                                    data-aos-delay="{{ $loop->iteration * 100 }}">
                                    <a class="product-item" href="{{ route('product.detail', $product->slug) }}"
                                        onclick="incrementView('{{ $product->id }}')">
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

                                            <img src="{{ $variantImage ?? $defaultImage }}" class="img-fluid mx-auto"
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
                                            <div class="product-rating d-flex justify-content-center align-items-center">
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
                                                    <form action="{{ route('wishlist.add', $product->id) }}" method="POST"
                                                        style="display: none;" id="wishlist-form-{{ $product->id }}">
                                                        @csrf
                                                    </form>
                                                    <span class="icon-heart icon-add-to-wishlist"
                                                        onclick="event.preventDefault(); document.getElementById('wishlist-form-{{ $product->id }}').submit();"
                                                        title="Thêm vào yêu thích">
                                                        <i class="fas fa-heart"></i>
                                                    </span>
                                                @else
                                                    <a href="{{ route('login') }}" class="icon-heart icon-add-to-wishlist"
                                                        title="Đăng nhập để thêm vào yêu thích">
                                                        <i class="fas fa-heart"></i>
                                                    </a>
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
                </div>
                <!-- End Latest Products Column -->
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
                        <div class="grid grid-1"><img src="images/img-grid-1.jpg" alt="Untree.co"></div>
                        <div class="grid grid-2"><img src="images/img-grid-2.jpg" alt="Untree.co"></div>
                        <div class="grid grid-3"><img src="images/img-grid-3.jpg" alt="Untree.co"></div>
                    </div>
                </div>
                <div class="col-lg-5 ps-lg-5" data-aos="fade-left" data-aos-delay="100">
                    <h2 class="section-title mb-4">We Help You Make Modern Interior Design</h2>
                    <p>Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada.
                        Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque
                        habitant morbi tristique senectus et netus et malesuada</p>

                    <ul class="list-unstyled custom-list my-4">
                        <li>Donec vitae odio quis nisl dapibus malesuada</li>
                        <li>Donec vitae odio quis nisl dapibus malesuada</li>
                        <li>Donec vitae odio quis nisl dapibus malesuada</li>
                        <li>Donec vitae odio quis nisl dapibus malesuada</li>
                    </ul>
                    <p><a herf="#" class="btn">Explore</a></p>
                </div>
            </div>
        </div>
    </div>
    <!-- End We Help Section -->

    <!-- Start Trust Banner Section -->
    <div class="trust-banner-section" data-aos="fade-up">
        <div class="container">
            <div class="row">
                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="100">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="images/trust-1.svg" alt="Trust" class="img-fluid">
                        </div>
                        <h3>10+ Years Experience</h3>
                        <p>Over a decade of excellence in furniture design and manufacturing</p>
                    </div>
                </div>

                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="images/trust-2.svg" alt="Trust" class="img-fluid">
                        </div>
                        <h3>1000+ Happy Customers</h3>
                        <p>Trusted by thousands of satisfied customers worldwide</p>
                    </div>
                </div>

                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="images/trust-3.svg" alt="Trust" class="img-fluid">
                        </div>
                        <h3>Premium Quality</h3>
                        <p>Using only the finest materials and craftsmanship</p>
                    </div>
                </div>

                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="trust-item text-center">
                        <div class="icon">
                            <img src="images/trust-4.svg" alt="Trust" class="img-fluid">
                        </div>
                        <h3>5-Star Rated</h3>
                        <p>Consistently rated 5 stars by our valued customers</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                                                <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.&rdquo;</p>
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
                                                <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.&rdquo;</p>
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
                                                <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.&rdquo;</p>
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
                                                <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.&rdquo;</p>
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
                alert('Added to Cart: ' + item.querySelector('.product-title').textContent);
            });

            // item.querySelector('.icon-add-to-wishlist').addEventListener('click', (e) => {
            //     e.preventDefault();
            //     alert('Added to Wishlist: ' + item.querySelector('.product-title').textContent);
            // });


            item.querySelector('.icon-quick-view').addEventListener('click', (e) => {
                e.preventDefault();
                const modal = new bootstrap.Modal(document.getElementById('quickViewModal'));

                // Get product details
                const productImage = item.querySelector('.product-thumbnail').src;
                const productTitle = item.querySelector('.product-title').textContent;
                const productPrice = item.querySelector('.product-price').textContent;

                // Update modal content
                document.querySelector('.quick-view-image').src = productImage;
                document.querySelector('.quick-view-title').textContent = productTitle;
                document.querySelector('.quick-view-price').textContent = productPrice;

                // Update thumbnails
                const thumbnails = document.querySelectorAll('#quickViewModal .thumbnail');
                thumbnails[0].src = productImage;
                thumbnails[1].src = 'images/product-2.png';
                thumbnails[2].src = 'images/product-3.png';
                thumbnails[3].src = 'images/product-1.png';

                // Show modal
                modal.show();
            });
        });

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
                    `Added to cart:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`
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
                    `Proceeding to checkout:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`
                );
            });
        });
    </script>

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
                            <p class="quick-view-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                            <!-- Color Variants -->
                            <div class="color-variants mb-4">
                                <label class="form-label">Màu sắc:</label>
                                <div class="color-options">
                                    <div class="color-option active" data-color="purple"
                                        style="background-color: #8A2BE2;"></div>
                                    <div class="color-option" data-color="black" style="background-color: #000000;">
                                    </div>
                                    <div class="color-option" data-color="gold" style="background-color: #FFD700;">
                                    </div>
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

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 800, // values from 0 to 3000, with step 50ms
            once: false, // whether animation should happen only once - while scrolling down
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

        function showQuickView(productId) {
            incrementView(productId);
            // Your existing quick view logic here
        }

        // Initialize product slider
        $(document).ready(function() {
            $('.product-slider').slick({
                dots: true,
                infinite: true,
                speed: 300,
                slidesToShow: 1,
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

        // Initialize latest products slider
        $(document).ready(function() {
            $('.latest-products-slider').slick({
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
    </script>

    <style>
        .product-slider {
            margin: 0 -15px;
        }

        .product-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
            justify-content: space-between;
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

        /* Latest Products Slider Styles */
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
    </style>
@endsection
