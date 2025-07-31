<?php

namespace App\Http\Controllers\client;

use App\Models\Product;
use App\Models\ProductSpecification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class CompareController
{
    public function index(Request $request)
    {
        $productIds = $request->input('products', []);
        
        // Xử lý trường hợp products là string (từ GET query parameters)
        if (is_string($productIds)) {
            $productIds = explode(',', $productIds);
        }
        
        if (count($productIds) !== 2) {
            return view('client.compare.index', [
                'comparison' => [
                    'products' => collect([]),
                    'specs' => []
                ],
                'aiAdvice' => 'Vui lòng chọn chính xác 2 sản phẩm để so sánh.'
            ]);
        }

        $products = Product::with(['specifications.specification', 'variants'])
            ->whereIn('id', $productIds)
            ->get();

        // Lấy tất cả các loại thông số kỹ thuật liên quan
        $allSpecs = ProductSpecification::whereIn('product_id', $productIds)
            ->with('specification')
            ->get();

        $specNames = $allSpecs->pluck('specification.name')->unique();
        $specs = [];
        foreach ($specNames as $name) {
            foreach ($products as $product) {
                $spec = $product->specifications->firstWhere('specification.name', $name);
                $specs[$name][$product->id] = $spec ? $spec->value : null;
            }
        }

        // Chuẩn bị dữ liệu gửi cho AI
        $prompt = $this->buildPrompt($products, $specs);
        $aiAdvice = $this->callGemini($prompt);

        return view('client.compare.index', [
            'comparison' => [
                'products' => $products,
                'specs' => $specs
            ],
            'aiAdvice' => $aiAdvice
        ]);
    }

    private function buildPrompt($products, $specs)
    {
        $prompt = "Tôi muốn so sánh hai sản phẩm sau dựa trên các thông số kỹ thuật. Hãy phân tích ưu nhược điểm từng sản phẩm và đưa ra lời khuyên ngắn gọn khoảng 2-3 câu nên mua sản phẩm nào phù hợp nhất cho khách hàng phổ thông.\n\n";
        foreach ($products as $index => $product) {
            $prompt .= "**Sản phẩm " . ($index + 1) . ": {$product->name}**\n";
            $prompt .= "Giá: " . number_format($product->price, 0, ',', '.') . " VNĐ\n";
            foreach ($specs as $specName => $values) {
                $value = $values[$product->id] ?? 'N/A';
                $prompt .= "- {$specName}: {$value}\n";
            }
            $prompt .= "\n";
        }
        $prompt .= "Hãy trả lời ngắn gọn, dễ hiểu bằng tiếng Việt. Tập trung vào những điểm khác biệt quan trọng nhất.";
        return $prompt;
    }

    private function callGemini($prompt)
    {
        $apiKey = env('GEMINI_API_KEY');
        $url = 'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=' . $apiKey;
        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->timeout(30)->post($url, [
            'contents' => [
                [
                    'parts' => [
                        ['text' => $prompt]
                    ]
                ]
            ],
            'generationConfig' => [
                'maxOutputTokens' => 500,
                'temperature' => 0.7
            ]
        ]);
        if ($response->successful()) {
            $result = $response->json();
            return $result['candidates'][0]['content']['parts'][0]['text'] ?? 'Không có phản hồi từ Gemini.';
        }
        return 'Gemini API failed: ' . $response->body();
    }
}