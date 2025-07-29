<style>
.modern-footer {
    background: linear-gradient(to right, #1a1c2b, #16181f) !important;
    color: #ffffff !important;
    padding: 60px 0 20px !important;
    position: relative !important;
}

.footer-heading {
    font-size: 15px !important;
    font-weight: 600 !important;
    color: #ffffff !important;
    margin-bottom: 15px !important;
    position: relative !important;
    padding-bottom: 8px !important;
}

.footer-heading::after {
    content: '' !important;
    position: absolute !important;
    left: 0 !important;
    bottom: 0 !important;
    width: 25px !important;
    height: 2px !important;
    background: #60a5fa !important;
}

.footer-links {
    list-style: none !important;
    padding: 0 !important;
    margin: 0 !important;
}

.footer-links li {
    margin-bottom: 10px !important;
}

.footer-links a {
    color: rgba(255, 255, 255, 0.7) !important;
    text-decoration: none !important;
    transition: all 0.3s ease !important;
    font-size: 13px !important;
    display: flex !important;
    align-items: center !important;
    gap: 10px !important;
}

.footer-links a i {
    color: #60a5fa !important;
    font-size: 14px !important;
    width: 16px !important;
    text-align: center !important;
}

.footer-links a:hover {
    color: #ffffff !important;
    transform: translateX(5px) !important;
}

.footer-links a:hover i {
    color: #ffffff !important;
}

.contact-info {
    margin-top: 20px !important;
}

.contact-item {
    display: flex !important;
    align-items: center !important;
    gap: 10px !important;
    margin-bottom: 12px !important;
    color: rgba(255, 255, 255, 0.7) !important;
    font-size: 13px !important;
}

.contact-item i {
    color: #60a5fa !important;
    font-size: 14px !important;
    width: 16px !important;
    text-align: center !important;
}

.footer-subscribe {
    background: rgba(255, 255, 255, 0.03) !important;
    border: 1px solid rgba(255, 255, 255, 0.1) !important;
    padding: 20px !important;
    border-radius: 12px !important;
}

.footer-subscribe h3 {
    font-size: 16px !important;
    font-weight: 600 !important;
    color: #ffffff !important;
    margin-bottom: 10px !important;
}

.subscribe-form {
    display: flex !important;
    gap: 8px !important;
    margin-bottom: 20px !important;
}

.subscribe-form input {
    flex: 1 !important;
    background: rgba(255, 255, 255, 0.05) !important;
    border: 1px solid rgba(255, 255, 255, 0.1) !important;
    padding: 8px 15px !important;
    border-radius: 8px !important;
    color: #ffffff !important;
    font-size: 13px !important;
}

.subscribe-form input::placeholder {
    color: rgba(255, 255, 255, 0.5) !important;
}

.subscribe-form button {
    background: #60a5fa !important;
    color: #ffffff !important;
    border: none !important;
    padding: 8px 15px !important;
    border-radius: 8px !important;
    cursor: pointer !important;
    transition: all 0.3s ease !important;
}

.subscribe-form button:hover {
    background: #3b82f6 !important;
}

.social-icons {
    display: flex !important;
    gap: 10px !important;
    margin-bottom: 20px !important;
    visibility: visible !important;
    opacity: 1 !important;
}

.social-icons a {
    width: 35px !important;
    height: 35px !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    border-radius: 8px !important;
    color: #ffffff !important;
    transition: all 0.3s ease !important;
    visibility: visible !important;
    opacity: 1 !important;
    background-color: transparent !important;
    min-width: 35px !important;
    min-height: 35px !important;
    font-size: 16px !important;
}

.social-icons a i {
    font-size: 16px !important;
    color: #ffffff !important;
    display: block !important;
}

.social-icons a:nth-child(1) { background: #4267B2 !important; background-color: #4267B2 !important; }
.social-icons a:nth-child(2) { background: #0377cd !important; background-color: #0377cd !important; }
.social-icons a:nth-child(3) { background: #FF0000 !important; background-color: #FF0000 !important; }
.social-icons a:nth-child(4) { background: #000000 !important; background-color: #000000 !important; }
.social-icons a:nth-child(5) { background: linear-gradient(45deg, #405DE6, #E1306C, #FD1D1D) !important; background-color: #E1306C !important; }

.social-icons a:hover {
    transform: translateY(-2px) !important;
    filter: brightness(1.1) !important;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important;
    z-index: 10 !important;
}

.payment-icons {
    display: flex !important;
    gap: 10px !important;
    padding: 15px !important;
    background: rgba(255, 255, 255, 0.03) !important;
    border-radius: 8px !important;
    border: 1px solid rgba(255, 255, 255, 0.1) !important;
    visibility: visible !important;
    opacity: 1 !important;
}

.payment-icons a {
    width: 35px !important;
    height: 35px !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    border-radius: 6px !important;
    color: #ffffff !important;
    transition: all 0.3s ease !important;
    visibility: visible !important;
    opacity: 1 !important;
    background-color: transparent !important;
    min-width: 35px !important;
    min-height: 35px !important;
    font-size: 16px !important;
}

.payment-icons a i {
    font-size: 16px !important;
    color: #ffffff !important;
    display: block !important;
}

.payment-icons a:nth-child(1) { background: #1A1F71 !important; background-color: #1A1F71 !important; }
.payment-icons a:nth-child(2) { background: #EB001B !important; background-color: #EB001B !important; }
.payment-icons a:nth-child(3) { background: #006CB8 !important; background-color: #006CB8 !important; }
.payment-icons a:nth-child(4) { background: #40BA5E !important; background-color: #40BA5E !important; }
.payment-icons a:nth-child(5) { background: #5A31F4 !important; background-color: #5A31F4 !important; }

.payment-icons a:hover {
    transform: translateY(-2px) !important;
    filter: brightness(1.1) !important;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important;
    z-index: 10 !important;
}

.footer-bottom {
    margin-top: 40px !important;
    padding-top: 20px !important;
    border-top: 1px solid rgba(255, 255, 255, 0.1) !important;
}

.footer-bottom p {
    color: rgba(255, 255, 255, 0.6) !important;
    font-size: 13px !important;
    margin-bottom: 0 !important;
}

.footer-bottom a {
    color: #60a5fa !important;
    text-decoration: none !important;
}

.footer-bottom a:hover {
    color: #ffffff !important;
}

@media (max-width: 768px) {
    .modern-footer {
        padding: 40px 0 20px !important;
    }
    
    .footer-heading {
        margin-bottom: 12px !important;
    }
    
    .social-icons a,
    .payment-icons a {
        width: 32px !important;
        height: 32px !important;
    }
    
    .footer-subscribe {
        padding: 15px !important;
    }
}
</style>

<!-- Footer -->
<footer class="modern-footer">
    <div class="container">
        <div class="row">
            <!-- Logo và Thông tin -->
            <div class="col-lg-4 mb-4">
                <a href="/" class="d-block mb-4">
                    <img src="{{ asset('images/logo/apple-removebg-preview.png') }}" alt="Apple Store" height="40">
                </a>
                <p class="text-gray-400 mb-4">Chuyên cung cấp các sản phẩm Apple chính hãng với chất lượng cao cấp. Cam kết mang đến trải nghiệm tốt nhất cho khách hàng với dịch vụ tận tâm và chuyên nghiệp.</p>
                
                <div class="contact-info">
                    <div class="contact-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Trịnh Văn Bô, Hà Nội</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-phone-alt"></i>
                        <span>1900 1234 (8:00 - 21:00)</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-envelope"></i>
                        <span>admin@gmail.com</span>
                    </div>
                </div>
            </div>

            <!-- Menu Links -->
            <div class="col-lg-5">
                <div class="row">
                    <div class="col-sm-6 mb-4">
                        <h4 class="footer-heading">Hỗ trợ khách hàng</h4>
                        <ul class="footer-links">
                            <li><a href="/huong-dan-mua-hang"><i class="fas fa-shopping-cart"></i>Hướng dẫn mua hàng online</a></li>
                            <li><a href="/uu-dai-thanh-toan"><i class="fas fa-credit-card"></i>Ưu đãi thanh toán</a></li>
                            <li><a href="/chinh-sach-bao-hanh"><i class="fas fa-shield-alt"></i>Chính sách bảo hành, đổi trả</a></li>
                            <li><a href="/chinh-sach-tra-gop"><i class="fas fa-percentage"></i>Mua hàng trả góp 0%</a></li>
                            <li><a href="/chinh-sach-giao-hang"><i class="fas fa-truck"></i>Giao hàng & Thanh toán</a></li>
                            <li><a href="/chinh-sach-bao-mat"><i class="fas fa-user-shield"></i>Chính sách bảo mật</a></li>
                            <li><a href="/cau-hoi-thuong-gap"><i class="fas fa-question-circle"></i>Câu hỏi thường gặp</a></li>
                            <li><a href="{{ route('contact') }}"><i class="fas fa-headset"></i>Tư vấn hỗ trợ miễn phí</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <h4 class="footer-heading">Danh mục sản phẩm</h4>
                        <ul class="footer-links">
                            <li><a href="/shop/iphone-moi"><i class="fas fa-mobile-alt"></i>iPhone chính hãng VN/A</a></li>
                            <li><a href="/shop/iphone-cu"><i class="fas fa-sync"></i>iPhone đã kích hoạt</a></li>
                            <li><a href="/shop/mac"><i class="fas fa-laptop"></i>MacBook, iMac, Mac Mini</a></li>
                            <li><a href="/shop/ipad"><i class="fas fa-tablet-alt"></i>iPad các dòng</a></li>
                            <li><a href="/shop/apple-watch"><i class="fas fa-clock"></i>Apple Watch Series</a></li>
                            <li><a href="/shop/airpods"><i class="fas fa-headphones"></i>AirPods, EarPods</a></li>
                            <li><a href="/shop/phu-kien-apple"><i class="fas fa-magic"></i>Phụ kiện Apple chính hãng</a></li>
                            <li><a href="/shop/phu-kien"><i class="fas fa-plug"></i>Phụ kiện cao cấp</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Đăng ký nhận tin -->
            <div class="col-lg-3">
                <div class="footer-subscribe">
                    <h3>Đăng ký nhận tin</h3>
                    <p class="text-gray-400 mb-3">Nhận thông tin về sản phẩm mới và khuyến mãi hấp dẫn</p>
                    
                    <form action="{{ route('subscribe.store') }}" method="POST" class="subscribe-form">
                        @csrf
                        <input type="email" name="email" placeholder="Email của bạn" required>
                        <button type="submit">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </form>

                    <div class="social-icons">
                        <a href="#" title="Facebook">
                            <i class="fas fa-facebook-f"></i>
                        </a>
                        <a href="#" title="Zalo">
                            <i class="fas fa-comments"></i>
                        </a>
                        <a href="#" title="Youtube">
                            <i class="fas fa-play"></i>
                        </a>
                        <a href="#" title="TikTok">
                            <i class="fas fa-music"></i>
                        </a>
                        <a href="#" title="Instagram">
                            <i class="fas fa-camera"></i>
                        </a>
                    </div>

                    <div class="payment-icons">
                        <a href="#" title="Visa">
                            <i class="fas fa-credit-card"></i>
                        </a>
                        <a href="#" title="Mastercard">
                            <i class="fas fa-university"></i>
                        </a>
                        <a href="#" title="JCB">
                            <i class="fas fa-id-card"></i>
                        </a>
                        <a href="#" title="Ví điện tử">
                            <i class="fas fa-wallet"></i>
                        </a>
                        <a href="#" title="QR Code">
                            <i class="fas fa-qrcode"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="mb-0">©Copyright 2025 Apple Store.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="mb-0">
                        <a href="/dieu-khoan-su-dung">Điều khoản sử dụng</a> |
                        <a href="/chinh-sach-bao-mat">Chính sách bảo mật</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>

