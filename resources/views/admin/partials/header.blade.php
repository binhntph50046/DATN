<header class="pc-header">
    <div class="header-wrapper"> <!-- [Mobile Media Block] start -->
        <div class="me-auto pc-mob-drp">
            <ul class="list-unstyled">
                <!-- ======= Menu collapse Icon ===== -->
                <li class="pc-h-item pc-sidebar-collapse">
                    <a href="#" class="pc-head-link ms-0" id="sidebar-hide">
                        <i class="ti ti-menu-2"></i>
                    </a>
                </li>
                <li class="pc-h-item pc-sidebar-popup">
                    <a href="#" class="pc-head-link ms-0" id="mobile-collapse">
                        <i class="ti ti-menu-2"></i>
                    </a>
                </li>
                <li class="dropdown pc-h-item d-inline-flex d-md-none">
                    <a class="pc-head-link dropdown-toggle arrow-none m-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <i class="ti ti-search"></i>
                    </a>
                    <div class="dropdown-menu pc-h-dropdown drp-search">
                        <form class="px-3">
                            <div class="form-group mb-0 d-flex align-items-center">
                                <i data-feather="search"></i>
                                <input type="search" class="form-control border-0 shadow-none"
                                    placeholder="Search here. . .">
                            </div>
                        </form>
                    </div>
                </li>
                <li class="pc-h-item d-none d-md-inline-flex">
                    <form class="header-search">
                        <i data-feather="search" class="icon-search"></i>
                        <input type="search" class="form-control" placeholder="Search here. . .">
                    </form>
                </li>
            </ul>
        </div>
        <!-- [Mobile Media Block end] -->
        <div class="ms-auto">
            <ul class="list-unstyled">
                <li class="dropdown pc-h-item">
                    <a class="pc-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
        role="button" aria-haspopup="true" aria-expanded="false">
        <i class="ti ti-bell position-relative">
            <span class="badge bg-danger d-none" id="notif-badge">0</span>
        </i>
    </a>
                    </content>
                    </create_file>

                    <div class="dropdown-menu dropdown-notification dropdown-menu-end pc-h-dropdown">
    <div class="dropdown-header d-flex align-items-center justify-content-between">
        <h5 class="m-0">Message</h5>
        <a href="#!" class="pc-head-link bg-transparent"><i class="ti ti-x text-danger"></i></a>
    </div>
    <div class="dropdown-divider"></div>

    <div class="dropdown-header px-0 text-wrap header-notification-scroll position-relative"
         style="max-height: calc(100vh - 215px)">
<div class="list-group list-group-flush w-100" id="notif-list">
            {{-- Các thông báo mẫu bên dưới (có thể giữ hoặc xoá hết để JS insert động) --}}
            <a class="list-group-item list-group-item-action">
                <div class="d-flex">
                    <div class="flex-shrink-0">
                        <img src="assets/images/user/avatar-2.jpg" alt="user-image" class="user-avtar">
                    </div>
                    <div class="flex-grow-1 ms-1">
                        <span class="float-end text-muted">3:00 AM</span>
                        <p class="text-body mb-1">It's <b>Cristina danny's</b> birthday today.</p>
                        <span class="text-muted">2 min ago</span>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="dropdown-divider"></div>
    <div class="text-center py-2">
        <a href="#!" class="link-primary">View all</a>
    </div>
</div>

                </li>
                <li class="dropdown pc-h-item header-user-profile">
                    <a class="pc-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" data-bs-auto-close="outside" aria-expanded="false">
                        @if (Auth::user()->avatar)
                            <img src="{{ asset(Auth::user()->avatar) }}" alt="user-image" class="user-avtar">
                        @else
                            <img src="/assets/images/user/avatar-2.jpg" alt="user-image" class="user-avtar">
                        @endif
                        <span>{{ Auth::user()->name }}</span>
                    </a>
                    <div class="dropdown-menu dropdown-user-profile dropdown-menu-end pc-h-dropdown">
                        <div class="dropdown-header">
                            <div class="d-flex mb-1">
                                <div class="flex-shrink-0">
                                    @if (Auth::user()->avatar)
                                        <img src="{{ asset(Auth::user()->avatar) }}" alt="user-image"
                                            class="user-avtar">
                                    @else
                                        <img src="/assets/images/user/avatar-2.jpg" alt="user-image"
                                            class="user-avtar">
                                    @endif
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h6 class="mb-1">{{ Auth::user()->name }}</h6>
                                    <span>{{ Auth::user()->email }}</span>
                                </div>
                                {{-- <a href="#!" class="pc-head-link bg-transparent"><i
                                        class="ti ti-power text-danger"></i></a> --}}
                            </div>
                        </div>
                        <ul class="nav drp-tabs nav-fill nav-tabs" id="mydrpTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="drp-t1" data-bs-toggle="tab"
                                    data-bs-target="#drp-tab-1" type="button" role="tab"
                                    aria-controls="drp-tab-1" aria-selected="true"><i class="ti ti-user"></i>
                                    Profile</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="drp-t2" data-bs-toggle="tab"
                                    data-bs-target="#drp-tab-2" type="button" role="tab"
                                    aria-controls="drp-tab-2" aria-selected="false"><i class="ti ti-settings"></i>
                                    Setting</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="mysrpTabContent">
                            <div class="tab-pane fade show active" id="drp-tab-1" role="tabpanel"
                                aria-labelledby="drp-t1" tabindex="0">
                                <a href="{{ route('admin.profile.index') }}" class="dropdown-item">
                                    <i class="ti ti-user"></i>
                                    <span>View Profile</span>
                                </a>
                                <a href="{{ route('admin.profile.password') }}" class="dropdown-item">
                                    <i class="ti ti-lock"></i>
                                    <span>Đổi mật khẩu</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="ti ti-clipboard-list"></i>
                                    <span>Billing</span>
                                </a>
                                <a href="{{ route('home') }}" class="dropdown-item">
                                    <i class="ti ti-home"></i>
                                    <span>Back to Client</span>
                                </a>
                                <form action="{{ route('logout') }}" method="POST" class="m-0 p-0">
                                    @csrf
                                    <button type="submit"
                                        class="dropdown-item w-100 text-start bg-transparent border-0">
                                        <i class="ti ti-power"></i>
                                        <span>Logout</span>
                                    </button>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="drp-tab-2" role="tabpanel" aria-labelledby="drp-t2"
                                tabindex="0">
                                <a href="#!" class="dropdown-item">
                                    <i class="ti ti-help"></i>
                                    <span>Support</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="ti ti-user"></i>
                                    <span>Account Settings</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="ti ti-lock"></i>
                                    <span>Privacy Center</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="ti ti-messages"></i>
                                    <span>Feedback</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="ti ti-list"></i>
                                    <span>History</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</header>
