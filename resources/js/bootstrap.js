import axios from 'axios';
import Echo from 'laravel-echo';
import Pusher from 'pusher-js';
import io from 'socket.io-client';

window.axios = axios;
window.Pusher = Pusher;
window.io = io;

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
window.Echo = new Echo({
    broadcaster: 'reverb',
    key: import.meta.env.VITE_REVERB_APP_KEY,
    wsHost: import.meta.env.VITE_REVERB_HOST,
    wsPort: import.meta.env.VITE_REVERB_PORT ?? 80,
    wssPort: import.meta.env.VITE_REVERB_PORT ?? 443,
    forceTLS: (import.meta.env.VITE_REVERB_SCHEME ?? 'https') === 'https',
    enabledTransports: ['ws', 'wss'],
});

