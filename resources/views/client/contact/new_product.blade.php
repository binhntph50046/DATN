<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm mới</title>
</head>
<body>
    <h2>Sản phẩm mới vừa được thêm:</h2>
    <p><strong>{{ $product->name }}</strong></p>
    <p>{{ $product->description }}</p>
    <p><a href="{{ url('/products/' . $product->id) }}">Xem chi tiết sản phẩm</a></p>
</body>
</html>