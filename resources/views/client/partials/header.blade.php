<!-- Start Header/Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark py-3 header-nav">
    <style>
        .header-nav {
            background: #101726;
            height: 120px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
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

        .category-btn {
            border-radius: 2rem;
            background: #232b3b;
            border: none;
            padding: 11px 15px;
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
            margin-right: 8px; /* Space between icon and name */
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
        }

        .dropdown-menu.show {
            opacity: 1;
            transform: translateY(0);
        }

        /* Remove underline from all links in the header */
        .header-nav a {
            text-decoration: none;
            color: #ffffff
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
            <button class="btn d-flex align-items-center ms-4 me-3 category-btn" type="button" id="categoryDropdown"
                data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-bars me-2 text-white"></i> <span class="category-btn-text">Danh mục</span>
            </button>
            <ul class="dropdown-menu dropdown-menu-bg" style="margin-left: 19px" aria-labelledby="categoryDropdown">
                <li><a class="dropdown-item text-white" href="#"><i class="fa-brands fa-apple"></i> iPhone</a>
                </li>
                <li><a class="dropdown-item text-white" href="#"><i class="fa-solid fa-laptop"></i> Mac</a></li>
                <li><a class="dropdown-item text-white" href="#"><i class="fa-solid fa-tablet-screen-button"></i>
                        iPad</a></li>
                <li><a class="dropdown-item text-white" href="#"><i class="fa-regular fa-clock"></i> Watch</a>
                </li>
                <li><a class="dropdown-item text-white" href="#"><i class="fa-solid fa-headphones"></i> Tai nghe,
                        Loa</a></li>
                <li><a class="dropdown-item text-white" href="#"><i class="fa-solid fa-plug"></i> Phụ kiện</a>
                </li>

            </ul>
        </div>
        <!-- Search -->
        <form class="flex-grow-1 mx-3 search-form">
            <div class="search-input-wrapper">
                <input type="text" class="form-control search-input" style="height: 46px"
                    placeholder="Bạn đang tìm sản phẩm, tin tức, workshop...">
                <button type="submit" class="search-icon-button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
            <div class="mt-1 search-suggestions">
                <ul class="custom-navbar-nav navbar-nav ms-auto mb-md-0">
                    <li class="nav-item {{ Route::currentRouteName() == 'home' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('home') }}">Home</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'shop' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('shop') }}">Shop</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'about' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('about') }}">About us</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'blog' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('blog') }}">Blog</a>
                    </li>
                    <li class="nav-item {{ Route::currentRouteName() == 'contact' ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('contact') }}">Contact us</a>
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
                    <a class="d-flex align-items-center dropdown-toggle user-logged-in-btn"
                        href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user text-white"></i>
                        <span class="user-name-text">{{ Str::limit(auth()->user()->name, 12, '...') }}</span>
                    </a>
                @endguest
                <ul class="dropdown-menu dropdown-menu-bg" aria-labelledby="userDropdown">
                    @guest
                        <li><a class="dropdown-item text-white" href="{{ route('register') }}">Register</a></li>
                        <li><a class="dropdown-item text-white" href="{{ route('login') }}">Login</a></li>
                    @else
                        <li><a class="dropdown-item text-white" href="#">Profile</a></li>
                        <li><a class="dropdown-item text-white" href="#">Order History</a></li>
                        <li>
                            <form action="{{ route('logout') }}" method="POST" class="dropdown-item m-0 p-0">
                                @csrf
                                <button type="submit"
                                    class="btn btn-link dropdown-item text-start text-white">Logout</button>
                            </form>
                        </li>
                    @endguest
                </ul>
            </div>

            <!-- Giỏ hàng -->
            <a class="rounded-circle d-flex align-items-center justify-content-center icon-circle-btn"
                href="{{ route('cart') }}">
                <i class="fas fa-shopping-cart text-white"></i>
            </a>
        </div>
    </div>
</nav>
<!-- End Header/Navigation -->

<!-- Start Banner -->
@yield('banner')
<!-- End Banner -->

<!-- End Hero Section -->
