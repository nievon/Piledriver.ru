@extends('layouts.app')

@section('content')
@if ($cartItems->isEmpty())
<h6 class="Sborna anim1 mt-3 mb-4">Ваша корзина пуста!</h6>
<h6 class="Sborna anim1 mt-3 mb-4">
    <a class="Sborna anim1 butpod text-decoration-none" href="{{ url('/profile') }}">Посмотреть мои заказы ></a>
</h6>
<h6 class="Sborna anim1 mt-3 mb-4">
    <a class="Sborna anim1 butpod text-decoration-none" href="{{ url('/sborki') }}">Наши сборки ></a>
</h6>
@else
<div class="container anim1">
    <h6 class="Sborna mt-3 mb-4">Ваша корзина</h6>
    <div class="row anim1">
        @foreach ($cartItems as $cartItem)
        <div class="col-md-4 g-5">
            <div class="card sbor h-100">
                <img class="p-4 w-100" src="{{url('/img')}}/{{ $cartItem->item->img}}" alt="{{ $cartItem->item->name}}">
                <div class="card-body h-100 ">
                    <h5 class="pcna card-title">{{ $cartItem->item->name }}</h5>
                    <p class="logan card-text mt-3">Количество {{ $cartItem->quantity }}</p>
                    <form action="{{ route('cart.remove', ['id' => $cartItem->id]) }}" method="POST" style="display: inline-block">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="cart btn btn-danger btn-sm"><i class="fa fa-trash"></i> Удалить</button>
                    </form>
                    <form action="{{ route('cart.update', ['id' => $cartItem->id]) }}" method="POST" style="display: inline-block">
                        @csrf
                        <div class="input-group">
                            <button type="submit" class="carts btn btn-info btn-sm g-5" name="quantity" value="{{ $cartItem->quantity - 1 }}">-</button>
                            <button type="submit" class="carts btn btn-info btn-sm g-5" name="quantity" value="{{ $cartItem->quantity + 1 }}">+</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    <form action="{{ route('order.store') }}" method="POST" class="anim1">
        @csrf
        <button type="submit anim1" class="btn btn-success mt-4">Оформить заказ</button>
    </form>

    <form class="anim1">
        <a type="submit anim1" href="{{url('/sborki')}}" class="btn btn-primary mt-4">Вернуться к сборкам</a>
    </form>
</div>
@endif
@endsection