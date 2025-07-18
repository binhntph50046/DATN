<?php
namespace App\Events;

use App\Models\ChMessage;
use Illuminate\Broadcasting\Channel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;

class ChatCreated implements ShouldBroadcastNow
{
    public $message;
    public function __construct($message)
    {
        $this->message = $message;
    }
    public function broadcastOn()
    {
        return new Channel('admin-notifications');
    }
    public function broadcastAs()
    {
        return 'message.created';
    }
    public function broadcastWith()
    {
        return [
            'id' => $this->message->id,
            'from_user_id' => $this->message->from_user_id,
            'from_user_name' => $this->message->fromUser->name ?? '',
            'to_user_id' => $this->message->to_user_id,
            'message' => $this->message->message,
            'created_at' => $this->message->created_at->toDateTimeString(),
        ];
    }
}