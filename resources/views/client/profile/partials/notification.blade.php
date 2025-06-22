<style>
    .custom-alert {
        display: flex;
        align-items: center;
        background-color: #fff;
        border-left: 5px solid;
        border-radius: 4px;
        padding: 16px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin: 10px auto;
        width: 360px;
        position: relative;
        animation: slideIn 0.3s ease;
    }

    .custom-alert .icon {
        font-size: 20px;
        margin-right: 12px;
    }

    .custom-alert .content {
        flex-grow: 1;
    }

    .custom-alert .content strong {
        display: block;
        font-weight: bold;
        color: #333;
    }

    .custom-alert .content p {
        margin: 0;
        color: #666;
    }

    .custom-alert .close {
        font-size: 38px;
        cursor: pointer;
        color: #333;
        margin-left: 10px;
        margin-top: -32px;
    }

    .custom-alert.success {
        border-color: #28a745;
        background-color: #ffffff;
    }

    .custom-alert.success .icon {
        color: #28a745;
    }

    .custom-alert.error {
        border-color: #dc3545;
        background-color: #ffffff;
    }

    .custom-alert.error .icon {
        color: #dc3545;
    }

    @keyframes slideIn {
        from {
            transform: translateY(-10px);
            opacity: 0;
        }

        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .custom-alert {
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 9999;
    }
</style>
<body>
    
@if (session('success'))
    <div class="custom-alert success" id="success-alert">
        <div class="icon"><i class="fas fa-check-circle"></i></div>
        <div class="content">
            <strong>SUCCESS</strong>
            <p>{{ session('success') }}</p>
        </div>
        <div class="close" onclick="this.parentElement.style.display='none';">&times;</div>
    </div>
@endif

@if (session('error'))
    <div class="custom-alert error" id="error-alert">
        <div class="icon"><i class="fas fa-times-circle"></i></div>
        <div class="content">
            <strong>ERROR</strong>
            <p>{{ session('error') }}</p>
        </div>
        <div class="close" onclick="this.parentElement.style.display='none';">&times;</div>
    </div>
@endif

</body>


<script>
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
</script>
