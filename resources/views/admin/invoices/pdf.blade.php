<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hóa đơn #{{ $invoice->invoice_code }}</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 6px; }
        h2, h4 { margin-bottom: 10px; }
    </style>
</head>
<body>
    <h2>Hóa đơn #{{ $invoice->invoice_code }}</h2>
    <p>Ngày xuất: {{ $invoice->issued_at ? $invoice->issued_at->format('d/m/Y H:i') : '' }}</p>
    <p>Mã đơn hàng: #{{ $invoice->order->order_code }}</p>
    <p>Tổng tiền: {{ number_format($invoice->total) }} VNĐ</p>
    <hr>
    <h4>Chi tiết sản phẩm</h4>
    <table>
        <thead>
            <tr>
                <th>Sản phẩm</th>
                <th>Biến thể</th>
                <th>Số lượng</th>
                <th>Giá</th>
                
                <th>Tổng</th>
            </tr>
        </thead>
        <tbody>
            @foreach($invoice->order->items as $item)
            <tr>
                <td>{{ $item->product->name ?? '' }}</td>
                <td><img src="{{ asset($item->variant->image) }}" alt="" style="width:60px; height:60px; object-fit:cover;"></td>
                <td>{{ $item->variant->name ?? '' }}</td>
                <td>{{ $item->quantity }}</td>
                <td>{{ number_format($item->price) }}</td>
                
                <td>{{ number_format($item->total) }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html> 