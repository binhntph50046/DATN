@extends('client.layouts.app')

@section('title', 'Kết quả tìm kiếm: ' . $query)
@section('content')
    <div class="container py-4" style="margin-top:140px">
        <h2 class="mb-4">Kết quả tìm kiếm cho: <span class="text-primary">"{{ $query }}"</span></h2>
        @if ($products->count() > 0)
            <h4 class="mt-4">Sản phẩm</h4>
            <div class="row">
                @foreach ($products as $product)
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <a href="{{ route('product.detail', $product->slug) }}">
                                <img src="{{ $product->image_url ?? '/public/images/default.jpg' }}" class="card-img-top"
                                    alt="{{ $product->name }}">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">{{ $product->name }}</h5>
                                <p class="card-text text-danger fw-bold">{{ number_format($product->price) }} đ</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            {{ $products->appends(['q' => $query])->links() }}
        @else
            <p>Không tìm thấy sản phẩm phù hợp.</p>
        @endif

        @if ($blogs->count() > 0)
            <h4 class="mt-5">Bài viết liên quan</h4>
            <div class="row">
                @foreach ($blogs as $blog)
                    <div class="col-md-6 mb-3">
                        <div class="border rounded p-3 h-100">
                            <a href="{{ route('blog.show', $blog->slug) }}" class="fw-bold">{{ $blog->title }}</a>
                            <p class="mb-0 text-muted">{{ Str::limit(strip_tags($blog->content), 120) }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
            {{ $blogs->appends(['q' => $query])->links() }}
        @endif

        @if ($products->count() == 0 && $blogs->count() == 0)
            <div class="alert alert-warning mt-4">Không tìm thấy kết quả phù hợp.</div>
        @endif
    </div>
@endsection
