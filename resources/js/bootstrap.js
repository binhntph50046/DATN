    import axios from 'axios';
    window.axios = axios;
    import toastr from 'toastr'; // Ensure toastr is installed via npm
    // Mặc định: cho Chatify
    window.Pusher = require('pusher-js');

    window.Echo = new Echo({
        broadcaster: 'pusher',
        key: import.meta.env.VITE_PUSHER_APP_KEY,
        cluster: import.meta.env.VITE_PUSHER_APP_CLUSTER,
        forceTLS: true,
    });

    // Khác biệt: tạo 1 Echo riêng cho Notifications
    window.NotifyEcho = new Echo({
        broadcaster: 'pusher',
        key: import.meta.env.VITE_PUSHER_NOTIFY_KEY,
        cluster: import.meta.env.VITE_PUSHER_NOTIFY_CLUSTER,
        forceTLS: true,
    });
    import './noti';
