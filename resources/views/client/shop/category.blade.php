@extends('client.layouts.app')
@section('title', $category->name . ' - Apple Store')

@section('content')
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        .product-grid .product-item {
            margin-bottom: 30px;
        }
        .product-item:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,.1);
            transform: translateY(-5px);
        }
        .product-thumbnail {
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
        .product-thumbnail img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }
        .product-title {
            font-size: 1rem;
            font-weight: 500;
            color: #333;
            height: 40px; /* 2 lines */
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .price-wrapper {
            min-height: 30px;
        }
        .product-price {
            font-size: 1.1rem;
            font-weight: 600;
            color: #d70018;
        }
        .old-price {
            font-size: 0.9rem;
            color: #777;
            margin-left: 8px;
        }
        .product-rating {
            margin-top: 5px;
            font-size: 0.8rem;
            color: #f5a623;
        }
        .product-rating span {
            color: #777;
            margin-left: 5px;
        }
        .pagination {
            justify-content: center;
        }
    </style>

    <!-- Shop Banner -->
    <div class="shop-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 data-aos="fade-up">{{ $category->name }}</h1>
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" data-aos="fade-up" data-aos-delay="200">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('shop') }}">Cửa hàng</a></li>
                                <li class="breadcrumb-item active" aria-current="page">{{ $category->name }}</li>
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
            <div class="row product-grid">
                @forelse($products as $product)
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div style="text-align: center;" class="product-item" data-aos="fade-up" data-aos-delay="{{ ($loop->index % 4) * 100 }}">
                            <a href="{{ route('product.detail', $product->slug) }}">
                                <div class="product-thumbnail">
                                     @php
                                        $defaultImage = asset('uploads/default/default.jpg');
                                        $variantImage = null;
                                        $firstVariant = $product->variants->first();
                                        if ($firstVariant) {
                                            $images = $firstVariant->images;
                                            if (is_string($images)) {
                                                $decoded = json_decode($images, true);
                                                if (is_array($decoded) && !empty($decoded[0])) {
                                                    $variantImage = asset($decoded[0]);
                                                }
                                            } elseif (is_array($images) && !empty($images[0])) {
                                                $variantImage = asset($images[0]);
                                            }
                                        }
                                    @endphp
                                    <img src="{{ $variantImage ?? $defaultImage }}" class="img-fluid" alt="{{ $product->name }}">
                                </div>
                                <h3 class="product-title">{{ $product->name }}</h3>
                                <div class="product-price-and-rating">
                                    <div class="price-wrapper">
                                        @if($product->variants->first() && $product->variants->first()->selling_price)
                                            <strong class="product-price">{{ number_format($product->variants->first()->selling_price, 0, ',', '.') }}đ</strong>
                                            {{-- You might want to add logic for original price if available --}}
                                        @else
                                            <strong class="product-price">Liên hệ</strong>
                                        @endif
                                    </div>
                                    <div class="product-rating">
                                        @php
                                            $rating = $product->reviews->avg('rating') ?? 0;
                                            $fullStars = floor($rating);
                                            $halfStar = $rating - $fullStars >= 0.5;
                                            $reviewCount = $product->reviews->count();
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
                                        @if($reviewCount > 0)
                                            <span>({{ $reviewCount }} đánh giá)</span>
                                        @else
                                            <span>(Chưa có đánh giá)</span>
                                        @endif
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                @empty
                    <div class="col-12 text-center py-5">
                        <p class="h4">Không tìm thấy sản phẩm nào trong danh mục này.</p>
                    </div>
                @endforelse
            </div>
            <div class="row mt-5">
                <div class="col-12 d-flex justify-content-center">
                    {{ $products->links('pagination::bootstrap-5') }}
                </div>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: true,
        });
    </script>
@endsection 