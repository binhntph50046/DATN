import Echo from 'laravel-echo';
import io from 'socket.io-client';

window.io = io;

window.Echo = new Echo({
    broadcaster: 'reverb',
    key: import.meta.env.VITE_REVERB_APP_KEY,
    wsHost: import.meta.env.VITE_REVERB_HOST,
    wsPort: import.meta.env.VITE_REVERB_PORT ?? 80,
    wssPort: import.meta.env.VITE_REVERB_PORT ?? 443,
    forceTLS: false,
    enabledTransports: ['ws'],
});

window.Echo.private('admin.notifications')
    .listen('.new-chat', (e) => {
        showToastNotification(e.body);
        addNotificationToDropdown(e);
        updateNotifBadge();
    });

function showToastNotification(msg) {
    const toast = document.createElement('div');
    toast.className = 'toast toast-success';
    toast.innerText = msg;
    document.body.appendChild(toast);
    setTimeout(() => toast.remove(), 5000);
}

function addNotificationToDropdown(data) {
    const list = document.getElementById('notif-list');
    const item = document.createElement('li');
    item.innerHTML = `
        <a href="/admin/livechat/${data.user_id}" class="dropdown-item">
            <img src="${data.avatar}" class="rounded-circle me-2" width="30" height="30" />
            <span><strong>${data.title}</strong><br>${data.body}</span>
        </a>
    `;
    list.prepend(item);
}

function updateNotifBadge() {
    const badge = document.getElementById('notif-badge');
    if (badge) {
        let count = parseInt(badge.textContent || '0');
        badge.textContent = count + 1;
        badge.classList.remove('d-none');
    }
}
