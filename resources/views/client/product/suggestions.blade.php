<div class="container">
    {{-- <h4 class="mb-4">Sản phẩm gợi ý</h4> --}}
    <hr>
    <br style="margin: 200px 0px 200px 0px;">
    <div class="container">
        <h4 class="mb-4">Sản phẩm gợi ý</h4>

        @php
            $groups = [
                'by_price' => 'Gợi ý theo mức giá',
                'by_view' => 'Dựa trên sản phẩm đã xem',
                'by_search' => 'Dựa trên tìm kiếm gần đây',
                'trending' => 'Sản phẩm đang hot trong tuần',
            ];
        @endphp

        @foreach (['Gợi ý cho bạn' => $suggestions['unique']] as $key => $products)
            @if ($products->isNotEmpty())
                <div class="mb-5">
                    <h5 class="mb-3">{{ $groups[$key] ?? ucfirst($key) }}</h5>

                    <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6 g-3">
                        @foreach ($products as $product)
                            <div class="col" data-aos="fade-up" ... data-aos-delay="{{ $loop->iteration * 100 }}">
                                <a class="product-item d-block text-decoration-none"
                                    href="{{ route('product.detail', $product->slug) }}"
                                    onclick="incrementView('{{ $product->id }}')">
                                    <div class="product-thumbnail text-center mb-2">
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

                                            $variant = $defaultVariant;
                                        @endphp

                                        <img src="{{ $variantImage ?? $defaultImage }}" class="img-fluid mx-auto"
                                            alt="{{ $product->name }}" style="max-height: 200px; object-fit: contain;">
                                    </div>

                                    <h6 class="product-title text-center text-dark"
                                        style="height: 37px;line-height: 22px">{{ $product->name }}</h6>

                                    <div class="product-price-and-rating text-center">
                                        @if ($variant)
                                            @if ($variant->discount_price)
                                                <strong class="product-price text-decoration-line-through text-muted">
                                                    {{ number_format($variant->selling_price) }}đ
                                                </strong>
                                                <strong class="product-price text-danger ms-2">
                                                    {{ number_format($variant->discount_price) }}đ
                                                </strong>
                                            @else
                                                <strong class="product-price">
                                                    {{ number_format($variant->selling_price) }}đ
                                                </strong>
                                            @endif
                                        @endif

                                        <div
                                            class="product-rating d-flex justify-content-center align-items-center mt-1">
                                            @php
                                                $rating = $product->reviews->avg('rating') ?? 0;
                                                $fullStars = floor($rating);
                                                $halfStar = $rating - $fullStars >= 0.5;
                                            @endphp
                                            @if ($rating == 0)
                                                @for ($i = 1; $i <= 5; $i++)
                                                    <i class="fas fa-star"></i>
                                                @endfor
                                            @else
                                                @for ($i = 1; $i <= 5; $i++)
                                                    @if ($i <= $fullStars)
                                                        <i class="fas fa-star"></i>
                                                    @elseif($i == $fullStars + 1 && $halfStar)
                                                        <i class="fas fa-star-half-alt"></i>
                                                    @else
                                                        <i class="far fa-star"></i>
                                                    @endif
                                                @endfor
                                            @endif
                                            {{-- <span style="font-size: 0.75rem;">({{ number_format($product->views) }} lượt xem)</span> --}}
                                        </div>
                                    </div>

                                    <div class="product-icons d-flex justify-content-center mt-2 gap-2">
                                        <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                        @auth
                                            <form action="{{ route('wishlist.toggle', $product) }}" method="POST"
                                                style="display: none;" id="wishlist-form-{{ $product->id }}">
                                                @csrf
                                                <input type="hidden" name="product_name" value="{{ $product->name }}">
                                            </form>
                                            <span
                                                class="icon-heart icon-add-to-wishlist {{ in_array($product->id, $wishlistProductIds ?? []) ? 'in-wishlist' : '' }}"
                                                onclick="event.preventDefault(); toggleWishlist('{{ $product->id }}', '{{ route('wishlist.toggle', $product) }}', this)"
                                                title="{{ in_array($product->id, $wishlistProductIds ?? []) ? 'Xóa khỏi yêu thích' : 'Thêm vào yêu thích' }}">
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
            @endif
        @endforeach
    </div>
    <style>
        .product-slider {
            overflow-x: auto;
            white-space: nowrap;
            scroll-snap-type: x mandatory;
        }

        .product-slider::-webkit-scrollbar {
            display: none;
        }

        .product-item {
            scroll-snap-align: start;
            color: #212529 !important;
            /* Màu đen Bootstrap */
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            padding: 18px 10px 16px 10px;
            min-height: 320px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: stretch;
            transition: box-shadow 0.2s;
            height: 100%;
        }

        .product-item:hover {
            color: #000 !important;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.10);
        }

        .product-thumbnail {
            min-height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-title {
            min-height: 40px;
            max-height: 44px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            margin-bottom: 8px;
        }

        .product-price-and-rating {
            min-height: 48px;
            margin-bottom: 4px;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: center;
        }

        .product-price {
            font-size: 1.1rem;
            font-weight: 600;
            display: block;
            line-height: 1.2;
        }

        .product-rating {
            min-height: 22px;
        }
    </style>
