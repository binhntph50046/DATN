<!-- Start Header/Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark py-3 header-nav">
    <style>
        .header-nav {
            background: #101726;
            height: 120px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 100;
        }

        .brand-text {
            font-size: 2rem;
            font-family: serif;
            font-weight: bold;
        }

        .fpt-logo-text {
            font-size: 1rem;
        }

        .fpt-logo-img {
            height: 18px;
            vertical-align: middle;
        }

        .apple-logo-img {
            height: 47px;
        }

        .reseller-text {
            font-size: 0.8rem;
            color: #fff;
        }


        .category-btn-text {
            font-weight: 600;
            color: #ffffff;
        }

        .search-form {
            max-width: 600px;
        }

        .search-input-wrapper {
            position: relative;
            width: 100%;
        }

        .search-input {
            background: #2d3545;
            color: #fff;
            border: none;
            border-radius: 2rem;
            /* Fully rounded */
            padding-right: 60px;
            /* Make space for the icon */
        }

        .search-icon-button {
            position: absolute;
            right: 5px;
            /* Adjust as needed */
            top: 5px;
            /* Position 5px from the top */
            transform: none;
            /* Remove vertical centering transform */
            width: 36px;
            height: 36px;
            background: #fff;
            /* White background for the circle */
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .search-icon-button .fas {
            color: #2d3545;
            /* Dark color for the icon itself */
        }

        .search-suggestions {
            font-size: 0.95rem;
        }

        .search-suggestions .nav-link {
            color: #ffffff;
        }

        .search-suggestions .nav-item.active .nav-link {
            color: #ffffff !important;
            font-weight: 700;
        }

        .nav-item {
            margin-right: 12px;
        }

        .icon-group {
            gap: 12px;
        }

        .icon-circle-btn {
            width: 46px;
            height: 46px;
            background: #232b3b;
            border: none;
            border-radius: 50%;
        }

        .user-logged-in-btn {
            border-radius: 2rem;
            background: #232b3b;
            color: #fff;
            padding: 10px 15px;
            /* Adjust padding as needed */
        }

        .user-logged-in-btn .fas {
            margin-right: 8px;
            /* Space between icon and name */
        }

        .user-name-text {
            font-weight: 600;
        }

        .dropdown-menu-bg {
            background: #232b3b;
            border: none;
            padding: 0;
            left: 50% !important;
            transform: translateX(-50%) !important;
        }

        .dropdown-item.text-white {
            padding: 10px 15px;
            border-bottom: 1px solid #3a445c;
        }

        .dropdown-item.text-white:last-child {
            border-bottom: none;
        }

        .dropdown-item.text-white:hover {
            background: #3a445c;
            /* Slightly lighter background on hover */
        }

        .dropdown-menu {
            opacity: 0;
            transform: translateY(10px);
            transition: opacity 0.3s ease-out, transform 0.3s ease-out;
            display: block;
            pointer-events: none;
        }

        .dropdown-menu.show {
            opacity: 1;
            pointer-events: auto;
            transform: translateY(0);
        }

        /* Remove underline from all links in the header */
        .header-nav a {
            text-decoration: none;
            color: #ffffff
        }

        #search-suggestion-box {
            background: #232b3b;
            border-radius: 0 0 1rem 1rem;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
            border: none;
            margin-top: 2px;
            padding: 0.5rem 0;
            color: #fff;
        }

        #suggestion-list .suggestion-group-title {
            font-size: 0.95rem;
            font-weight: 700;
            padding: 0.5rem 1rem 0.2rem 1rem;
            color: #a0a8b8;
            background: transparent;
            border: none;
            cursor: default;
        }

        #suggestion-list .list-group-item {
            background: transparent;
            color: #fff;
            border: none;
            border-radius: 0;
            padding: 0.5rem 1rem;
            transition: background 0.2s;
        }

        #suggestion-list .list-group-item:hover {
            background: #2d3545;
            color: #ffd700;
        }

        #suggestion-list .highlight {
            color: #ffd700;
            font-weight: bold;
        }
    </style>
    <div class="container d-flex justify-content-between" style="align-items: flex-start">
        <!-- Logo -->
        <div class="d-flex align-items-center">
            <a class="d-flex align-items-center brand-text" href="{{ route('home') }}"
                style="border-right: 1px solid #7d868d;padding-right: 9px;">
                AppleStore.
            </a>
            <div class="ms-3">
                <img src="https://cdnv2.tgdd.vn/webmwg/2024/tz/images/APR_logo.webp" alt="Apple"
                    class="apple-logo-img">
            </div>
        </div>
        <!-- Danh mục -->
        <div class="dropdown">
            <button class="btn d-flex align-items-center ms-4 me-3 category-btn" style="background: #232b3b"
                type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-bars me-2 text-white"></i> <span class="category-btn-text">Danh mục</span>
            </button>
            <ul class="dropdown-menu dropdown-menu-bg" style="margin-left: 5px" aria-labelledby="categoryDropdown">
                @foreach ($categories as $category)
                    <li>
                        <a class="dropdown-item text-white" href="{{ route('shop.category', $category->slug) }}">
                            @if ($category->icon)
                                <i class="{{ $category->icon }}"></i>
                            @endif
                            {{ $category->name }}
                        </a>
                    </li>
                @endforeach
            </ul>
        </div>
        <!-- Search -->
        <form class="flex-grow-1 mx-3 search-form" action="{{ route('search') }}" method="get">
            <div class="search-input-wrapper" style="position:relative;">
                <input type="text" name="q" class="form-control search-input" style="height: 46px"
                    placeholder="Bạn đang tìm sản phẩm, tin tức, workshop..." value="{{ request('q') }}">
                <button type="submit" class="search-icon-button">
                    <i class="fas fa-search"></i>
                </button>
                <div id="search-suggestion-box" class="position-absolute w-100" style="z-index: 9999; display: none;">
                    <ul class="list-group" id="suggestion-list"></ul>
                </div>
            </div>
            <div class="mt-1 search-suggestions">
                <ul class="custom-navbar-nav navbar-nav ms-auto mb-md-0">
                    <li class="nav-item {{ Route::currentRouteName() == 'home' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('home') }}">Trang chủ</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'shop' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('shop') }}">Cửa hàng</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'about' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('about') }}">Giới thiệu</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'blog' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('blog') }}">Bài viết</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'contact' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('contact') }}">Liên hệ</a>
                    </li>
                </ul>
            </div>
        </form>
        <!-- User, Wishlist & Cart -->
        <div class="d-flex align-items-center icon-group">
            <!-- Wishlist (Heart icon) -->
            <a href="{{ route('wishlist.index') }}"
                class="rounded-circle d-flex align-items-center justify-content-center icon-circle-btn">
                <i class="fas fa-heart text-white"></i>
            </a>

            <!-- User dropdown -->
            <div class="dropdown">
                @guest
                    <a class="rounded-circle d-flex align-items-center justify-content-center dropdown-toggle icon-circle-btn"
                        href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user text-white"></i>
                    </a>
                @else
                    <a class="d-flex align-items-center dropdown-toggle user-logged-in-btn" href="#" id="userDropdown"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user text-white"></i>
                        <span class="user-name-text">{{ Str::limit(auth()->user()->name, 12, '...') }}</span>
                    </a>
                @endguest
                <ul class="dropdown-menu dropdown-menu-bg" aria-labelledby="userDropdown">
                    @guest
                        <li><a class="dropdown-item text-white" href="{{ route('register') }}">Đăng kí</a></li>
                        <li><a class="dropdown-item text-white" href="{{ route('login') }}">Đăng nhập</a></li>
                    @else
                        @if (Auth::user()->hasRole(['admin', 'staff']))
                            <li>
                                <a class="dropdown-item text-white" href="{{ route('admin.dashboard') }}">Trang quản
                                    trị</a>
                            </li>
                        @endif
                        <li><a class="dropdown-item text-white" href="{{ route('profile.index') }}">Trang cá nhân</a></li>
                        <li><a class="dropdown-item text-white" href="{{ route('order.index') }}">Lịch sử đơn hàng</a></li>
                        <li>
                            <form action="{{ route('logout') }}" method="POST" class="m-0">
                                @csrf
                                <button type="submit"
                                    class="dropdown-item text-white w-100 text-start border-0 bg-transparent">Đăng
                                    xuất</button>
                            </form>
                        </li>
                    @endguest
                </ul>
            </div>

            <!-- Giỏ hàng -->
            <a class="rounded-circle d-flex align-items-center justify-content-center icon-circle-btn position-relative"
                href="{{ route('cart') }}">
                <i class="fas fa-shopping-cart text-white"></i>

                @if ($cartCount > 0)
                    <span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger"
                        style="top: 6px; font-size: 0.75rem; padding: 0.35em 0.5em;">
                        {{ $cartCount }}
                    </span>
                @endif
            </a>



        </div>
    </div>
