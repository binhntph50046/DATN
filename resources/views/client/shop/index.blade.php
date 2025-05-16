@extends('client.layouts.app')

@section('content')
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Start Shop Section -->
    <div class="untree_co-section product-section">
        <div class="container">
            <div class="row" data-aos="fade-up">
                <h2 class="mb-3 text-black">Most Popular Products</h2>
                <div class="product-slider">
                    <!-- Product Item 1 -->
                    <div class="product-item product-carousel" data-category="chairs" data-aos="fade-up" data-aos-delay="100">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Nordic Chair">
                            <h3 class="product-title">Nordic Chair</h3>
                            <strong class="product-price">$50.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 2 -->
                    <div class="product-item product-carousel" data-category="tables" data-aos="fade-up" data-aos-delay="200">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Kruzo Aero Table">
                            <h3 class="product-title">Kruzo Aero Table</h3>
                            <strong class="product-price">$78.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 3 -->
                    <div class="product-item product-carousel" data-category="sofas" data-aos="fade-up" data-aos-delay="300">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Ergonomic Sofa">
                            <h3 class="product-title">Ergonomic Sofa</h3>
                            <strong class="product-price">$43.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 4 -->
                    <div class="product-item product-carousel" data-category="lighting" data-aos="fade-up" data-aos-delay="400">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Modern Lamp">
                            <h3 class="product-title">Modern Lamp</h3>
                            <strong class="product-price">$65.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 5 -->
                    <div class="product-item product-carousel" data-category="decor" data-aos="fade-up" data-aos-delay="500">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Wall Decor">
                            <h3 class="product-title">Wall Decor</h3>
                            <strong class="product-price">$25.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 6 -->
                    <div class="product-item product-carousel" data-category="chairs" data-aos="fade-up" data-aos-delay="600">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Minimal Chair">
                            <h3 class="product-title">Minimal Chair</h3>
                            <strong class="product-price">$55.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 7 -->
                    <div class="product-item product-carousel" data-category="tables" data-aos="fade-up" data-aos-delay="700">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Wooden Table">
                            <h3 class="product-title">Wooden Table</h3>
                            <strong class="product-price">$90.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                    <!-- Product Item 8 -->
                    <div class="product-item product-carousel" data-category="sofas" data-aos="fade-up" data-aos-delay="800">
                        <a href="product-detail.html">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail" alt="Luxury Sofa">
                            <h3 class="product-title">Luxury Sofa</h3>
                            <strong class="product-price">$120.00</strong>
                            <div class="product-icons">
                                <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row" data-aos="fade-up" data-aos-delay="200">
                <h2 class="my-3 text-black">List Products</h2>
                <!-- Products Grid -->
                <div class="col-lg-9">
                    <div class="row">
                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="chairs" data-aos="fade-up" data-aos-delay="100">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-1.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Nordic Chair</h3>
                                <strong class="product-price">$50.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="tables" data-aos="fade-up" data-aos-delay="200">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-2.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Kruzo Aero Table</h3>
                                <strong class="product-price">$78.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="300">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="400">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="500">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="600">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="700">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="800">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="900">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Product Item -->
                        <div class="col-12 col-md-3 col-lg-3 mb-5" data-category="sofas" data-aos="fade-up" data-aos-delay="1000">
                            <a class="product-item" href="product-detail.html">
                                <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                <h3 class="product-title">Ergonomic Sofa</h3>
                                <strong class="product-price">$43.00</strong>
                                <div class="product-icons">
                                    <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
                                    <span class="icon-heart"><i class="fas fa-heart"></i></span>
                                    <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
                                </div>
                            </a>
                        </div>

                        <!-- Add more product items here -->
                    </div>
                </div>

                <!-- Categories Sidebar -->
                <div class="col-lg-3" data-aos="fade-left" data-aos-delay="300">
                    <div class="categories-sidebar">
                        <h3 class="mb-4">Danh mục sản phẩm</h3>
                        <ul class="list-unstyled categories-list">
                            <li class="active"><a href="#" data-category="all">Tất cả sản phẩm</a></li>
                            <li><a href="#" data-category="chairs">Ghế</a></li>
                            <li><a href="#" data-category="tables">Bàn</a></li>
                            <li><a href="#" data-category="sofas">Sofa</a></li>
                            <li><a href="#" data-category="lighting">Đèn</a></li>
                            <li><a href="#" data-category="decor">Trang trí</a></li>
                        </ul>

                        <div class="price-filter mt-4">
                            <h3 class="mb-4">Lọc theo giá</h3>
                            <div class="price-range">
                                <input type="range" class="form-range" min="0" max="1000" step="10"
                                    id="priceRange">
                                <div class="price-inputs d-flex justify-content-between mt-2">
                                    <input type="number" class="form-control" id="minPrice" placeholder="Min">
                                    <span class="mx-2">-</span>
                                    <input type="number" class="form-control" id="maxPrice" placeholder="Max">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Section -->

    <!-- Quick View Modal -->
    <div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="quickViewModalLabel">Quick View</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="product-gallery">
                                <div class="main-image mb-4">
                                    <img src="" class="img-fluid quick-view-image" alt="Product Image">
                                </div>
                                <div class="thumbnail-images">
                                    <div class="row">
                                        <div class="col-3">
                                            <img src="images/product-1.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 1">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-2.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 2">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-3.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 3">
                                        </div>
                                        <div class="col-3">
                                            <img src="images/product-1.png" class="img-fluid thumbnail"
                                                alt="Thumbnail 4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3 class="quick-view-title"></h3>
                            <p class="quick-view-price"></p>
                            <p class="quick-view-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
                                do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.</p>

                            <!-- Color Variants -->
                            <div class="color-variants mb-4">
                                <label class="form-label">Màu sắc:</label>
                                <div class="color-options">
                                    <div class="color-option active" data-color="purple"
                                        style="background-color: #8A2BE2;"></div>
                                    <div class="color-option" data-color="black" style="background-color: #000000;">
                                    </div>
                                    <div class="color-option" data-color="gold" style="background-color: #FFD700;"></div>
                                    <div class="color-option" data-color="silver" style="background-color: #C0C0C0;">
                                    </div>
                                </div>
                            </div>

                            <!-- Storage Options -->
                            <div class="storage-options mb-4">
                                <label class="form-label">Dung lượng:</label>
                                <div class="storage-buttons">
                                    <button class="storage-btn active" data-storage="128">128GB</button>
                                    <button class="storage-btn" data-storage="256">256GB</button>
                                    <button class="storage-btn" data-storage="512">512GB</button>
                                    <button class="storage-btn" data-storage="1024">1TB</button>
                                </div>
                            </div>

                            <!-- Quantity Selector -->
                            <div class="quantity-selector mb-4">
                                <label class="form-label">Số lượng:</label>
                                <div class="quantity-control">
                                    <button class="quantity-btn minus">-</button>
                                    <input type="number" id="quickViewQuantity" class="form-control" value="1"
                                        min="1" readonly>
                                    <button class="quantity-btn plus">+</button>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="product-actions mb-4">
                                <button class="btn btn-primary">
                                    <i class="fas fa-bolt me-2"></i>Mua ngay
                                </button>
                                <button class="btn btn-outline-primary">
                                    <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Inline JavaScript for Icon Functionality -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Slick JS -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.product-slider').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true, 
                autoplaySpeed: 2500,
                arrows: true,
                dots: true, 
                responsive: [{
                        breakpoint: 768, 
                        settings: {
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 480, 
                        settings: {
                            slidesToShow: 1
                        }
                    }
                ]
            });
        });
    </script>
    <script>
        document.querySelectorAll('.product-item').forEach(item => {
            item.querySelector('.icon-add-to-cart').addEventListener('click', (e) => {
                e.preventDefault();
                alert('Added to Cart: ' + item.querySelector('.product-title').textContent);
            });

            item.querySelector('.icon-heart').addEventListener('click', (e) => {
                e.preventDefault();
                alert('Added to Wishlist: ' + item.querySelector('.product-title').textContent);
            });

            item.querySelector('.icon-quick-view').addEventListener('click', (e) => {
                e.preventDefault();
                const modal = new bootstrap.Modal(document.getElementById('quickViewModal'));

                // Get product details
                const productImage = item.querySelector('.product-thumbnail').src;
                const productTitle = item.querySelector('.product-title').textContent;
                const productPrice = item.querySelector('.product-price').textContent;

                // Update modal content
                document.querySelector('.quick-view-image').src = productImage;
                document.querySelector('.quick-view-title').textContent = productTitle;
                document.querySelector('.quick-view-price').textContent = productPrice;

                // Update thumbnails
                const thumbnails = document.querySelectorAll('#quickViewModal .thumbnail');
                thumbnails[0].src = productImage;
                thumbnails[1].src = 'images/product-2.png';
                thumbnails[2].src = 'images/product-3.png';
                thumbnails[3].src = 'images/product-1.png';

                // Show modal
                modal.show();
            });
        });

        // Quick View Modal Functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Thumbnail click handler
            document.querySelectorAll('#quickViewModal .thumbnail').forEach(thumb => {
                thumb.addEventListener('click', function() {
                    const mainImage = document.querySelector('#quickViewModal .quick-view-image');
                    mainImage.src = this.src;
                });
            });

            // Color variant selection
            document.querySelectorAll('#quickViewModal .color-option').forEach(option => {
                option.addEventListener('click', function() {
                    document.querySelectorAll('#quickViewModal .color-option').forEach(opt => opt
                        .classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Storage option selection
            document.querySelectorAll('#quickViewModal .storage-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    document.querySelectorAll('#quickViewModal .storage-btn').forEach(b => b
                        .classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Quantity controls
            const quantityInput = document.getElementById('quickViewQuantity');
            const minusBtn = document.querySelector('#quickViewModal .quantity-btn.minus');
            const plusBtn = document.querySelector('#quickViewModal .quantity-btn.plus');

            minusBtn.addEventListener('click', () => {
                const currentValue = parseInt(quantityInput.value);
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                }
            });

            plusBtn.addEventListener('click', () => {
                const currentValue = parseInt(quantityInput.value);
                quantityInput.value = currentValue + 1;
            });

            // Add to cart button
            document.querySelector('#quickViewModal .btn-outline-primary').addEventListener('click', function() {
                const quantity = document.getElementById('quickViewQuantity').value;
                const selectedColor = document.querySelector('#quickViewModal .color-option.active').dataset
                    .color;
                const selectedStorage = document.querySelector('#quickViewModal .storage-btn.active')
                    .dataset.storage;

                alert(
                    `Added to cart:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`);
            });

            // Buy now button
            document.querySelector('#quickViewModal .btn-primary').addEventListener('click', function() {
                const quantity = document.getElementById('quickViewQuantity').value;
                const selectedColor = document.querySelector('#quickViewModal .color-option.active').dataset
                    .color;
                const selectedStorage = document.querySelector('#quickViewModal .storage-btn.active')
                    .dataset.storage;

                alert(
                    `Proceeding to checkout:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`);
            });
        });
    </script>

    <!-- Shop Page JavaScript -->
    <script>
        // Category filter
        document.querySelectorAll('.categories-list a').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const category = this.dataset.category;

                // Update active state
                document.querySelectorAll('.categories-list li').forEach(li => li.classList.remove(
                    'active'));
                this.parentElement.classList.add('active');

                // Filter products - only in List Products section
                document.querySelectorAll('.col-lg-9 .product-item').forEach(product => {
                    if (category === 'all' || product.closest('[data-category]').dataset
                        .category === category) {
                        product.closest('[data-category]').style.display = 'block';
                    } else {
                        product.closest('[data-category]').style.display = 'none';
                    }
                });
            });
        });

        // Price filter
        const priceRange = document.getElementById('priceRange');
        const minPrice = document.getElementById('minPrice');
        const maxPrice = document.getElementById('maxPrice');

        priceRange.addEventListener('input', function() {
            maxPrice.value = this.value;
            filterByPrice();
        });

        minPrice.addEventListener('input', filterByPrice);
        maxPrice.addEventListener('input', filterByPrice);

        function filterByPrice() {
            const min = parseFloat(minPrice.value) || 0;
            const max = parseFloat(maxPrice.value) || 1000;

            // Only filter products in List Products section
            document.querySelectorAll('.col-lg-9 .product-item').forEach(product => {
                const price = parseFloat(product.querySelector('.product-price').textContent.replace('$', ''));
                if (price >= min && price <= max) {
                    product.closest('[data-category]').style.display = 'block';
                } else {
                    product.closest('[data-category]').style.display = 'none';
                }
            });
        }
    </script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init({
      duration:1700, // values from 0 to 3000, with step 50ms
      once: false, // whether animation should happen only once - while scrolling down
    });
  </script>
@endsection