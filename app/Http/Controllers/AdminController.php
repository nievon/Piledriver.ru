<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PcConfiguration;
use App\Models\CallRequest;
use App\Models\OrderPC;
use App\Models\recall;
use App\Models\User;
use App\Models\statys;

class AdminController extends Controller
{
    // Главная
    public function index()
    {
        // Получите все заявки на обратный звонок
        $callbacks = CallRequest::all();

        return view('admin.admin', compact('callbacks'));
    }
    // Вывод сборок на анминку
    public function configurations()
    {
        $configurations = PcConfiguration::all();
        // Получите все статусы
        $statuses = statys::all();
        return view('admin.configurations', compact('configurations', 'statuses'));
    }
    // вывод сборок
    public function orders()
    {
        $orders = OrderPC::all();
        // Получите все статусы
        $statuses = statys::all();
        return view('admin.sbork', compact('orders', 'statuses'));
    }
    // Удаления заявок на звонок
    public function deleteCallback($id)
    {
        $callback = CallRequest::findOrFail($id);
        $callback->delete();

        return redirect()->route('admin.index')->with('success', 'Заявка успешно удалена.');
    }
    // Отзывы
    public function reviews()
    {
        $reviews = recall::all();
        return view('admin.reviews', compact('reviews'));
    }

    // Удаления отзыва
    public function deleteReview($id)
    {
        $review = recall::findOrFail($id);
        $review->delete();
        return redirect()->back();
    }

    // Снос аватарки
    public function updateAvatar($id)
    {
        $user = User::findOrFail($id);
        $user->avatar = 'def.jpg';
        $user->save();
        return redirect()->back();
    }
    // Обновление статуса
    public function updateConfigurationStatus(Request $request, $id)
    {
        // Находим сборку по идентификатору
        $configuration = PCConfiguration::findOrFail($id);
        // Получение нового статуса из запроса
        $statusId = $request->input('status_id');
        // Обновление статуса сборки
        $configuration->status_id = $statusId;
        $configuration->save();
        // Перенаправление назад с сообщением об успешном обновлении статуса
        return redirect()->back()->with('success', 'Статус сборки успешно обновлен');
    }

    public function updateOrderStatus(Request $request, $id)
    {
        // Находим заказ по идентификатору
        $order = OrderPC::findOrFail($id);
        // Получение нового статуса из запроса
        $statusId = $request->input('status_id');
        // Обновление статуса заказа
        $order->status_id = $statusId;
        $order->save();
        // Перенаправление назад с сообщением об успешном обновлении статуса
        return redirect()->back()->with('success', 'Статус заказа успешно обновлен');
    }
}
