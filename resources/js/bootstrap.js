import axios from 'axios';
import Echo from 'laravel-echo';
window.axios = axios;
window.Pusher = require('pusher-js');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'f372a8661682ad70e76b',
    cluster: 'ap1',
    forceTLS: true
});
