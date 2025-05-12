@extends('admin.layouts.app')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <h5>Thùng rác đơn hàng</h5>
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        <form id="bulk-action-form" action="" method="POST">
            @csrf
            <div class="table-responsive">
                <table class="table table-hover" style="border: 1px solid #dee2e6;">
                    <thead>
                        <tr>
                            <th style="width: 60px; padding: 12px;"><input type="checkbox" id="check-all"></th>
                            <th style="width: 80px; padding: 12px;">ID</th>
                            <th style="width: 150px; padding: 12px;">Customer</th>
                            <th style="width: 150px; padding: 12px;">Total</th>
                            <th style="width: 180px; padding: 12px;">Deleted At</th>
                            <th style="width: 300px; padding: 12px;">
                                <div class="d-flex align-items-center gap-2">
                                    <select name="action" id="bulk-action-select" class="form-select form-select-sm" style="width: 180px;">
                                        <option value="">-- Chọn thao tác --</option>
                                        <option value="restore">Khôi phục</option>
                                        <option value="forceDelete">Xóa vĩnh viễn</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm">Thực hiện</button>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($orders as $order)
                        <tr>
                            <td style="padding: 12px;"><input type="checkbox" name="ids[]" value="{{ $order->id }}" class="row-checkbox"></td>
                            <td style="padding: 12px;">{{ $order->id }}</td>
                            <td style="padding: 12px;">{{ $order->shipping_name }}</td>
                            <td style="padding: 12px;">{{ number_format($order->total_price) }} VNĐ</td>
                            <td style="padding: 12px;">{{ $order->deleted_at }}</td>
                            <td style="padding: 12px;"></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $orders->links() }}
            </div>
        </form>
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('check-all').addEventListener('change', function() {
        let checked = this.checked;
        document.querySelectorAll('.row-checkbox').forEach(cb => cb.checked = checked);
    });
    document.getElementById('bulk-action-form').addEventListener('submit', function(e) {
        let action = document.getElementById('bulk-action-select').value;
        if (!action) {
            e.preventDefault();
            alert('Vui lòng chọn thao tác!');
            return;
        }
        if (document.querySelectorAll('.row-checkbox:checked').length === 0) {
            e.preventDefault();
            alert('Vui lòng chọn ít nhất một đơn hàng!');
            return;
        }
        if (action === 'restore') {
            this.action = '{{ route('admin.orders.restore.bulk') }}';
        } else if (action === 'forceDelete') {
            this.action = '{{ route('admin.orders.forceDelete.bulk') }}';
        }
    });
</script>
@endpush
@endsection 