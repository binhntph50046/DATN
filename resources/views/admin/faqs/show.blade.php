<!-- resources/views/admin/faqs/show.blade.php -->
@extends('admin.layouts.app')
@section('title', 'FAQ Details')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">FAQ Details</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.faqs.index') }}">FAQs</a></li>
                            <li class="breadcrumb-item" aria-current="page">Details</li>
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
                        <h5>FAQ #{{ $faq->id }}</h5>
                        <a href="{{ route('admin.faqs.edit', $faq->id) }}" class="btn btn-warning btn-sm rounded-3">
                            <i class="ti ti-pencil"></i> Edit
                        </a>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h6>Question</h6>
                                <p>{{ $faq->question }}</p>
                                <hr>
                                <h6>Answer</h6>
                                <p>{{ $faq->answer }}</p>
                                <hr>
                                <h6>Keywords</h6>
                                <p>{{ $faq->keywords ?? 'N/A' }}</p>
                                <hr>
                                <h6>Status</h6>
                                <p>{{ ucfirst($faq->status) }}</p>
                                <hr>
                                <h6>Created At</h6>
                                <p>{{ $faq->created_at->format('d/m/Y H:i') }}</p>
                                <hr>
                                <h6>Updated At</h6>
                                <p>{{ $faq->updated_at->format('d/m/Y H:i') }}</p>
                            </div>
                        </div>
                        <div class="mt-3">
                            <a href="{{ route('admin.faqs.index') }}" class="btn btn-secondary">Back to FAQs</a>
                            <form action="{{ route('admin.faqs.destroy', $faq->id) }}" method="POST" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this FAQ?')">
                                    <i class="ti ti-trash"></i> Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
@endsection