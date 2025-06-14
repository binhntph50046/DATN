<nav class="pc-sidebar">
    <div class="navbar-wrapper">
        <div class="m-header">
            <a href="{{ route('admin.dashboard') }}" class="b-brand text-primary">
                <!-- ========   Change your logo from here   ============ -->
                <img src="assets/images/logo-dark.svg" class="img-fluid logo-lg" alt="logo">
            </a>
        </div>
        <div class="navbar-content">
            <ul class="pc-navbar">
                <li class="pc-item">
                    <a href="{{ route('admin.dashboard') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-dashboard"></i></span>
                        <span class="pc-mtext">Dashboard</span>
                    </a>
                </li>

                <li class="pc-item pc-caption">
                    <label>Interface management</label>
                    <i class="ti ti-dashboard"></i>
                </li>
                <li class="pc-item">
                    <a href="elements/bc_typography.html" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-typography"></i></span>
                        <span class="pc-mtext">Typography</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="elements/bc_color.html" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-color-swatch"></i></span>
                        <span class="pc-mtext">Color</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="elements/icon-tabler.html" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-plant-2"></i></span>
                        <span class="pc-mtext">Icons</span>
                    </a>
                </li>

                <li class="pc-item pc-caption">
                    <label>System management</label>
                    <i class="ti ti-news"></i>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.categories.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-layout-grid"></i></span>
                        <span class="pc-mtext">Categories</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.orders.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-shopping-cart"></i></span>
                        <span class="pc-mtext">Orders</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.products.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-package"></i></span>
                        <span class="pc-mtext">Products</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.attributes.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-tag"></i></span>
                        <span class="pc-mtext">Attributes</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.specifications.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-tag"></i></span>
                        <span class="pc-mtext">Thông số kỹ thuật</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.users.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-user"></i></span>
                        <span class="pc-mtext">Users</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.banners.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="fas fa-image"></i></span>
                        <span class="pc-mtext">Banners</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.blogs.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-news"></i></span>
                        <span class="pc-mtext">Blogs</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.vouchers.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-news"></i></span>
                        <span class="pc-mtext">Voucher</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.flash-sales.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-news"></i></span>
                        <span class="pc-mtext">Flash Sale</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.contacts.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-message"></i></span>
                        <span class="pc-mtext">Contacts</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.subscribers.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-mail"></i></span>
                        <span class="pc-mtext">Subscribers Email</span>
                    </a>
                </li>
                <li class="pc-item">
                    <a href="{{ route('admin.faqs.index') }}" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-mail"></i></span>
                        <span class="pc-mtext">Faq</span>
                    </a>
                </li>

                <li class="pc-item pc-caption">
                    <label>Other</label>
                    <i class="ti ti-brand-chrome"></i>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link"><span class="pc-micon"><i class="ti ti-menu"></i></span><span
                            class="pc-mtext">Menu
                            levels</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="#!">Level 2.1</a></li>
                        <li class="pc-item pc-hasmenu">
                            <a href="#!" class="pc-link">Level 2.2<span class="pc-arrow"><i
                                        data-feather="chevron-right"></i></span></a>
                            <ul class="pc-submenu">
                                <li class="pc-item"><a class="pc-link" href="#!">Level 3.1</a></li>
                                <li class="pc-item"><a class="pc-link" href="#!">Level 3.2</a></li>
                                <li class="pc-item pc-hasmenu">
                                    <a href="#!" class="pc-link">Level 3.3<span class="pc-arrow"><i
                                                data-feather="chevron-right"></i></span></a>
                                    <ul class="pc-submenu">
                                        <li class="pc-item"><a class="pc-link" href="#!">Level 4.1</a></li>
                                        <li class="pc-item"><a class="pc-link" href="#!">Level 4.2</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="pc-item pc-hasmenu">
                            <a href="#!" class="pc-link">Level 2.3<span class="pc-arrow"><i
                                        data-feather="chevron-right"></i></span></a>
                            <ul class="pc-submenu">
                                <li class="pc-item"><a class="pc-link" href="#!">Level 3.1</a></li>
                                <li class="pc-item"><a class="pc-link" href="#!">Level 3.2</a></li>
                                <li class="pc-item pc-hasmenu">
                                    <a href="#!" class="pc-link">Level 3.3<span class="pc-arrow"><i
                                                data-feather="chevron-right"></i></span></a>
                                    <ul class="pc-submenu">
                                        <li class="pc-item"><a class="pc-link" href="#!">Level 4.1</a></li>
                                        <li class="pc-item"><a class="pc-link" href="#!">Level 4.2</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="pc-item">
                    <a href="other/sample-page.html" class="pc-link">
                        <span class="pc-micon"><i class="ti ti-brand-chrome"></i></span>
                        <span class="pc-mtext">Sample page</span>
                    </a>
                </li>
            </ul>
            {{-- <div class="card text-center">
                <div class="card-body">
                    <img src="assets/images/img-navbar-card.png" alt="images" class="img-fluid mb-2">
                    <h5>Upgrade To Pro</h5>
                    <p>To get more features and components</p>
                    <a href="https://codedthemes.com/item/berry-bootstrap-5-admin-template/" target="_blank"
                        class="btn btn-success">Buy Now</a>
                </div>
            </div> --}}
        </div>
    </div>
</nav>
