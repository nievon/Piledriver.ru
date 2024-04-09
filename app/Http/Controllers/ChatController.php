<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\JsonResponse;

class ChatController extends Controller
{
    /**
     * Show the chat view.
     *
     * @return \Illuminate\View\View
     */
    public function show()
    {
        return view('chat');
    }

    /**
     * Process the chat message.
     *
     * @param  Request  $request
     * @return \Illuminate\Http\JsonResponse
     * @method('post')
     */
    public function processMessage(Request $request)
    {
        // Получение вопроса из запроса
        $search = $request->input('question');
        // Отправка запроса в OpenAI API для получения ответа
        $data = Http::withHeaders([
            'Content-Type' => 'application/json',
            'Authorization' => 'Bearer ' . env('OPENAI_API_KEY'),
        ])
            ->post("https://api.openai.com/v1/chat/completions", [
                "model" => "gpt-3.5-turbo",
                'messages' => [
                    [
                        "role" => "system",
                        "content" => "You are a user"
                    ],
                    [
                        "role" => "user",
                        "content" => $search
                    ]
                ],
                'temperature' => 0.5,
                "max_tokens" => 999,
                "top_p" => 1.0,
                "frequency_penalty" => 0.52,
                "presence_penalty" => 0.5,
                "stop" => ["11."]
            ])
            ->json();
        // Получение ответа от OpenAI API
        $response = isset($data['choices'][0]['message']['content']) ? $data['choices'][0]['message']['content'] : '';
        // Возвращение ответа в формате JSON
        return response()->json($response, 200);
    }
}
