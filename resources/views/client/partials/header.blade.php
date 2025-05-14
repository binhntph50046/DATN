 <!-- Start Header/Navigation -->
 <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

     <div class="container">
         <a class="navbar-brand" href="{{ route('home') }}">Apple Store<span>.</span></a>

         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
             aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarsFurni">
             <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
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

             <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                 <li>
                     <a class="nav-link" href="#"><i class="fas fa-heart"></i></a>
                 </li>

                 <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                         data-bs-toggle="dropdown" aria-expanded="false">
                         <i class="fas fa-user ms-2"></i>
                     </a>
                     <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                         @guest
                             <li><a class="dropdown-item" href="#">Register</a></li>
                             <li><a class="dropdown-item" href="#">Login</a></li>
                         @else
                             <li><a class="dropdown-item" href="#">Profile</a></li>
                             <li><a class="dropdown-item" href="#">Order History</a></li>
                             <li>
                                 <form action="{{ route('logout') }}" method="POST" class="dropdown-item m-0 p-0">
                                     @csrf
                                     <button type="submit" class="btn btn-link dropdown-item text-start">Logout</button>
                                 </form>
                             </li>
                         @endguest
                     </ul>
                 </li>

                 <li>
                     <a class="nav-link" href="{{ route('cart') }}"><i class="fas fa-cart-shopping"></i></a>
                 </li>
             </ul>

         </div>
     </div>

 </nav>
 <!-- End Header/Navigation -->

 <!-- Start Hero Section -->
 <div class="hero">
     <div class="container">
         <div class="row justify-content-between">
             <div class="col-lg-5">
                 <div class="intro-excerpt">
                     <h1>Modern Interior <span clsas="d-block">Design Studio</span></h1>
                     <p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                         vulputate velit imperdiet dolor tempor tristique.</p>
                     <p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#"
                             class="btn btn-white-outline">Explore</a></p>
                 </div>
             </div>
             {{-- <div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="images/couch.png" class="img-fluid">
					</div>
				</div> --}}
         </div>
     </div>
 </div>
 <!-- End Hero Section -->
