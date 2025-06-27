@extends('client.layouts.app')

@section('title', 'So Sánh Sản Phẩm - Apple Store')

@section('content')
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Start Compare Section -->
    <div class="compare-section py-5" data-aos="fade-up">
        <div class="container">
            <h2 class="section-title text-center mb-5">So Sánh Sản Phẩm</h2>

            <!-- Bảng so sánh -->
            @if ($comparison['products']->count() === 2)
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th style="width: 20%">Thông số</th>
                                @foreach ($comparison['products'] as $product)
                                    <th style="width: 40%">
                                        <div class="d-flex flex-column align-items-center">
                                            @php
                                                $images = json_decode($product->images, true) ?? [];
                                                $mainImage = !empty($images) ? $images[0] : 'uploads/default/default.jpg';
                                                if (!empty($mainImage) && !str_starts_with($mainImage, 'uploads/')) {
                                                    $mainImage = 'uploads/products/' . $mainImage;
                                                }
                                            @endphp
                                            <img src="{{ asset($mainImage) }}" alt="{{ $product->name }}" 
                                                style="width: 100px; height: 100px; object-fit: contain; margin-bottom: 10px;">
                                            <h5 class="mb-0">{{ $product->name }}</h5>
                                            @if ($product->variants->isNotEmpty())
                                                @php
                                                    $variant = $product->variants->first();
                                                @endphp
                                                <div class="mt-2">
                                                    @if ($variant->discount_price)
                                                        <span class="text-decoration-line-through text-muted">{{ number_format($variant->selling_price) }}đ</span>
                                                        <span class="text-danger ms-2">{{ number_format($variant->discount_price) }}đ</span>
                                                    @else
                                                        <span>{{ number_format($variant->selling_price) }}đ</span>
                                                    @endif
                                                </div>
                                            @endif
                                        </div>
                                    </th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($comparison['specs'] as $specName => $values)
                                <tr>
                                    <td class="fw-bold">{{ $specName }}</td>
                                    @foreach ($comparison['products'] as $product)
                                        <td class="text-center">{{ $values[$product->id] ?? 'N/A' }}</td>
                                    @endforeach
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <!-- Lời khuyên từ AI -->
                <div class="ai-advice mt-5 p-4 bg-light rounded shadow-sm" data-aos="fade-up" data-aos-delay="200">
                    <div class="d-flex align-items-center mb-3">
                        <i class="fas fa-robot text-primary me-2" style="font-size: 24px;"></i>
                        <h3 class="text-primary mb-0">Lời khuyên từ chúng tôi</h3>
                    </div>
                    <p class="lead mb-0" style="white-space: pre-line;">{{ $aiAdvice }}</p>
                </div>
            @else
                <div class="text-center">
                    <p class="text-danger mb-4">Vui lòng chọn chính xác 2 sản phẩm để so sánh.</p>
                    <a href="{{ route('home') }}" class="btn btn-primary">Quay lại trang chủ</a>
                </div>
            @endif

            <!-- Nút quay lại -->
            <div class="text-center mt-4">
                <a href="{{ route('home') }}" class="btn btn-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Quay lại Trang Chủ
                </a>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 800,
            once: false,
        });
    </script>

    <style>
        .compare-section {
            min-height: 70vh;
        }

        .section-title {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
        }

        .table {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        .table th,
        .table td {
            vertical-align: middle;
            padding: 1rem;
        }

        .table th {
            font-weight: 600;
        }

        .ai-advice {
            border-left: 4px solid #007bff;
        }

        .ai-advice .lead {
            font-size: 1.1rem;
            color: #555;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .table {
                font-size: 0.9rem;
            }

            .section-title {
                font-size: 1.5rem;
            }

            .ai-advice .lead {
                font-size: 1rem;
            }
        }
    </style>
@endsection 