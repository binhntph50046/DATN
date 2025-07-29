@extends('admin.layouts.app')
@section('title', 'Banner Management')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Biểu ngữ</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Biểu ngữ</li>
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
                    <div class="card-header">
                        <h5>Danh sách biểu ngữ</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.banners.create') }}" class="btn btn-primary btn-sm" title="Thêm biểu ngữ mới">
                                <i class="ti ti-plus"></i> Thêm biểu ngữ mới
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tiêu đề</th>
                                        <th>Hình ảnh</th>
                                        <th>Trạng thái</th>
                                        {{-- <th>Order</th> --}}
                                        <th>Mô tả</th>
                                        <th class="text-center">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($banners as $banner)
                                    <tr>
                                        <td>{{ $banner->id }}</td>
                                        <td>{{ $banner->title }}</td>
                                        <td>
                                            @if ($banner->image)
                                                @if ($banner->link)
                                                    <a href="{{ $banner->link }}" target="_blank">
                                                        <img src="{{ asset($banner->image) }}" alt="Banner Image" width="120">
                                                    </a>
                                                @else
                                                    <img src="{{ asset($banner->image) }}" alt="Banner Image" width="120">
                                                @endif
                                            @endif
                                        </td>
                                        <td>
                                            <span class="badge {{ $banner->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                                {{ $banner->status == 'active' ? 'Hoạt động' : 'Không hoạt động' }}
                                            </span>
                                        </td>
                                        {{-- <td>{{ $banner->order }}</td> --}}
                                        <td>{{ $banner->description }}</td>
                                        <td class="text-center">
                                            <!-- Thay đổi thứ tự -->
                                            <form action="{{ route('admin.banners.moveUp', $banner->id) }}" method="POST" class="d-inline">
                                                @csrf
                                                <button type="submit" class="btn btn-warning btn-sm" title="Di chuyển lên"><i class="ti ti-arrow-up"></i></button>
                                            </form>
                                            <form action="{{ route('admin.banners.moveDown', $banner->id) }}" method="POST" class="d-inline">
                                                @csrf
                                                <button type="submit" class="btn btn-warning btn-sm" title="Di chuyển xuống"><i class="ti ti-arrow-down"></i></button>
                                            </form>
                                            <!-- Edit và Delete -->
                                            <a href="{{ route('admin.banners.edit', $banner->id) }}" class="btn btn-info btn-sm" title="Chỉnh sửa"><i class="ti ti-edit"></i>
                                                 {{-- Edit --}}
                                                </a>
                                            <form action="{{ route('admin.banners.destroy', $banner->id) }}" method="POST" class="d-inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm" title="Xóa" onclick="return confirm('Bạn có chắc chắn muốn xóa biểu ngữ này không?')">
                                                    <i class="ti ti-trash"></i>
                                                     {{-- Delete --}}
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $banners->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
@endsection
