 <!-- Start Header/Navigation -->
 <nav class="custom-navbar navbar navbar navbar-expand-md  fixed-top navbar-dark bg-dark"
     arial-label="Furni navigation bar">

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

 <!-- Start Banner -->
 @yield('banner')
 <!-- End Banner -->

 <!-- End Hero Section -->
