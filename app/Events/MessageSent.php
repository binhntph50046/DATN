<?

namespace App\Events;

use App\Models\Message;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class MessageSent implements ShouldBroadcast
{
    use InteractsWithSockets, SerializesModels;

    public $message;

    /**
     * Tạo sự kiện với tin nhắn vừa gửi
     */
    public function __construct(Message $message)
    {
        $this->message = $message;
    }

    /**
     * Channel riêng cho từng user nhận (bảo mật)
     */
    public function broadcastOn()
    {
        // Giả sử cột nhận là to_user_id, nếu là to_id thì sửa lại cho đúng
        return new PrivateChannel('chat.' . $this->message->to_user_id);
    }

    /**
     * Dữ liệu trả về cho frontend
     */
    public function broadcastWith()
    {
        return [
            'id' => $this->message->id,
            'from_user_id' => $this->message->from_user_id,
            'to_user_id' => $this->message->to_user_id,
            'message' => $this->message->message,
            'created_at' => $this->message->created_at->toDateTimeString(),
        ];
    }

    /**
     * Tên sự kiện phía frontend sẽ nhận
     */
    public function broadcastAs()
    {
        return 'new-message';
    }
}