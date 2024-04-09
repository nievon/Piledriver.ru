<?php

namespace App\Http\Controllers;

use App\Models\catalogs;
use Illuminate\Http\Request;
use App\Models\recall;
use App\Models\cart;
use App\Models\OrderItem;
use App\Models\OrderPC;
use Illuminate\Support\Facades\Auth;

class catalog extends Controller
{
    public function cataloglist($name = 'id')
    {
        $list = catalogs::orderby($name)->limit(3)->get();
        $recalls = recall::all();
        return view('main', compact('recalls', 'list'));
    }
    public function where()
    {
        return view('where');
    }
    // Функция длы вывода сборок
    public function sborki($name = 'id')
    {
        $list = catalogs::orderby($name)->get();
        return view('pageforpc.sborki', compact('list'));
    }
    // ФУнкция для лично страницы сборки
    public function onelist($id)
    {
        $pc = catalogs::where('id', $id)->get();
        return view('pageforpc.pagepc', compact('pc'));
    }

    public function addToCart(Request $request, $id)
    {
        $user = Auth::user();

        $cartItem = Cart::where('user_id', $user->id)
            ->where('item_id', $id)
            ->first();

        if ($cartItem) {
            $cartItem->quantity++;
            $cartItem->save();
        } else {
            Cart::create([
                'user_id' => $user->id,
                'item_id' => $id,
            ]);
        }

        return redirect()->route('cart')->with('success', 'Товар добавлен в корзину!');
    }

    public function cart()
    {
        $user = Auth::user();
        $cartItems = Cart::where('user_id', $user->id)->get();

        return view('pageforpc.cart', compact('cartItems'));
    }

    public function removeFromCart(Request $request, $id)
    {
        $cartItem = Cart::findOrFail($id);
        $cartItem->delete();

        return redirect()->route('cart')->with('success', 'Товар удален из корзины!');
    }

    public function updateCart(Request $request, $id)
    {
        $cartItem = Cart::findOrFail($id);
        $quantity = $request->input('quantity', 1);
        $cartItem->quantity = max(1, $quantity); // Количество товара не может быть меньше 1
        $cartItem->save();

        return redirect()->route('cart')->with('success', 'Количество товара обновлено!');
    }

    public function storeOrder()
    {
        $user = Auth::user();

        $cart = Cart::where('user_id', $user->id)->get();

        if ($cart->isEmpty()) {
            // Обработка случая, когда корзина пуста
            return redirect()->back()->with('error', 'Корзина пуста. Оформление заказа невозможно.');
        }

        $order = OrderPC::create([
            'user_id' => $user->id,
            'total_price' => 0,
        ]);

        $totalPrice = 0;

        foreach ($cart as $cartItem) {
            $product = catalogs::find($cartItem->item_id);

            if ($product) {
                $quantity = $cartItem->quantity;
                $price = $product->price;

                $orderItem = new OrderItem([
                    'product_id' => $cartItem->item_id,
                    'quantity' => $quantity,
                    'price' => $price,
                ]);

                $order->items()->save($orderItem);

                $totalPrice += $price * $quantity;
            }
        }

        // Обновляем общую стоимость заказа
        $order->total_price = $totalPrice;
        $order->save();

        // Очищаем корзину после оформления заказа
        $cart->each->delete();

        // Возвращаем пользователю сообщение об успешном оформлении заказа
        return redirect()->back()->with('success', 'Заказ успешно оформлен!');
    }

    public function rules()
    {
        return view('rules');
    }
}
