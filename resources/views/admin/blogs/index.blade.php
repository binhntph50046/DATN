@extends('admin.layouts.app')

@section('title', 'Danh sách blog')

@section('content')
    <div class="pc-container">
        <div class="pc-content">

            <!-- Form lọc -->
            <form action="{{ route('admin.blogs.index') }}" method="GET" class="row g-3 mb-4">
                <div class="col-md-4">
                    <label for="category_id" class="form-label">Danh mục</label>
                    <select name="category_id" id="category_id" class="form-select">
                        <option value="">-- Tất cả --</option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}" {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                {{ $category->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="author_id" class="form-label">Tác giả</label>
                    <select name="author_id" id="author_id" class="form-select">
                        <option value="">-- Tất cả --</option>
                        @foreach ($authors as $author)
                            <option value="{{ $author->id }}" {{ request('author_id') == $author->id ? 'selected' : '' }}>
                                {{ $author->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary me-2">
                        <i class="ti ti-filter"></i> Lọc
                    </button>
                    <a href="{{ route('admin.blogs.index') }}" class="btn btn-outline-secondary">
                        <i class="ti ti-refresh"></i> Đặt lại
                    </a>
                </div>
            </form>

            <!-- Tiêu đề và nút thao tác -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="mb-0">Danh sách bài viết</h4>
                <div class="d-flex gap-2">
                    <a href="{{ route('admin.blogs.trash') }}" class="btn btn-outline-secondary d-flex align-items-center gap-2">
                        <i class="ti ti-trash"></i>
                        <span>Thùng rác</span>
                    </a>
                    <a href="{{ route('admin.blogs.create') }}" class="btn btn-primary d-flex align-items-center gap-2">
                        <i class="ti ti-plus"></i>
                        <span>Thêm bài viết</span>
                    </a>
                </div>
            </div>

            <!-- Thông báo thành công -->
            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            <!-- Bảng danh sách bài viết -->
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th style="width: 5%">#</th>
                                    <th style="width: 20%">Tiêu đề</th>
                                    <th style="width: 15%">Hình ảnh</th>
                                    <th style="width: 15%">Danh mục</th>
                                    <th style="width: 15%">Tác giả</th>
                                    <th style="width: 10%">Trạng thái</th>
                                    <th style="width: 20%">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($blogs as $index => $blog)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>
                                            <a href="{{ route('admin.blogs.show', $blog->id) }}" class="text-primary fw-bold">
                                                {{ Str::limit($blog->title, 50) }}
                                            </a>
                                        </td>
                                        <td>
                                            @if ($blog->image)
                                                @php
                                                    $filename = basename($blog->image);
                                                    $url = asset('uploads/blogs/' . $filename);
                                                @endphp
                                                <img src="{{ $url }}" alt="{{ $blog->title }}"
                                                    style="width: 80px; height: 50px; object-fit: cover;">
                                            @else
                                                <span>Không có</span>
                                            @endif
                                        </td>
                                        <td>{{ $blog->category->name ?? 'Chưa có' }}</td>
                                        <td>{{ $blog->author->name ?? 'Admin' }}</td>
                                        <td>
                                            <span class="badge {{ $blog->status == 'publish' ? 'bg-success' : 'bg-warning' }}">
                                                {{ $blog->status ?? 'Lỗi trạng thái' }}
                                            </span>
                                        </td>
                                        <td>
                                            <div class="d-flex gap-2">
                                                <a href="{{ route('admin.blogs.show', $blog->id) }}"
                                                    class="btn btn-sm btn-info d-flex align-items-center gap-1">
                                                    <i class="ti ti-search"></i> Xem
                                                </a>
                                                <a href="{{ route('admin.blogs.edit', $blog->id) }}"
                                                    class="btn btn-sm btn-warning d-flex align-items-center gap-1">
                                                    <i class="ti ti-edit"></i> Sửa
                                                </a>
                                                <form action="{{ route('admin.blogs.destroy', $blog->id) }}" method="POST"
                                                    onsubmit="return confirm('Bạn có chắc muốn xoá bài viết này không?')">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger d-flex align-items-center gap-1">
                                                        <i class="ti ti-trash"></i> Xoá
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7" class="text-center text-muted">Không có bài viết nào phù hợp.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    {{-- Nếu có phân trang --}}
                    {{-- {{ $blogs->appends(request()->query())->links() }} --}}
                </div>
            </div>
        </div>
    </div>
@endsection
