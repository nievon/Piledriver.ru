@extends('layouts.app')

@section('content')
<h6 class="Sborna anim1 mt-3 mb-4">Заказы клиентов на готовые сборки</h6>
<div class="container">
    <div class="row anim1">
        @foreach ($orders as $order)
        <div class="col-md-4 g-5">
            <div class="configurator-menu-item">
                <div class="wrapper">
                    <div class="clash-card barbarian h-100 w-100">
                        <h4 class="clash-card__unit-name mt-3">
                            Пользователь: {{ $order->user->name }}
                            <br>
                            Заказ №{{ $order->id }}
                        </h4>
                        <div class="clash-card__level clash-card__level--barbarian"></div>
                        <div class="knopka text-center">
                        </div>
                        <div class="clash-card__unit-description">
                            <div class="container pb-3">
                                <div class="row anim1">
                                    @foreach ($order->items as $item)
                                    <div class="col-6 g-3 mb-3">
                                        <div class="card sbor zkaka">
                                            <img src="{{url('/img')}}/{{ $item->product->img }}" class="card-img-top" alt="{{ $item->product->name }}" style="max-width: 200px; max-height: 200px;">
                                            <div class="card-body">
                                                <h5 class="card-title">{{ $item->product->name }}</h5>
                                                <p class="card-text">Количество: {{ $item->quantity }}</p>
                                                <p class="card-text">Стоимость: {{ $item->product->price }}</p>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                            <div class="one-third">
                                <form id="updateStatusForm" action="{{ route('admin.order.updateStatus', $order->id) }}" method="POST">
                                    @csrf
                                    <div class="stat">
                                        <select class="optioform" id="status_id" name="status_id">
                                            @foreach($statuses as $status)
                                            <option value="{{ $status->id }}" {{ $order->status_id == $status->id ? 'selected' : '' }}>
                                                {{ $status->name }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="stat-value"><button type="submit" class="btn btn-primary">Изменить статус</button></div>
                                </form>
                            </div>
                            <div class="one-third"></div>
                            <div class="one-third">
                                <div class="stat">{{ $order->total_price }}</div>
                                <div class="stat-value">Общая стоимость:</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- end clash-card barbarian-->
        @endforeach
    </div> <!-- end wrapper -->
</div>
@endsection