@extends('admin.layouts.app')

@section('title', 'List Blogs')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
</style>

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Blogs</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item" aria-current="page">Blogs</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->

            <!-- [ Main Content ] start -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5>Blogs List</h5>
                            <div>
                                <a href="{{ route('admin.blogs.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                    <i class="ti ti-trash"></i> Trash
                                </a>
                                <a href="{{ route('admin.blogs.create') }}" class="btn btn-primary btn-sm rounded-3">
                                    <i class="ti ti-plus"></i> Add New Blog
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            <!-- Bộ lọc tìm kiếm -->
                            <div class="card custom-shadow mb-4">
                                <div class="card-body">
                                    <form action="{{ route('admin.blogs.index') }}" method="GET" class="row g-3">
                                        <div class="col-md-4">
                                            <label for="category_id" class="form-label mb-1">Category</label>
                                            <select name="category_id" id="category_id" class="form-select form-select-sm">
                                                <option value="">-- all --</option>
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}"
                                                        {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="author_id" class="form-label mb-1">Author</label>
                                            <select name="author_id" id="author_id" class="form-select form-select-sm">
                                                <option value="">-- all --</option>
                                                @foreach ($authors as $author)
                                                    <option value="{{ $author->id }}"
                                                        {{ request('author_id') == $author->id ? 'selected' : '' }}>
                                                        {{ $author->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                          
                                    <div class="col-md-4 d-flex align-items-end">
                                        <button type="submit" class="btn btn-primary btn-sm  me-2">Filter</button>
                                        <a href="{{ route('admin.blogs.index') }}" class="btn btn-secondary btn-sm ">Reset</a>
                                    </div>
                                    </form>

                                </div>
                            </div>

                            <!-- Table danh sách -->
                            <div class="table-responsive custom-shadow">
                                <table class="table table-hover table-borderless align-middle">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Title</th>
                                            <th>Image</th>
                                            <th>Category</th>
                                            <th>Author</th>
                                            <th>Status</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($blogs as $index => $blog)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>   
                                                        {{ Str::limit($blog->title, 50) }}                                      
                                                </td>
                                                <td>
                                                    @if ($blog->image)
                                                        @php
                                                            $filename = basename($blog->image);
                                                            $url = asset('uploads/blogs/' . $filename);
                                                        @endphp
                                                        <img src="{{ $url }}" alt="{{ $blog->title }}"
                                                            style="width:80px;height:50px;object-fit:cover;">
                                                    @else
                                                        <span>Không có</span>
                                                    @endif
                                                </td>
                                                <td>{{ $blog->category->name ?? 'Chưa có' }}</td>
                                                <td>{{ $blog->author->name ?? 'Admin' }}</td>
                                                <td>
                                                    <span
                                                        class="badge {{ $blog->status == 'inactive' ? 'bg-danger' : 'bg-success' }}">
                                                        {{ $blog->status ?? 'Lỗi trạng thái' }}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <a href="{{ route('admin.blogs.show', $blog->id) }}"
                                                        class="btn btn-primary btn-sm rounded-3 me-2">
                                                        <i class="ti ti-eye"></i>
                                                    </a>
                                                    <a href="{{ route('admin.blogs.edit', $blog->id) }}"
                                                        class="btn btn-warning btn-sm rounded-3 me-1">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                    <form action="{{ route('admin.blogs.destroy', $blog->id) }}"
                                                        method="POST" class="d-inline"
                                                        onsubmit="return confirm('Are you sure?')">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm rounded-3">
                                                            <i class="ti ti-trash"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="7" class="text-center text-muted">Không có bài viết nào phù
                                                    hợp.</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                                {{-- {{ $blogs->appends(request()->query())->links() }} --}}
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection
