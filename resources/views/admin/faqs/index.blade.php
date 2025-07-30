<!-- resources/views/admin/faqs/index.blade.php -->
@extends('admin.layouts.app')
@section('title', 'FAQ Management')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
    
    .answer-preview {
        max-width: 300px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
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
                            <h5 class="m-b-10">FAQs</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">FAQs</li>
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
                        <h5>FAQs List</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.faqs.create') }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                <i class="ti ti-plus"></i> Add FAQ
                            </a>
                            <a href="{{ route('admin.faqs.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                <i class="ti ti-trash"></i> Trash
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="card shadow-sm mb-4">
                            <div class="card-body">
                                <form method="GET" action="{{ route('admin.faqs.index') }}" class="row g-3 mb-3">
                                    <div class="col-md-5">
                                        <input type="text" name="question" class="form-control" placeholder="Search by question..." value="{{ request('question') }}">
                                    </div>
                                    <div class="col-md-5">
                                        <select name="status" class="form-control">
                                            <option value="">All Statuses</option>
                                            <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                            <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 mt-3">
                                        <button type="submit" class="btn btn-primary">Filter</button>
                                        <a href="{{ route('admin.faqs.index') }}" class="btn btn-secondary">Reset</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="table custom-shadow">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Câu hỏi</th>
                                        <th>Trả lời</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th class="text-center">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($faqs as $faq)
                                    <tr>
                                        <td>{{ $faq->id }}</td>
                                        <td>{{ $faq->question }}</td>
                                        <td class="answer-preview" title="{{ $faq->answer }}">
                                            {{ Str::limit($faq->answer, 50) }}
                                        </td>
                                        <td>{{ ucfirst($faq->status) }}</td>
                                        <td>{{ $faq->created_at->format('d/m/Y H:i') }}</td>
                                        <td class="text-center">
                                            <a href="{{ route('admin.faqs.show', $faq->id) }}" class="btn btn-info btn-sm rounded-3 me-2">
                                                <i class="ti ti-eye"></i> View
                                            </a>
                                            <a href="{{ route('admin.faqs.edit', $faq->id) }}" class="btn btn-warning btn-sm rounded-3 me-2">
                                                <i class="ti ti-pencil"></i> Edit
                                            </a>
                                            <form action="{{ route('admin.faqs.destroy', $faq->id) }}" method="POST" class="d-inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm rounded-3" onclick="return confirm('Are you sure you want to delete this FAQ?')">
                                                    <i class="ti ti-trash"></i> Delete
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $faqs->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
@endsection