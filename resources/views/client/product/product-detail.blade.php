@extends('client.layouts.app')

@section('content')
  <!-- Start Product Detail Section -->
  <div class="untree_co-section product-section">
    <div class="container">
      <div class="row">
        <!-- Product Images -->
        <div class="col-lg-6 mb-5">
          <div class="product-gallery">
            <div class="main-image mb-4">
              <img src="images/product-1.png" class="img-fluid" alt="Product Image">
            </div>
            <div class="thumbnail-images">
              <div class="row">
                <div class="col-3">
                  <img src="images/product-1.png" class="img-fluid thumbnail" alt="Thumbnail 1">
                </div>
                <div class="col-3">
                  <img src="images/product-2.png" class="img-fluid thumbnail" alt="Thumbnail 2">
                </div>
                <div class="col-3">
                  <img src="images/product-3.png" class="img-fluid thumbnail" alt="Thumbnail 3">
                </div>
                <div class="col-3">
                  <img src="images/product-1.png" class="img-fluid thumbnail" alt="Thumbnail 4">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Product Info -->
        <div class="col-lg-6">
          <div class="product-info">
            <h1 class="product-title">Nordic Chair</h1>
            <div class="product-price mb-4">
              <span class="current-price">$50.00</span>
              <span class="old-price">$70.00</span>
            </div>
            
            <div class="product-description mb-4">
              <p>Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>
            </div>

            <!-- Color Variants -->
            <div class="color-variants mb-4">
              <label class="form-label">Màu sắc:</label>
              <div class="color-options">
                <div class="color-option active" data-color="purple" style="background-color: #8A2BE2;"></div>
                <div class="color-option" data-color="black" style="background-color: #000000;"></div>
                <div class="color-option" data-color="gold" style="background-color: #FFD700;"></div>
                <div class="color-option" data-color="silver" style="background-color: #C0C0C0;"></div>
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
                <input type="number" id="quantity" class="form-control" value="1" min="1" readonly>
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

            <!-- Product Meta -->
            <div class="product-meta">
              <p><strong>SKU:</strong> <span>FUR-001</span></p>
              <p><strong>Category:</strong> <span>Chairs</span></p>
              <p><strong>Tags:</strong> <span>Chair, Nordic, Modern</span></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Product Tabs -->
      <div class="row mt-5">
        <div class="col-12">
          <div class="product-tabs">
            <ul class="nav nav-tabs" id="productTabs" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="description-tab" data-bs-toggle="tab" data-bs-target="#description" type="button" role="tab">Description</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="specifications-tab" data-bs-toggle="tab" data-bs-target="#specifications" type="button" role="tab">Specifications</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews" type="button" role="tab">Reviews</button>
              </li>
            </ul>
            <div class="tab-content" id="productTabsContent">
              <div class="tab-pane fade show active" id="description" role="tabpanel">
                <div class="p-4">
                  <p>Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>
                  <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.</p>
                </div>
              </div>
              <div class="tab-pane fade" id="specifications" role="tabpanel">
                <div class="p-4">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th>Material</th>
                        <td>Wood, Metal</td>
                      </tr>
                      <tr>
                        <th>Dimensions</th>
                        <td>80 x 50 x 90 cm</td>
                      </tr>
                      <tr>
                        <th>Weight</th>
                        <td>15 kg</td>
                      </tr>
                      <tr>
                        <th>Color</th>
                        <td>Multiple colors available</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="tab-pane fade" id="reviews" role="tabpanel">
                <div class="p-4">
                  <div class="review-item mb-4">
                    <div class="d-flex align-items-center mb-2">
                      <img src="images/person-1.png" alt="Reviewer" class="rounded-circle me-3" width="50">
                      <div>
                        <h5 class="mb-0">John Doe</h5>
                        <div class="text-warning">
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                        </div>
                      </div>
                    </div>
                    <p>Great product! The quality is excellent and it looks exactly like the pictures.</p>
                  </div>
                  <div class="review-item">
                    <div class="d-flex align-items-center mb-2">
                      <img src="images/person-1.png" alt="Reviewer" class="rounded-circle me-3" width="50">
                      <div>
                        <h5 class="mb-0">Jane Smith</h5>
                        <div class="text-warning">
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="fas fa-star"></i>
                          <i class="far fa-star"></i>
                        </div>
                      </div>
                    </div>
                    <p>Very comfortable and stylish. Would recommend!</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Related Products -->
      <div class="row mt-5">
        <div class="col-12">
          <h3 class="mb-4">Related Products</h3>
        </div>
        <div class="col-12 col-md-4 col-lg-3 mb-5">
          <a class="product-item" href="#">
            <img src="images/product-2.png" class="img-fluid product-thumbnail">
            <h3 class="product-title">Kruzo Aero Chair</h3>
            <strong class="product-price">$78.00</strong>
            <div class="product-icons">
              <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
              <span class="icon-heart"><i class="fas fa-heart"></i></span>
              <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
            </div>
          </a>
        </div>
        <div class="col-12 col-md-4 col-lg-3 mb-5">
          <a class="product-item" href="#">
            <img src="images/product-3.png" class="img-fluid product-thumbnail">
            <h3 class="product-title">Ergonomic Chair</h3>
            <strong class="product-price">$43.00</strong>
            <div class="product-icons">
              <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
              <span class="icon-heart"><i class="fas fa-heart"></i></span>
              <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
            </div>
          </a>
        </div>
        <div class="col-12 col-md-4 col-lg-3 mb-5">
          <a class="product-item" href="#">
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
        <div class="col-12 col-md-4 col-lg-3 mb-5">
          <a class="product-item" href="#">
            <img src="images/product-2.png" class="img-fluid product-thumbnail">
            <h3 class="product-title">Kruzo Aero Chair</h3>
            <strong class="product-price">$78.00</strong>
            <div class="product-icons">
              <span class="icon-add-to-cart"><i class="fas fa-cart-plus"></i></span>
              <span class="icon-heart"><i class="fas fa-heart"></i></span>
              <span class="icon-quick-view"><i class="fas fa-eye"></i></span>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
  <!-- End Product Detail Section -->

  <!-- Product Detail JavaScript -->
  <script>
    // Thumbnail click handler
    document.querySelectorAll('.thumbnail').forEach(thumb => {
      thumb.addEventListener('click', function() {
        const mainImage = document.querySelector('.main-image img');
        mainImage.src = this.src;
      });
    });

    // Color variant selection
    document.querySelectorAll('.color-option').forEach(option => {
      option.addEventListener('click', function() {
        document.querySelectorAll('.color-option').forEach(opt => opt.classList.remove('active'));
        this.classList.add('active');
      });
    });

    // Storage option selection
    document.querySelectorAll('.storage-btn').forEach(btn => {
      btn.addEventListener('click', function() {
        document.querySelectorAll('.storage-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
      });
    });

    // Quantity controls
    const quantityInput = document.getElementById('quantity');
    const minusBtn = document.querySelector('.quantity-btn.minus');
    const plusBtn = document.querySelector('.quantity-btn.plus');

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
    document.querySelector('.add-to-cart-btn').addEventListener('click', function() {
      const quantity = document.getElementById('quantity').value;
      const selectedColor = document.querySelector('.color-option.active').dataset.color;
      const selectedStorage = document.querySelector('.storage-btn.active').dataset.storage;
      
      alert(`Added to cart:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`);
    });

    // Add to wishlist button
    document.querySelector('.add-to-wishlist-btn').addEventListener('click', function() {
      this.classList.toggle('active');
      if (this.classList.contains('active')) {
        this.innerHTML = '<i class="fas fa-heart me-2"></i>Đã thêm vào yêu thích';
      } else {
        this.innerHTML = '<i class="fas fa-heart me-2"></i>Yêu thích';
      }
    });
  </script>
@endsection