</nav>
<!-- End Header/Navigation -->

<!-- Start Banner -->
@yield('banner')
<!-- End Banner -->

<!-- End Hero Section -->

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const input = document.querySelector('.search-input');
        const suggestionBox = document.getElementById('search-suggestion-box');
        const suggestionList = document.getElementById('suggestion-list');
        let timeout = null;

        function highlight(text, keyword) {
            if (!keyword) return text;
            const re = new RegExp('(' + keyword.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ')', 'ig');
            return text.replace(re, '<span class="highlight">$1</span>');
        }

        input.addEventListener('input', function() {
            clearTimeout(timeout);
            const q = this.value.trim();
            if (q.length < 2) {
                suggestionBox.style.display = 'none';
                return;
            }
            timeout = setTimeout(() => {
                fetch(`/api/search-suggestions?q=${encodeURIComponent(q)}`)
                    .then(res => res.json())
                    .then(data => {
                        suggestionList.innerHTML = '';
                        let hasResult = false;
                        if (data.products.length > 0) {
                            const groupTitle = document.createElement('li');
                            groupTitle.className = 'suggestion-group-title';
                            groupTitle.innerHTML = '<i class="fas fa-box"></i> Sản phẩm';
                            suggestionList.appendChild(groupTitle);
                            data.products.forEach(product => {
                                const li = document.createElement('li');
                                li.className =
                                    'list-group-item list-group-item-action';
                                li.innerHTML =
                                    `<i class='fas fa-box'></i> <a href='/product/${product.slug}' class='text-white text-decoration-none'>` +
                                    highlight(product.name, q) + `</a>`;
                                li.onclick = (e) => {
                                    e.preventDefault();
                                    window.location.href =
                                        `/product/${product.slug}`;
                                };
                                suggestionList.appendChild(li);
                            });
                            hasResult = true;
                        }
                        if (data.blogs.length > 0) {
                            const groupTitle = document.createElement('li');
                            groupTitle.className = 'suggestion-group-title';
                            groupTitle.innerHTML =
                                '<i class="fas fa-newspaper"></i> Bài viết';
                            suggestionList.appendChild(groupTitle);
                            data.blogs.forEach(blog => {
                                const li = document.createElement('li');
                                li.className =
                                    'list-group-item list-group-item-action';
                                li.innerHTML =
                                    `<i class='fas fa-newspaper'></i> <a href='/blog/${blog.slug}' class='text-white text-decoration-none'>` +
                                    highlight(blog.title, q) + `</a>`;
                                li.onclick = (e) => {
                                    e.preventDefault();
                                    window.location.href = `/blog/${blog.slug}`;
                                };
                                suggestionList.appendChild(li);
                            });
                            hasResult = true;
                        }
                        if (!hasResult) {
                            suggestionBox.style.display = 'none';
                            return;
                        }
                        suggestionBox.style.display = 'block';
                    });
            }, 250);
        });

        // Ẩn suggestion khi click ra ngoài
        document.addEventListener('click', function(e) {
            if (!suggestionBox.contains(e.target) && e.target !== input) {
                suggestionBox.style.display = 'none';
            }
        });
    });
</script>
