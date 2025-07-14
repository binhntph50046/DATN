@extends('client.layouts.app')
@section('title', 'Bài viết - Apple Store')

@section('content')
    <!-- Shop Banner -->
    <div class="shop-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 data-aos="fade-up">Bài viết</h1>
                    <!-- Breadcrumbs -->
                    <div class="breadcrumbs" data-aos="fade-up" data-aos-delay="200">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Bài viết</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Blog Section -->
    <div class="blog-section">
        <div class="container">
            <div class="row">
                @foreach($blogs as $blog)
                    <div class="col-12 col-sm-6 col-md-4 mb-5">
                        <div class="post-entry">
                            <a href="{{ route('blog.show',$blog->slug) }}" class="post-thumbnail"><img src="{{ asset($blog->image) }}" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">{{ $blog->title }}</a></h3>
                                <div class="meta">
                                    <span>by <a href="#">{{ $blog->author->name }}</a></span> 
                                    <span>on <a href="#">{{ $blog->created_at->format('M d, Y') }}</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    <!-- End Blog Section -->

    <!-- Start Testimonial Slider -->
    <div class="testimonial-section before-footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 mx-auto text-center">
                    <h2 class="section-title">Testimonials</h2>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="testimonial-slider-wrap text-center">
                        <div id="testimonial-nav">
                            <span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
                            <span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
                        </div>

                        <div class="testimonial-slider">
                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>“Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.”</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->

                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>“Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.”</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->

                            <div class="item">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="testimonial-block text-center d-flex justify-content-center">
                                            <div class="author-info col-lg-4">
                                                <div class="author-pic">
                                                    <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                </div>
                                                <h3 class="font-weight-bold">Maria Jones</h3>
                                                <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                            </div>
                                            <blockquote class="mb-5 col-lg-8">
                                                <p>“Donec facilisis quam ut purus rutrum lobortis. Donec vitae
                                                    odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                                                    vulputate velit imperdiet dolor tempor tristique. Pellentesque
                                                    habitant morbi tristique senectus et netus et malesuada fames ac
                                                    turpis egestas. Integer convallis volutpat dui quis
                                                    scelerisque.”</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Testimonial Slider -->
@endsection