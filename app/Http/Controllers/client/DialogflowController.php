<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;
use App\Models\ProductVariant;

class DialogflowController 
{
    public function handle(Request $request)
    {
        \Log::info('Request method: ' . $request->method());
        \Log::info('Received request: ', $request->all());
        $intent = data_get($request, 'queryResult.intent.displayName');
        $parameters = data_get($request, 'queryResult.parameters');

        if (!$intent || !$parameters) {
        return response()->json(['fulfillmentText' => 'Dữ liệu từ Dialogflow không hợp lệ.'], 400);
    }

        switch ($intent) {
            case 'get_price':
                return $this->getPrice($parameters);
            case 'get_stock':
                return $this->getStock($parameters);
            default:
                return response()->json(['fulfillmentText' => 'Xin lỗi, tôi chưa hiểu câu hỏi của bạn.']);
        }
    }

    private function getPrice($params)
    {
        $name = data_get($params, 'product');

        $variant = ProductVariant::where('name', 'like', '%' . $name . '%')->first();

        if ($variant) {
            return response()->json([
                'fulfillmentText' => "Giá bán của {$variant->name} là " . number_format($variant->selling_price, 0, ',', '.') . " VNĐ."
            ]);
        }

        return response()->json([
            'fulfillmentText' => "Không tìm thấy sản phẩm phù hợp với tên: $name"
        ]);
    }

    private function getStock($params)
    {
        $name = data_get($params, 'product');

        $variant = ProductVariant::where('name', 'like', '%' . $name . '%')->first();

        if ($variant) {
            return response()->json([
                'fulfillmentText' => "{$variant->name} hiện còn {$variant->stock} chiếc trong kho."
            ]);
        }

        return response()->json([
            'fulfillmentText' => "Không tìm thấy sản phẩm phù hợp với tên: $name"
        ]);
    }
}
