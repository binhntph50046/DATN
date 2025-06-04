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
    <link rel="stylesheet" href="{{ asset('public_auth/style.css') }}">
    <title>Reset Password - Apple Store</title>
</head>

<body>
    <div class="container" id="container">
        <form action="{{ route('password.update') }}" method="POST">
            @csrf
            <h1>Reset Password</h1>
            <p>Please enter your email and new password below.</p>

            <input type="hidden" name="token" value="{{ $token }}">

            <input class="forgot-password-input @error('email') is-invalid @enderror" name="email" type="email"
                value="{{ $email }}" readonly>
            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror

            <input class="forgot-password-input form-control @error('password') is-invalid @enderror" name="password"
                type="password" placeholder="New Password">
            @error('password')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror

            <input class="forgot-password-input form-control" name="password_confirmation" type="password"
                placeholder="Confirm New Password">

            <button type="submit">Reset Password</button>
            <a href="{{ route('login') }}" id="back-to-login">Back to Login</a>
        </form>
    </div>
    <script src="{{ asset('public_auth/script.js') }}"></script>
</body>

</html>
