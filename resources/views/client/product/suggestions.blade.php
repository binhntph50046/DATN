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

        @foreach ($suggestions as $key => $products)
            @if ($products->isNotEmpty())
                <div class="mb-5">
                    <h5 class="mb-3">{{ $groups[$key] ?? ucfirst($key) }}</h5>

                    <div class="product-slider d-flex overflow-auto gap-3 pb-2">
                        @foreach ($products as $product)
                            <div class="flex-shrink-0" style="width: 250px;" data-aos="fade-up"
                                data-aos-delay="{{ $loop->iteration * 100 }}">
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

                                    <h6 class="product-title text-center text-dark">{{ $product->name }}</h6>

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
        }

        .product-item {
            color: #212529 !important;
            /* Màu đen Bootstrap */
        }

        .product-item:hover {
            color: #000 !important;
            /* Màu khi hover (tùy chỉnh nếu cần) */
        }
    </style>
