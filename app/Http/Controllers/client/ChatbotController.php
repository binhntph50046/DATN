<?php

namespace App\Http\Controllers\client;

use Illuminate\Http\Request;
use App\Models\Faq;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;


class ChatbotController
{
    public function ask(Request $request)
    {
        $msg = trim($request->input('text', ''));
        if ($msg === '') {
            return response()->json(['answer' => 'No input']);
        }

        // Trả lời cứng nếu hỏi "bạn là ai"
        if (mb_stripos($msg, 'bạn là ai') !== false) {
            return response()->json([
                'answer' => 'Tôi là nhân viên của tập đoàn Apple Store, luôn sẵn sàng hỗ trợ bạn mọi thắc mắc về sản phẩm và dịch vụ. Bạn muốn hỏi gì không?'
            ]);
        }

        // 1. Tìm trong bảng faqs
        $row = DB::table('faqs')
            ->where('question', 'like', "%$msg%")
            ->orWhere('keywords', 'like', "%$msg%")
            ->first();

        if ($row) {
            return response()->json(['answer' => $row->answer]);
        }

        // 2. Nếu không có, chỉ lấy dữ liệu từ các bảng bạn muốn gửi cho AI
        $tables = ['faqs', 'categories', 'product_variants','vouchers'];
        $all_data_text = "";
        foreach ($tables as $table) {
            $all_data_text .= "Bảng: $table\n";
            $rows = DB::table($table)->get();
            foreach ($rows as $r) {
                $all_data_text .= json_encode($r, JSON_UNESCAPED_UNICODE) . "\n";
            }
            $all_data_text .= "\n";
        }

        // Gọi Gemini API
        $api_key = "AIzaSyC7bDHaBORo63DHUPL-PiILtmul8YQiOaU";
        $url = "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$api_key";
        $prompt = "Bạn là nhân viên tư vấn chuyên nghiệp, luôn đặt nhu cầu khách hàng lên hàng đầu. Khi trả lời, hãy luôn bắt đầu bằng 'Dạ thưa anh/chị,' hoặc 'Dạ vâng, thưa anh/chị,' và trả lời thật lịch sự, chu đáo. 
                    Dữ liệu:\n$all_data_text\n
                    Hãy trả lời NGẮN GỌN, trực tiếp cho câu hỏi sau: \"$msg\". Chỉ trả lời nội dung, không cần giải thích, không cần nhắc lại câu hỏi, không nói dựa vào bảng nào.";
        $data = [
            "contents" => [
                [
                    "parts" => [
                        ["text" => $prompt]
                    ]
                ]
            ]
        ];
        $options = [
            "http" => [
                "header"  => "Content-type: application/json\r\n",
                "method"  => "POST",
                "content" => json_encode($data),
                "timeout" => 10
            ]
        ];
        $context  = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        $json = json_decode($result, true);
        if (isset($json['candidates'][0]['content']['parts'][0]['text'])) {
            return response()->json(['answer' => $json['candidates'][0]['content']['parts'][0]['text']]);
        } else {
            return response()->json(['answer' => 'Xin lỗi, tôi không thể trả lời câu hỏi này.']);
        }
    }
}