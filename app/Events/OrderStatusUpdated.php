<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Models\Order;
use Illuminate\Support\Facades\Log;

class OrderStatusUpdated implements ShouldBroadcastNow
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $order;
    public $status;
    public $status_text;

    public function __construct(Order $order)
    {
        $this->order = $order;
        $this->status = $order->status;
        $this->status_text = $order->getStatusTextAttribute();
        
        Log::info('Cập nhật trạng thái đơn hàng', [
            'order_id' => $order->id,
            'status' => $order->status
        ]);
    }

    public function broadcastOn()
    {
        $channelName = 'orderStatus.'.$this->order->id;
        Log::info('Broadcasting on public channel', [
            'channel' => $channelName,
            'event' => 'OrderStatusUpdated',
            'data' => $this->broadcastWith()
        ]);
        return new Channel($channelName); // Giữ nguyên là public channel
    }

    public function broadcastAs()
    {
        return 'OrderStatusUpdated';
    }

    public function broadcastWith()
    {
        $data = [
            'order_id' => $this->order->id,
            'status' => $this->status,
            'status_text' => $this->status_text
        ];
        Log::info('Event data being broadcast', $data);
        return $data;
    }

    // Thêm phương thức mới
    public function broadcastWhen()
    {
        return true;
    }
}
