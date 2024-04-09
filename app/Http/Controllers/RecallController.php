<?php

namespace App\Http\Controllers;

use App\Models\recall;
use Illuminate\Http\Request;

class RecallController extends Controller
{
    public function create()
    {

        // Генерируем случайную строку для капчи
        $captcha = substr(str_shuffle("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 6);

        // Сохраняем значение капчи в сессии
        session(['captcha' => $captcha]);

        return view('recalls.create')->with('captcha', $captcha);
    }

    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'text' => 'required',
            'rules' => 'required',
            'captcha' => 'required', // Добавляем правило валидации для капчи
        ]);

        // Проверяем введенное значение капчи
        if ($request->captcha !== session('captcha')) {
            return redirect()->back()->withErrors(['captcha' => 'Неверное значение капчи.'])->withInput();
        }

        recall::create([
            'user_id' => $request->user_id,
            'text' => $request->text,
            'date' => now(),
        ]);

        // Удаляем значение капчи из сессии
        $request->session()->forget('captcha');

        return redirect()->back()->with('success', 'Отзыв успешно отправлен.');
    }
}
