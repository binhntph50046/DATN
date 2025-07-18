import axios from 'axios';
window.axios = axios;
import echo from 'laravel-echo';
window.Pusher = require('pusher-js');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

window.Echo = new echo({
    broadcaster: 'pusher',
    key: 'fabd5ba46281a80295b5',
    cluster: 'ap1',
    forceTLS: true,
    encrypted: true,
});
import './echo';
