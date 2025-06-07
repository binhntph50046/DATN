<style>
    .header-main {
        background: #111827;
        padding: 0;
        width: 100%;
        z-index: 1050;
        box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        height: 80px;
        min-height: 80px;
        display: flex;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
    }
    .header-flex {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        width: 100%;
        gap: 24px;
        height: 80px;
        min-height: 80px;
        position: relative;
    }
    .header-logo {
        display: flex;
        align-items: center;
        min-width: 220px;
        gap: 12px;
        height: 44px;
    }
    .header-logo-text {
        font-family: 'Georgia', 'Times New Roman', serif;
        font-size: 2rem;
        color: #fff;
        font-weight: bold;
        letter-spacing: 1px;
        line-height: 1;
        text-decoration: none;
        margin-right: 6px;
    }
    .header-logo-byfpt {
        font-size: 0.9rem;
        color: #fff;
        font-family: Arial, sans-serif;
        font-weight: 400;
        margin-left: 2px;
        display: flex;
        align-items: center;
        gap: 2px;
    }
    .header-logo-byfpt .fpt-f { color: #00b4f1; font-weight: bold; }
    .header-logo-byfpt .fpt-p { color: #ff6a00; font-weight: bold; }
    .header-logo-byfpt .fpt-t { color: #ffd600; font-weight: bold; }
    .apple-logo {
        height: 24px;
        margin: 0 6px 0 10px;
        
    }
    .authorised-reseller {
        color: #fff;
        font-size: 0.8rem;
        line-height: 1;
        opacity: 0.7;
        margin-left: 2px;
        white-space: nowrap;
    }
    .menu-btn, .cart-btn {
        background: #111827;
        border-radius: 999px;
        color: #bfc6d1;
        font-size: 1rem;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 8px 22px;
        border: none;
        outline: none;
        transition: background 0.2s, color 0.2s;
        cursor: pointer;
        height: 44px;
        min-height: 44px;
        box-shadow: none;
        position: relative;
    }
    .menu-btn:hover, .menu-btn:focus, .cart-btn:hover {
        background: #00e0ff;
        color: #111827;
    }
    .menu-btn i, .cart-btn i {
        font-size: 1.1rem;
        color: inherit;
        display: flex;
        align-items: center;
    }
    .cart-btn {
        margin-right: 0;
    }
    .cart-badge {
        position: absolute;
        top: 4px;
        right: 16px;
        background: #ff2d2d;
        color: #fff;
        font-size: 0.8rem;
        border-radius: 50%;
        width: 16px;
        height: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        border: 2px solid #353d4e;
    }
    .menu-dropdown {
        display: none;
        position: absolute;
        top: 110%;
        left: 0;
        min-width: 270px;
        background: #fff;
        border-radius: 20px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.13);
        z-index: 1001;
        padding: 12px 0 0 0;
        overflow: hidden;
    }
    .menu-btn:focus + .menu-dropdown,
    .menu-btn:hover + .menu-dropdown,
    .menu-dropdown:hover {
        display: block;
    }
    .menu-dropdown .menu-group {
        padding-bottom: 8px;
    }
    .menu-dropdown .menu-divider {
        border-top: 1px solid #f0f0f0;
        margin: 8px 0 0 0;
    }
    .menu-dropdown a {
        display: flex;
        align-items: center;
        color: #222;
        padding: 12px 28px;
        text-decoration: none;
        font-size: 1.08rem;
        font-weight: 500;
        gap: 16px;
        transition: background 0.2s, color 0.2s;
        white-space: nowrap;
    }
    .menu-dropdown a .menu-icon {
        font-size: 1.2rem;
        min-width: 22px;
        text-align: center;
        color: #111;
    }
    .menu-dropdown .menu-group-secondary a {
        color: #888;
        font-weight: 400;
    }
    .menu-dropdown .menu-group-secondary a .menu-icon {
        color: #bbb;
    }
    .menu-dropdown a:hover {
        background: #f5faff;
        color: #00b4f1;
    }
    .search-bar {
        flex: 1 1 0%;
        display: flex;
        align-items: center;
        background: #e1e4ea;
        border-radius: 999px;
        margin: 0 24px;
        max-width: 900px;
        min-width: 400px;
        height: 44px;
        min-height: 44px;
        box-shadow: none;
    }
    .search-input {
        background: transparent;
        border: none;
        color: #fff;
        font-size: 1.1rem;
        padding: 12px 24px;
        flex: 1;
        outline: none;
        box-shadow: none;
    }
    .search-input::placeholder {
        color: #bfc6d1;
        opacity: 1;
        font-weight: 400;
    }
    .search-icon {
        background: #111827;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        font-size: 1.1rem;
        margin-right: 6px;
        cursor: pointer;
        transition: background 0.2s;
        border: none;
        outline: none;
    }
    .search-icon:hover {
        background: #00e0ff;
        color: #111827;
    }
    .header-keywords {
        display: flex;
        align-items: center;
        gap: 24px;
        margin-top: 8px;
        margin-left: 0;
        font-size: 0.98rem;
        color: #e5e7eb;
        font-weight: 400;
        padding-left: 320px;
    }
    .header-keywords a {
        color: #e5e7eb;
        text-decoration: none;
        transition: color 0.2s;
        font-size: 0.98rem;
    }
    .header-keywords a:hover {
        color: #00e0ff;
    }
    @media (max-width: 1200px) {
        .header-flex { flex-wrap: wrap; }
        .header-keywords { margin-left: 0; justify-content: center; padding-left: 0; }
        .search-bar { min-width: 0; }
    }
    @media (max-width: 900px) {
        .header-flex { flex-direction: column; align-items: stretch; gap: 12px; }
        .header-keywords { margin-left: 0; justify-content: center; padding-left: 0; }
        .search-bar { min-width: 0; }
    }
    .profile-btn {
        background: #111827;
        border-radius: 50%;
        color: #bfc6d1;
        width: 44px;
        height: 44px;
        display: flex;
        align-items: center;
        justify-content: center;
        border: none;
        outline: none;
        transition: background 0.2s, color 0.2s;
        cursor: pointer;
        position: relative;
        margin-left: 8px;
        font-size: 1.2rem;
    }
    .profile-btn:hover, .profile-btn:focus {
        background: #00e0ff;
        color: #111827;
    }
    .profile-dropdown {
        display: none;
        position: absolute;
        top: 100%;
        right: 0;
        min-width: 180px;
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.13);
        z-index: 1100;
        padding: 10px 0;
        overflow: hidden;
        pointer-events: auto;
    }
    .profile-btn:focus + .profile-dropdown,
    .profile-btn:hover + .profile-dropdown,
    .profile-dropdown:hover {
        display: block;
    }
    .profile-dropdown a, .profile-dropdown form button {
        display: block;
        width: 100%;
        background: none;
        border: none;
        color: #222;
        padding: 12px 10px;
        text-align: center;
        font-size: 1rem;
        text-decoration: none;
        transition: background 0.2s, color 0.2s;
        cursor: pointer;
    }
    .profile-dropdown a:hover, .profile-dropdown form button:hover {
        background: #f5faff;
        color: #00b4f1;
    }
    .profile-dropdown .profile-name {
        font-weight: bold;
        color: #111827;
        padding: 10px 20px 5px 20px;
        font-size: 1.05rem;
        text-align: center;
    }
    .profile-dropdown .profile-divider {
        border-top: 1px solid #f0f0f0;
        margin: 5px 0;
    }
    .header-main a {
        text-decoration: none !important;
    }
</style>
<div class="header-main">
    <div class="container header-flex">
        <div class="header-logo">
         <a href="{{route('home')}}">
            <span class="header-logo-text">AppleStore</span>
            <img src="{{asset('/images/logo/apple-removebg-preview.png')}}" alt="Apple Logo" class="apple-logo">
            <span class="authorised-reseller">Authorised<br>Reseller</span>
         </a>
            <span class="header-logo-byfpt">by <span class="fpt-f">F</span><span class="fpt-p">P</span><span class="fpt-t">T</span></span>
        </div>
        <div style="position:relative;">
            <button class="menu-btn" tabindex="0"><i class="fas fa-bars"></i> Danh mục</button>
            <div class="menu-dropdown">
                <div class="menu-group">
                    <a href="#"><span class="menu-icon"><i class="fa-solid fa-mobile-screen"></i></span> iPhone</a>
                    <a href="#"><span class="menu-icon"><i class="fa-solid fa-tablet-screen-button"></i></span> iPad</a>
                    <a href="#"><span class="menu-icon"><i class="fa-solid fa-laptop"></i></span> Mac</a>
                    <a href="#"><span class="menu-icon"><i class="fa-regular fa-clock"></i></span> Apple Watch</a>
                    <a href="#"><span class="menu-icon"><i class="fa-solid fa-headphones"></i></span> Phụ kiện</a>
                </div>
                <div class="menu-divider"></div>
                <div class="menu-group menu-group-secondary">
                    <a href="#"><span class="menu-icon"><i class="fa-regular fa-newspaper"></i></span> Tin tức</a>
                    <a href="#"><span class="menu-icon"><i class="fa-regular fa-lightbulb"></i></span> Workshop</a>
                    <a href="#"><span class="menu-icon"><i class="fa-regular fa-life-ring"></i></span> F.Care</a>
                    <a href="#"><span class="menu-icon"><i class="fa-regular fa-graduation-cap"></i></span> Giải pháp cho Học tập</a>
                    <a href="#"><span class="menu-icon"><i class="fa-regular fa-briefcase"></i></span> Dự án Doanh nghiệp</a>
                </div>
            </div>
        </div>
        <form class="search-bar" action="#" method="get">
            <input class="search-input" type="text" placeholder="Hôm nay bạn muốn mua gì?">
            <button type="submit" class="search-icon"><i class="fas fa-search"></i></button>
        </form>
        <button class="cart-btn">
            <i class="fas fa-shopping-cart"></i> Giỏ hàng
            <span class="cart-badge">1</span>
        </button>
        <div style="position: relative; display: inline-block;">
            <button class="profile-btn" tabindex="0">
                <i class="fas fa-user"></i>
            </button>
            <div class="profile-dropdown">
                @guest
                    <a href="{{ route('login') }}">Đăng nhập</a>
                    <a href="{{ route('register') }}">Đăng ký</a>
                @else
                    <div class="profile-name">{{ Auth::user()->name }}</div>
                    <a href="#">Trang cá nhân</a>
                    <div class="profile-divider"></div>
                    <form action="{{ route('logout') }}" method="POST">
                        @csrf
                        <button type="submit">Đăng xuất</button>
                    </form>
                @endguest
            </div>
        </div>
    </div>
</div>
