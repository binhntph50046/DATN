@extends('client.layouts.app')
@section('title', 'Cửa hàng - Apple Store')

@section('content')
    <link href="{{ asset('css/shop-custom.css') }}" rel="stylesheet">

    <div class="shop-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>Cửa hàng</h1>
                    <div class="breadcrumbs">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Trang chủ</a></li>
                                <li class="breadcrumb-item active">Cửa hàng</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="untree_co-section product-section">
        <div class="container">
            <!-- Flash Sale Section -->
            @if ($flashSaleItems->count() && $flashSaleTimeRange)
                <div class="row mb-5 flash-sale-box">
                    <div class="col-12">
                        <div class="row section-header align-items-center flash-sale-header">
                            <div class="flash-sale-image col-md-4 col-sm-12 mb-2">
                                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/icon-fs.png" alt="Flash Sale"
                                    class="img-fluid">
                            </div>
                            <div class="countdown-timer col-md-3 col-sm-6 mb-2">
                                <h5 class="time">KẾT THÚC TRONG:</h5>
                                <h4 id="countdown">00:00:00</h4>
                            </div>
                            <div class="ongoing-time col-md-3 col-sm-6 mb-2">
                                <h5 class="time">ĐANG DIỄN RA:</h5>
                                <h4>{{ $flashSaleTimeRange['start_time']->format('d/m/Y H:i') }} -
                                    {{ $flashSaleTimeRange['end_time']->format('d/m/Y H:i') }}</h4>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="product-slider flash-sale-slider">
                                @foreach ($flashSaleItems as $item)
                                    <div class="product-item product-carousel">
                                        <div class="flash-card">
                                            <div class="flash-media position-relative">
                                                <span
                                                    class="flash-discount">{{ $item->discount_type == 'percent' ? $item->discount . '%' : '-' }}</span>
                                                <a href="{{ route('product.detail', ['slug' => $item->product_slug]) }}"
                                                    class="d-block w-100 h-100">
                                                    <img src="{{ asset($item->first_image) }}" class="img-fluid"
                                                        alt="{{ $item->variant_name }}">
                                                </a>
                                            </div>
                                            <div class="flash-body">
                                                <div class="flash-title">{{ $item->variant_name }}</div>
                                                @php
                                                    $original = $item->selling_price;
                                                    $discount =
                                                        $item->discount_type === 'percent'
                                                            ? $original * (1 - $item->discount / 100)
                                                            : $original - $item->discount;
                                                @endphp
                                                <div class="flash-price-row">
                                                    <strong class="flash-price">{{ number_format($discount, 0) }}$</strong>
                                                    <span
                                                        class="flash-old"><del>{{ number_format($original, 0) }}$</del></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    // Countdown with timestamp (ms) to avoid timezone parsing issues
                    const endTimeMs = Number("{{ $flashSaleTimeRange['end_time']->timestamp * 1000 }}");
                    const countdownElement = document.getElementById('countdown');
                    const tick = () => {
                        const distance = endTimeMs - Date.now();
                        if (distance <= 0) {
                            countdownElement.textContent = 'Đã kết thúc';
                            return;
                        }
                        const days = Math.floor(distance / 86400000);
                        const hours = Math.floor((distance % 86400000) / 3600000);
                        const minutes = Math.floor((distance % 3600000) / 60000);
                        const seconds = Math.floor((distance % 60000) / 1000);
                        countdownElement.textContent =
                            (days > 0 ? days + ' ngày ' : '') +
                            String(hours).padStart(2, '0') + ':' +
                            String(minutes).padStart(2, '0') + ':' +
                            String(seconds).padStart(2, '0');
                        requestAnimationFrameId = requestAnimationFrame(() => setTimeout(tick, 250));
                    };
                    let requestAnimationFrameId = requestAnimationFrame(tick);
                </script>
            @endif

            <!-- Category Menu -->
            <div class="category-menu-container mb-5">
                <ul class="p-0 choose-cate d-flex w-100 flex-nowrap justify-content-between">
                    @foreach ($topCategories as $category)
                        <li class="box_category" style="margin: 0; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.21);">
                            <a href="{{ route('shop.category', ['slug' => $category->slug]) }}">
                                <div class="img-catesp">
                                    <img src="{{ asset($category->image) }}" alt="{{ $category->name }}"
                                        style="width: 100px; height: 100px; object-fit: contain;">
                                </div>
                                <span>{{ $category->name }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <!-- Filter and Search Section -->
            <div class="filter-section mb-5">
                <div class="row">
                    <div class="col-lg-3 col-md-4">
                        <!-- Clear Filters -->
                        <div class="filter-actions mb-3">
                            <button type="button" class="btn btn-clear-filter w-100"
                                onclick="clearFilters()">
                                <i class="fas fa-times"></i> Xóa bộ lọc
                            </button>
                        </div>
                        <!-- Category Filter -->
                        @if ($filterData['categories']->count() > 0)
                            <div class="filter-group mb-3">
                                <h6 class="filter-title">Danh mục ({{ $filterData['categories']->count() }})</h6>
                                <div class="filter-options">
                                    @foreach ($filterData['categories'] as $category)
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="category_slug[]"
                                                id="category_{{ $loop->index }}" value="{{ $category->slug }}"
                                                {{ in_array($category->slug, $appliedFilters['category_slug'] ?? []) ? 'checked' : '' }}>
                                            <label class="form-check-label" for="category_{{ $loop->index }}">
                                                {{ $category->name }} ({{ $category->products_count }})
                                            </label>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif

                        <!-- Price Filter -->
                        <div class="filter-group mb-3">
                            <h6 class="filter-title">Khoảng giá</h6>
                            <div class="price-range">
                                <div class="row">
                                    <div class="col-6">
                                        <input type="number" class="form-control" name="min_price" placeholder="Từ"
                                            value="{{ $appliedFilters['min_price'] ?? '' }}">
                                    </div>
                                    <div class="col-6">
                                        <input type="number" class="form-control" name="max_price" placeholder="Đến"
                                            value="{{ $appliedFilters['max_price'] ?? '' }}">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Dynamic Filters -->
                        @foreach ($filterData['dynamicFilters'] as $filterId => $filter)
                            <div class="filter-group mb-3">
                                <h6 class="filter-title">{{ $filter['name'] }} ({{ $filter['count'] }})</h6>

                                @if ($filter['type'] === 'color')
                                    <!-- Color Filter -->
                                    <div class="color-options">
                                        @foreach ($filter['values'] as $value)
                                            <div class="color-option-wrapper">
                                                <input type="checkbox" class="color-checkbox"
                                                    id="filter_{{ $filterId }}_{{ $loop->index }}"
                                                    value="{{ $value }}" name="filters[{{ $filterId }}][]"
                                                    {{ in_array($value, $appliedFilters['filters'][$filterId] ?? []) ? 'checked' : '' }}>
                                                <label for="filter_{{ $filterId }}_{{ $loop->index }}"
                                                    class="color-label"
                                                    style="background-color: {{ $filter['hexValues'][$value] ?? '#CCCCCC' }}"
                                                    title="{{ $value }}">
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                @elseif($filter['type'] === 'storage')
                                    <!-- Storage Filter -->
                                    <div class="filter-options">
                                        @foreach ($filter['values'] as $value)
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox"
                                                    name="filters[{{ $filterId }}][]"
                                                    id="filter_{{ $filterId }}_{{ $loop->index }}"
                                                    value="{{ $value }}"
                                                    {{ in_array($value, $appliedFilters['filters'][$filterId] ?? []) ? 'checked' : '' }}>
                                                <label class="form-check-label"
                                                    for="filter_{{ $filterId }}_{{ $loop->index }}">
                                                    {{ $value }}
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                @else
                                    <!-- Default Text Filter -->
                                    <div class="filter-options">
                                        @foreach ($filter['values'] as $value)
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox"
                                                    name="filters[{{ $filterId }}][]"
                                                    id="filter_{{ $filterId }}_{{ $loop->index }}"
                                                    value="{{ $value }}"
                                                    {{ in_array($value, $appliedFilters['filters'][$filterId] ?? []) ? 'checked' : '' }}>
                                                <label class="form-check-label"
                                                    for="filter_{{ $filterId }}_{{ $loop->index }}">
                                                    {{ $value }}
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                        @endforeach
                    </div>

                    <div class="col-lg-9 col-md-8">
                        <!-- Sort and View Options -->
                        <div class="product-controls mb-4">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h5 class="mb-0">Tất cả sản phẩm ({{ $products->total() }})</h5>
                                </div>
                                <div class="col-md-6 text-md-end">
                                    <div class="d-flex align-items-center justify-content-md-end">
                                        <label class="me-2">Sắp xếp:</label>
                                        <select class="form-select form-select-sm" id="sortSelect" name="sort"
                                            style="width: auto;">
                                            <option value="newest"
                                                {{ ($appliedFilters['sort'] ?? 'newest') == 'newest' ? 'selected' : '' }}>
                                                Mới nhất</option>
                                            <option value="price_low"
                                                {{ ($appliedFilters['sort'] ?? '') == 'price_low' ? 'selected' : '' }}>Giá
                                                tăng dần</option>
                                            <option value="price_high"
                                                {{ ($appliedFilters['sort'] ?? '') == 'price_high' ? 'selected' : '' }}>Giá
                                                giảm dần</option>
                                            <option value="name_asc"
                                                {{ ($appliedFilters['sort'] ?? '') == 'name_asc' ? 'selected' : '' }}>Tên
                                                A-Z</option>
                                            <option value="name_desc"
                                                {{ ($appliedFilters['sort'] ?? '') == 'name_desc' ? 'selected' : '' }}>Tên
                                                Z-A</option>
                                            <option value="popular"
                                                {{ ($appliedFilters['sort'] ?? '') == 'popular' ? 'selected' : '' }}>Phổ
                                                biến</option>
                                            <option value="rating"
                                                {{ ($appliedFilters['sort'] ?? '') == 'rating' ? 'selected' : '' }}>Đánh
                                                giá cao</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Products Grid -->
                        @if ($products->count() > 0)
                            <div class="row product-grid">
                                @foreach ($products as $product)
                                    <div class="col-lg-4 col-md-6 mb-4">
                                        <div class="product-card">
                                            <div class="product-media">
                                                <a href="{{ route('product.detail', $product->slug) }}"
                                                    class="d-block w-100 h-100 text-center">
                                                    @php
                                                        $defaultImage = asset('uploads/default/default.jpg');
                                                        $variantImage = null;
                                                        $defaultVariant = $product->variants->first();

                                                        if ($defaultVariant && $defaultVariant->images) {
                                                            $images = $defaultVariant->images;
                                                            if (is_array($images) && !empty($images[0])) {
                                                                $variantImage = asset($images[0]);
                                                            } elseif (is_string($images)) {
                                                                $decoded = json_decode($images, true);
                                                                if (is_array($decoded) && !empty($decoded[0])) {
                                                                    $variantImage = asset($decoded[0]);
                                                                }
                                                            }
                                                        }
                                                    @endphp
                                                    <img src="{{ $variantImage ?? $defaultImage }}" class="product-img"
                                                        alt="{{ $product->name }}">
                                                </a>

                                                <div class="product-tools">
                                                    <span class="tool-btn" title="So sánh"
                                                        onclick="event.preventDefault(); addToCompare('{{ $product->id }}', '{{ $product->name }}', '{{ $product->category_id }}')">
                                                        <i class="fa-solid fa-code-compare"></i>
                                                    </span>
                                                    @auth
                                                        <span
                                                            class="tool-btn {{ in_array($product->id, $wishlistProductIds ?? []) ? 'active' : '' }}"
                                                            title="{{ in_array($product->id, $wishlistProductIds ?? []) ? 'Xóa khỏi yêu thích' : 'Thêm vào yêu thích' }}"
                                                            onclick="event.preventDefault(); toggleWishlist('{{ $product->id }}', '{{ route('wishlist.toggle', $product) }}', this)">
                                                            <i class="fas fa-heart"></i>
                                                        </span>
                                                    @else
                                                        <span class="tool-btn" title="Đăng nhập để thêm vào yêu thích"
                                                            onclick="event.preventDefault(); showLoginPrompt()">
                                                            <i class="fas fa-heart"></i>
                                                        </span>
                                                    @endauth
                                                    <span class="tool-btn" title="Xem nhanh"
                                                        onclick="event.preventDefault(); showQuickView({{ $product->id }}, '{{ $product->slug }}')">
                                                        <i class="fas fa-eye"></i>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="product-body">
                                                <a href="{{ route('product.detail', $product->slug) }}"
                                                    class="text-decoration-none">
                                                    <h3 class="product-title mb-1">{{ $product->name }}</h3>
                                                </a>
                                                {{-- <div class="product-category-chip mb-2">
                                                    <span>{{ $product->category->name ?? 'N/A' }}</span>
                                                </div> --}}

                                                <div class="product-price-row">
                                                    @if ($product->variants->isNotEmpty())
                                                        @php $variant = $product->variants->first(); @endphp
                                                        @if ($variant->discount_price)
                                                            <strong
                                                                class="product-price">{{ number_format($variant->discount_price) }}đ</strong>
                                                            <span
                                                                class="old-price"><del>{{ number_format($variant->selling_price) }}đ</del></span>
                                                        @else
                                                            <strong
                                                                class="product-price">{{ number_format($variant->selling_price) }}đ</strong>
                                                        @endif
                                                    @endif
                                                </div>

                                                <div class="product-rating-row">
                                                    @php
                                                        $rating = $product->reviews->avg('rating') ?? 0;
                                                        $fullStars = floor($rating);
                                                        $halfStar = $rating - $fullStars >= 0.5;
                                                    @endphp
                                                    <div class="stars">
                                                        @for ($i = 1; $i <= 5; $i++)
                                                            @if ($i <= $fullStars)
                                                                <i class="fas fa-star"></i>
                                                            @elseif($i == $fullStars + 1 && $halfStar)
                                                                <i class="fas fa-star-half-alt"></i>
                                                            @else
                                                                <i class="far fa-star"></i>
                                                            @endif
                                                        @endfor
                                                    </div>
                                                    <span class="views">({{ number_format($product->views) }} lượt
                                                        xem)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>

                            <!-- Pagination -->
                            <div class="pagination-wrapper text-center">
                                {{ $products->appends(request()->query())->links() }}
                            </div>
                        @else
                            <div class="no-products text-center py-5">
                                <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                                <h4 class="text-muted">Không tìm thấy sản phẩm nào</h4>
                                <p class="text-muted">Hãy thử thay đổi bộ lọc hoặc từ khóa tìm kiếm</p>
                                <button class="btn btn-primary" onclick="clearFilters()">Xóa bộ lọc</button>
                            </div>
                        @endif
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

            // Filter form handling
            setupFilters();
        });

        function setupFilters() {
            // Handle filter changes (category slug + dynamic filters)
            $('input[name="category_slug[]"], input[name^="filters["]').on('change', function() {
                applyFilters();
            });

            // Handle sort change
            $('#sortSelect').on('change', function() {
                applyFilters();
            });

            // Handle price range inputs
            $('input[name="min_price"], input[name="max_price"]').on('blur', function() {
                applyFilters();
            });
        }

        // Apply filters
        function applyFilters() {
            const formData = new FormData();

            // Get category filters by slug
            const categoryInputs = document.querySelectorAll('input[name="category_slug[]"]:checked');
            categoryInputs.forEach(input => {
                formData.append('category_slug[]', input.value);
            });

            // Get all dynamic filters
            const filterInputs = document.querySelectorAll('input[name^="filters["]');
            filterInputs.forEach(input => {
                if (input.checked) {
                    formData.append(input.name, input.value);
                }
            });

            // Get price filters
            const minPrice = $('input[name="min_price"]').val();
            const maxPrice = $('input[name="max_price"]').val();
            if (minPrice) formData.append('min_price', minPrice);
            if (maxPrice) formData.append('max_price', maxPrice);

            // Get sort
            const sort = $('select[name="sort"]').val();
            if (sort) formData.append('sort', sort);

            // Redirect with filters
            const params = new URLSearchParams(formData);
            window.location.href = '{{ route('shop') }}?' + params.toString();
        }

        function clearFilters() {
            window.location.href = '{{ route('shop') }}';
        }

        // ... existing code ...
    </script>

@endsection
