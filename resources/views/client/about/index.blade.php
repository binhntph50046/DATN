@extends('client.layouts.app')
@section('title', 'Giới thiệu - Apple Store')

@section('content')
    <!-- Shop Banner -->
    <div class="shop-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 data-aos="fade-up">Giới thiệu</h1>
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" data-aos="fade-up" data-aos-delay="200">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Giới thiệu</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Team Section -->
    <div class="untree_co-section">
        <div class="container">

            <div class="row mb-5">
                <div class="col-lg-5 mx-auto text-center">
                    <h2 class="section-title">Các thành viên</h2>
                </div>
            </div>

            <div class="team-slider">
                <!-- Team Member 1 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Bao+Anh" class="img-fluid mb-3">
                    <h3><a href="#"><span>Nguyễn Ngọc</span> Bảo Anh</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

                <!-- Team Member 2 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Van+Dai" class="img-fluid mb-3">
                    <h3><a href="#"><span>Chu Văn</span> Đại</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

                <!-- Team Member 3 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Manh+Cuong" class="img-fluid mb-3">
                    <h3><a href="#"><span>Nguyễn Mạnh</span> Cường</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

                <!-- Team Member 4 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Thanh+Binh" class="img-fluid mb-3">
                    <h3><a href="#"><span>Nguyễn Thanh</span> Bình</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

                <!-- Team Member 5 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Van+Quang" class="img-fluid mb-3">
                    <h3><a href="#"><span>Nguyễn Văn</span> Quảng</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

                <!-- Team Member 6 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Van+Khai" class="img-fluid mb-3">
                    <h3><a href="#"><span>Nguyễn Văn</span> Khải</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

                <!-- Team Member 7 -->
                <div class="team-member">
                    <img src="https://via.placeholder.com/300x300?text=Kim+Phong" class="img-fluid mb-3">
                    <h3><a href="#"><span>Kim Hồng</span> Phong</a></h3>
                    <span class="d-block position mb-3">Lập trình web</span>
                    <p>Cao đẳng FPT Polytechnic Hà Nội</p>
                </div>

            </div>

        </div>
    </div>
    <!-- End Team Section -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Slick JS -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <!-- Slick Initialization -->
    <script>
        $(document).ready(function() {
            $('.team-slider').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3000,
                dots: true,
                arrows: true,
                responsive: [{
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 1
                        }
                    }
                ]
            });
        });
    </script>

@endsection
