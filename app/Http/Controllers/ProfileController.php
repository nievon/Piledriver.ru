<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\OrderPC;
use App\Models\PcConfiguration;
class ProfileController extends Controller
{
    public function edit()
    {
        $user = Auth::user();
        $orders = OrderPC::where('user_id', $user->id)->get();
        $configurations = PCConfiguration::where('user_id', $user->id)->get();
        return view('profile.edit', compact('orders', 'configurations'));
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar');

            // Генерируем уникальное имя файла
            $filename = time() . '.' . $avatar->getClientOriginalExtension();

            // Перемещаем файл в публичную директорию
            $avatar->move(public_path('avatars'), $filename);

            // Обновляем столбец avatar в модели пользователя
            $user->avatar = $filename;
            $user->save();
        }

        return redirect()->back()->with('success', 'Аватар обновлен!');
    }
}
