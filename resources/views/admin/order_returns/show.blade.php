@extends('admin.layouts.app')
@section('content')
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-12 col-md-10 col-lg-8 d-flex justify-content-center">
            <div class="card" style="background: #fff; margin-top: 15px; padding: 32px 24px;  border: none; border-radius: 0; width: 100%; max-width: 700px; margin-left: auto; margin-right: auto;">
                <div class="card-header text-dark bg-white" style="background: #fff; border: none; padding-bottom: 0; border-radius: 0;">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-undo-alt fa-lg me-2"></i>
                        <h4 class="mb-0">Yêu cầu hoàn hàng #{{ $return->id }}</h4>
                        <span class="badge ms-auto {{ $return->status == 'pending' ? 'bg-warning text-dark' : ($return->status == 'approved' ? 'bg-success' : 'bg-danger') }}">
                            <i class="fas fa-info-circle me-1"></i>
                            {{ ucfirst($return->status) }}
                        </span>
                    </div>
                </div>
                <div class="card-body p-0 pt-3">
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <div class="mb-2">
                                <span class="fw-bold"><i class="fas fa-receipt me-1"></i>Đơn hàng:</span>
                                #{{ $return->order->id }}
                            </div>
                            <div class="mb-2">
                                <span class="fw-bold"><i class="fas fa-user me-1"></i>Khách hàng:</span>
                                {{ $return->user->name }} ({{ $return->user->email }})
                            </div>
                            <div class="mb-2">
                                <span class="fw-bold"><i class="fas fa-calendar-alt me-1"></i>Ngày gửi:</span>
                                {{ $return->created_at->format('d/m/Y H:i') }}
                            </div>
                            <div class="mb-2">
                                <span class="fw-bold"><i class="fas fa-user-shield me-1"></i>Admin xử lý:</span>
                                {{ $return->admin ? $return->admin->name : '-' }}
                            </div>
                            <div class="mb-2">
                                <span class="fw-bold"><i class="fas fa-calendar-check me-1"></i>Ngày xử lý:</span>
                                {{ $return->processed_at ? $return->processed_at->format('d/m/Y H:i') : '-' }}
                            </div>
                        </div>
                        <div class="col-md-6 text-center">
                            <div class="mb-2 fw-bold"><i class="fas fa-image me-1"></i>Ảnh hoàn hàng:</div>
                            @if($return->image)
                                <img src="{{ asset($return->image) }}" alt="Ảnh hoàn hàng" style="max-width: 250px; max-height: 250px; object-fit: cover;">
                            @else
                                <span class="text-muted">Không có</span>
                            @endif
                        </div>
                    </div>
                    <hr>
                    <div class="mb-3">
                        <span class="fw-bold"><i class="fas fa-boxes me-1"></i>Sản phẩm hoàn:</span>
                        <ul class="list-group list-group-flush">
                            @foreach($return->items as $item)
                                <li class="list-group-item d-flex align-items-center px-0" style="background: transparent; border: none;">
                                    <span class="me-2"><i class="fas fa-cube text-primary"></i></span>
                                    <span class="flex-grow-1">{{ $item->orderItem->product->name }} - SL: {{ $item->quantity }}</span>
                                    @if($return->status == 'pending')
                                        <label class="ms-2">
                                            <input type="checkbox" name="restock[{{ $item->id }}]" value="1" checked>
                                            <span class="badge bg-info text-dark">Cộng lại kho</span>
                                        </label>
                                    @else
                                        @if($item->restock)
                                            <span class="badge bg-success ms-2">Đã cộng kho</span>
                                        @else
                                            <span class="badge bg-secondary ms-2">Không cộng kho</span>
                                        @endif
                                    @endif
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="mb-3">
                        <span class="fw-bold"><i class="fas fa-comment-dots me-1"></i>Lý do hoàn hàng:</span>
                        <div class="alert alert-secondary mt-2 mb-0" style="white-space: pre-line;">{{ $return->reason }}</div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="{{ route('admin.order-returns.index') }}" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left me-1"></i>Quay lại
                        </a>
                        @if($return->status == 'pending')
                            <form action="{{ route('admin.order-returns.reject', $return->id) }}" method="POST" class="d-inline">
                                @csrf
                                <button type="submit" class="btn btn-danger"><i class="fas fa-times me-1"></i>Từ chối</button>
                            </form>
                            <form action="{{ route('admin.order-returns.approve', $return->id) }}" method="POST" class="d-inline ms-2">
                                @csrf
                                <button type="submit" class="btn btn-success"><i class="fas fa-check me-1"></i>Duyệt</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 