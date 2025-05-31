@extends('client.layouts.app')

@section('title', 'Danh sách yêu thích - Apple Store')

@section('content')
<!-- Main container với padding top đủ lớn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<div class="apple-wishlist-container" style="padding-top: 150px;">
    <!-- Header cố định -->
    <header class="apple-wishlist-header">
        <div class="container">
            <h1>
                <i class="bi bi-heart-fill"></i> Danh sách yêu thích
            </h1>
        </div>
    </header>

    <!-- Nội dung chính -->
    <main class="apple-wishlist-main">
        @if($wishlists->isEmpty())
        <div class="empty-wishlist">
            <i class="bi bi-heart"></i>
            <h3>Danh sách trống</h3>
            <p>Bạn chưa thêm sản phẩm nào vào wishlist</p>
            <a href="{{ route('home') }}" class="btn-shop-now">
                <i class="bi bi-bag"></i> Mua sắm ngay
            </a>
        </div>
        @else
        <div class="wishlist-products">
            @foreach($wishlists as $wishlist)
            @php
                $product = $wishlist->product;
                $variant = $product->variants->first();
                $image = $variant->images ? json_decode($variant->images)[0] : 'uploads/default.jpg';
                $hasDiscount = $variant->discount_price && $variant->discount_price < $variant->selling_price;
            @endphp
            
            <div class="product-card">
                <!-- Nút xóa bằng icon thùng rác -->
                <button class="remove-btn" onclick="event.preventDefault(); document.getElementById('remove-form-{{$product->id}}').submit()" title="Xóa khỏi danh sách">
                    <i class="bi bi-trash"></i>
                </button>
                <form id="remove-form-{{$product->id}}" action="{{ route('wishlist.remove', $product->id) }}" method="POST" style="display: none;">
                    @csrf
                    @method('DELETE')
                </form>
                
                <a href="{{ route('product.detail', $product->slug) }}" class="product-link">
                    <div class="product-image">
                        <img src="{{ asset($image) }}" alt="{{ $product->name }}">
                    </div>
                    <div class="product-info">
                        <h3>{{ $product->name }}</h3>
                        <div class="price">
                            @if($hasDiscount)
                                <span class="current-price">{{ number_format($variant->discount_price) }}₫</span>
                                <span class="old-price">{{ number_format($variant->selling_price) }}₫</span>
                            @else
                                <span class="current-price">{{ number_format($variant->selling_price) }}₫</span>
                            @endif
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
        @endif
    </main>
</div>

<style>
/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Container chính */
.apple-wishlist-container {
    max-width: 1200px;
    margin: 0 auto;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

/* Header cố định */
.apple-wishlist-header {
    margin-top: 80px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: white;
    z-index: 1000;
    padding: 15px 0;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.apple-wishlist-header h1 {
    font-size: 24px;
    font-weight: 600;
    color: #000;
    display: flex;
    align-items: center;
    gap: 10px;
}

.apple-wishlist-header i {
    color: #ff3b30;
}

/* Nội dung chính */
.apple-wishlist-main {
    padding: 20px;
}

/* Trạng thái trống */
.empty-wishlist {
    text-align: center;
    padding: 50px 20px;
    margin-top: 20px;
}

.empty-wishlist i {
    font-size: 60px;
    color: #86868b;
    margin-bottom: 20px;
}

.empty-wishlist h3 {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 10px;
}

.empty-wishlist p {
    color: #86868b;
    margin-bottom: 25px;
}

/* Danh sách sản phẩm */
.wishlist-products {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 20px;
}

/* Card sản phẩm */
.product-card {
    position: relative;
    border-radius: 12px;
    overflow: hidden;
    background: #fff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
    border: 1px solid #eee;
}

/* Hiệu ứng hover cho sản phẩm */
.product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    border-color: #0071e3;
}

.product-card:hover .product-info h3 {
    color: #0071e3;
}

.remove-btn {
    position: absolute;
    top: 15px;
    left: 15px;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.9); /* Nền trắng trong suốt */
    border: 1px solid #e0e0e0; /* Thêm border */
    color: #333; /* Màu icon xám */
    font-size: 18px;
    cursor: pointer;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.2s ease;
}

.remove-btn:hover {
    background: #f8f8f8; /* Màu nền hover */
    color: #ff3b30; /* Đổi màu icon sang đỏ khi hover */
    transform: scale(1.1);
    border-color: #ff3b30; /* Border đỏ khi hover */
}

/* Link sản phẩm */
.product-link {
    text-decoration: none;
    color: inherit;
    display: block;
    padding: 15px;
    transition: all 0.2s ease;
}

.product-image {
    height: 200px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px;
    transition: all 0.3s ease;
}

.product-card:hover .product-image {
    transform: scale(1.03);
}

.product-image img {
    max-height: 100%;
    max-width: 100%;
    object-fit: contain;
    transition: all 0.3s ease;
}

.product-info {
    padding: 0 10px 15px;
}

.product-info h3 {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 12px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    transition: color 0.2s ease;
}

.price {
    display: flex;
    align-items: center;
    gap: 8px;
}

.current-price {
    font-size: 18px;
    font-weight: 600;
    color: #000;
}

.old-price {
    font-size: 14px;
    color: #86868b;
    text-decoration: line-through;
}

/* Nút mua sắm */
.btn-shop-now {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background: #0071e3;
    color: white;
    border-radius: 25px;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.2s ease;
}

.btn-shop-now:hover {
    background: #0062c4;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 113, 227, 0.3);
}

/* Responsive */
@media (max-width: 768px) {
    .apple-wishlist-container {
        padding-top: 70px;
    }
    
    .wishlist-products {
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 15px;
    }
    
    .apple-wishlist-header h1 {
        font-size: 20px;
    }
    
    .remove-btn {
        width: 36px;
        height: 36px;
        font-size: 16px;
    }
    
    .product-image {
        height: 180px;
    }
}
</style>