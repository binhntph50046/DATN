@extends('client.layouts.app')
@section('title', 'Liên hệ - Apple Store')

@section('content')

    <!-- Shop Banner -->
    <div class="shop-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 data-aos="fade-up">Contact</h1>
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" data-aos="fade-up" data-aos-delay="200">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Contact</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Contact Form -->
    <div class="untree_co-section">
        <div class="container">
            <div class="block">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-8 pb-4">
                        <div class="row mb-5">
                            <div class="col-lg-4">
                                <div class="service no-shadow align-items-center link horizontal d-flex active"
                                    data-aos="fade-left" data-aos-delay="0">
                                    <div class="service-icon color-1 mb-4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" />
                                        </svg>
                                    </div> <!-- /.icon -->
                                    <div class="service-contents">
                                        <p>Keangnam Landmark Tower 72 Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội</p>
                                    </div> <!-- /.service-contents-->
                                </div> <!-- /.service -->
                            </div>

                            <div class="col-lg-4">
                                <div class="service no-shadow align-items-center link horizontal d-flex active"
                                    data-aos="fade-left" data-aos-delay="0">
                                    <div class="service-icon color-1 mb-4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z" />
                                        </svg>
                                    </div> <!-- /.icon -->
                                    <div class="service-contents">
                                        <p>info@yourdomain.com</p>
                                    </div> <!-- /.service-contents-->
                                </div> <!-- /.service -->
                            </div>

                            <div class="col-lg-4">
                                <div class="service no-shadow align-items-center link horizontal d-flex active"
                                    data-aos="fade-left" data-aos-delay="0">
                                    <div class="service-icon color-1 mb-4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
                                        </svg>
                                    </div> <!-- /.icon -->
                                    <div class="service-contents">
                                        <p>+1 294 3925 3939</p>
                                    </div> <!-- /.service-contents-->
                                </div> <!-- /.service -->
                            </div>
                        </div>

                        @if(session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif
                        <form id="contactForm" action="{{ route('contact.store') }}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label class="text-black" for="first_name">First name</label>
                                        <input type="text" class="form-control" id="first_name" name="first_name" required>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label class="text-black" for="last_name">Last name</label>
                                        <input type="text" class="form-control" id="last_name" name="last_name" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label class="text-black" for="email">Email address</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label class="text-black" for="phone">Phone</label>
                                        <input type="text" class="form-control" id="phone" name="phone">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-4">
                                <label class="text-black" for="message">Message</label>
                                <textarea name="message" class="form-control" id="message" cols="30" rows="5"></textarea>
                            </div>
                            <div class="form-group mb-4">
                                <input type="checkbox" name="subscribe" value="1" id="subscribe">
                                <label for="subscribe">Tôi đồng ý nhận email khi có khuyến mãi và sản phẩm mới</label>
                            </div>
                            <button type="submit" class="btn btn-primary-hover-outline">Send Message</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- End Contact Form -->
@endsection
