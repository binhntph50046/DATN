<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="/images/iphone.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />

	<!-- Bootstrap CSS -->
	<link href="{{ asset('css/bootstrap.min.css')}}" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<link href="{{ asset('css/tiny-slider.css')}}" rel="stylesheet">
	<link href="{{ asset('css/style.css')}}" rel="stylesheet">
	<title>@yield('title')</title>
</head>

<body>

    @include('client.partials.header')

    @yield('content')
    
    @include('client.partials.footer')


	<script src="{{ asset('js/bootstrap.bundle.min.js')}}"></script>
	<script src="{{ asset('js/tiny-slider.js')}}"></script>
	<script src="{{ asset('js/custom.js')}}"></script>

	<!-- Inline JavaScript for Icon Functionality -->
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
		document.addEventListener('DOMContentLoaded', function () {
			// Thumbnail click handler
			document.querySelectorAll('#quickViewModal .thumbnail').forEach(thumb => {
				thumb.addEventListener('click', function () {
					const mainImage = document.querySelector('#quickViewModal .quick-view-image');
					mainImage.src = this.src;
				});
			});

			// Color variant selection
			document.querySelectorAll('#quickViewModal .color-option').forEach(option => {
				option.addEventListener('click', function () {
					document.querySelectorAll('#quickViewModal .color-option').forEach(opt => opt.classList.remove('active'));
					this.classList.add('active');
				});
			});

			// Storage option selection
			document.querySelectorAll('#quickViewModal .storage-btn').forEach(btn => {
				btn.addEventListener('click', function () {
					document.querySelectorAll('#quickViewModal .storage-btn').forEach(b => b.classList.remove('active'));
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
			document.querySelector('#quickViewModal .btn-outline-primary').addEventListener('click', function () {
				const quantity = document.getElementById('quickViewQuantity').value;
				const selectedColor = document.querySelector('#quickViewModal .color-option.active').dataset.color;
				const selectedStorage = document.querySelector('#quickViewModal .storage-btn.active').dataset.storage;

				alert(`Added to cart:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`);
			});

			// Buy now button
			document.querySelector('#quickViewModal .btn-primary').addEventListener('click', function () {
				const quantity = document.getElementById('quickViewQuantity').value;
				const selectedColor = document.querySelector('#quickViewModal .color-option.active').dataset.color;
				const selectedStorage = document.querySelector('#quickViewModal .storage-btn.active').dataset.storage;

				alert(`Proceeding to checkout:\nQuantity: ${quantity}\nColor: ${selectedColor}\nStorage: ${selectedStorage}GB`);
			});
		});
	</script>

	<!-- Quick View Modal -->
	<div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel" aria-hidden="true">
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
							<p class="quick-view-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

							<!-- Color Variants -->
							<div class="color-variants mb-4">
								<label class="form-label">Màu sắc:</label>
								<div class="color-options">
									<div class="color-option active" data-color="purple"
										style="background-color: #8A2BE2;"></div>
									<div class="color-option" data-color="black" style="background-color: #000000;">
									</div>
									<div class="color-option" data-color="gold" style="background-color: #FFD700;">
									</div>
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
									<input type="number" id="quickViewQuantity" class="form-control" value="1" min="1"
										readonly>
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
</body>

</html>