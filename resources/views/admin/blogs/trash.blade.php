@extends('admin.layouts.app')
@section('title', 'Trash blogs')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4>Trash Blogs</h4>
                <a href="{{ route('admin.blogs.index') }}" class="btn btn-secondary">Quay lại danh sách</a>
            </div>

            <div class="row g-4">
                @foreach ($blogs as $blog)
                    <div class="col-md-4">
                        <div class="card">
                            @if ($blog->image)
                                <img src="{{ asset($blog->image) }}" class="card-img-top" alt="">
                            @endif
                            <div class="card-body">
                                <h6>{{ $blog->title }}</h6>
                                <p><small>Đã xóa: {{ $blog->deleted_at->format('d/m/Y H:i') }}</small></p>
                                <div class="d-flex gap-2">
                                    <form action="{{ route('admin.blogs.restore', $blog->id) }}" method="POST">
                                        @csrf @method('PUT')
                                        <button class="btn btn-sm btn-success">restore</button>
                                    </form>
                                    <form action="{{ route('admin.blogs.forceDelete', $blog->id) }}" method="POST"
                                        onsubmit="return confirm('Xóa vĩnh viễn?')">
                                        @csrf @method('DELETE')
                                        <button class="btn btn-sm btn-danger">Delete permanently</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="mt-4">
                {{ $blogs->links() }}
            </div>
        </div>
    </div>
@endsection
