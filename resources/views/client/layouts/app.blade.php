<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Untree.co">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="shortcut icon" href="/images/iphone.png">

    <meta name="description" content="">
    <meta name="keywords" content="bootstrap, ecommerce, iphone">

    <title>@yield('title')</title>

    <!-- Bootstrap CSS -->
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Tiny Slider -->
    <link href="{{ asset('css/tiny-slider.css') }}" rel="stylesheet">
    <!-- Custom Style -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <!-- Slick Slider CSS -->
    <link href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" rel="stylesheet">

    <!-- CSS riêng từ view -->
    @yield('styles')
</head>

<body>

    @include('client.partials.header')
    @include('client.partials.notification')
    @yield('content')
    @include('client.partials.chat')
    @include('client.partials.footer')
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap Bundle + Popper -->
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
    <!-- Tiny Slider -->
    <script src="{{ asset('js/tiny-slider.js') }}"></script>
    <!-- Slick Slider JS -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Custom Script -->
    <script src="{{ asset('js/custom.js') }}"></script>
    <!-- Vite build -->
    @vite(['resources/js/app.js'])

    <!-- Xử lý lỗi hash redirect từ OAuth -->
    <script>
        if (window.location.hash === '#_=_') {
            history.replaceState ?
                history.replaceState(null, null, window.location.href.split('#')[0]) :
                window.location.hash = '';
        }
    </script>

    <script>
        window.Laravel = {!! json_encode(['csrfToken' => csrf_token()]) !!};
    </script>

    <!-- Yield cho JS riêng từ các view -->
    @yield('scripts')

    function hideAlert(alertId) {
    const alert = document.getElementById(alertId);
    if (alert) {
    setTimeout(() => {
    alert.style.display = 'none';
    }, 3000);
    }
    }

    hideAlert('success-alert');
    hideAlert('error-alert');

    <script>
        const pageUrl = window.location.href;

        // Gửi khi vào trang
        fetch("/track/start", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    url: pageUrl
                })
            })
            .then(res => res.json())
            .then(data => {
                // Lưu id bản ghi lại để dùng khi thoát
                localStorage.setItem("page_view_id", data.id);
            });

        // Gửi khi rời trang
        window.addEventListener("pagehide", function() {
            const id = localStorage.getItem("page_view_id");
            if (!id) return;

            fetch("/track/stop", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    id: id
                })
            });

            localStorage.removeItem("page_view_id");
        });
    </script>
</body>

</html>
