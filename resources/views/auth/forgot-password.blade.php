@if (session('success'))
    <div class="alert alert-success" id="success-alert">
        {{ session('success') }}
    </div>
@endif
@if (session('error'))
    <div class="alert alert-danger" id="error-alert">
        {{ session('error') }}
    </div>
@endif
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/iphone.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="public_auth/style.css">
    <title>Forgot Password - Apple Store</title>
</head>

<body>
    <div class="container" id="container">
        <form action="{{ route('password.email') }}" method="POST">
            @csrf
            <h1>Forgot Password</h1>
            <p>Enter your email address and we'll send you a link to reset your password.</p>
            <input class="forgot-password-input form-control @error('email') is-invalid @enderror" type="email"
                name="email" placeholder="Enter your email" value="{{ old('email') }}">
            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror <button type="submit">Send Reset Link</button>
            <a href="{{ route('login') }}" id="back-to-login">Back to Login</a>
        </form>
    </div>
    <script src="public_auth/script.js"></script>
</body>

</html>
