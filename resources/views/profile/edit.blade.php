@extends('layouts.app')

@section('content')
<h6 class="Sborna anim1 mt-3 mb-4">Ваш профиль</h6>
<div class="container">
    <div class="row justify-content-center align-items-center anim1">
        <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data" class="col-md-8">
            @csrf
            @method('PUT')
            <div class="row justify-content-center align-items-center anim1">
                <div class="col-md-6 mb-3">
                    <div class="text-center">
                        <img class="rounded-circle img-thumbnail" src="{{ Auth::user()->getAvatarUrl() }}" alt="Аватар" style="width: 350px; height: 350px;">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="text-center">
                        <div class="mt-2 avatar-upload">
                            <label class="btn btn-secondary" for="avatar">Загрузить изображение
                                <input type="file" name="avatar" id="avatar" placeholder="">
                            </label>
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-success">Сохранить</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>
    <div class="container text-center anim1 mt-5 mb-4">
        <a href="{{ route('recalls.create') }}" class="btn btn-primary btn-jumbo">Оставить отзыв</a>
    </div>
</div>




<h6 class="Sborna anim1 mt-4 mb-4">Ваши заказы</h6>
@if ($orders->isEmpty())
<h6 class="Sborna anim1 mt-3 mb-4">
    <p class="Sborna anim1 butpod text-decoration-none">У вас пока нет заказов</a>
</h6>

@else
<div class="container">
    <div class="row anim1">
        @foreach ($orders as $order)
        <div class="col-md-4 g-5">
            <div class="configurator-menu-item">
                <div class="wrapper">
                    <div class="clash-card barbarian h-100 w-100">
                            <h4 class="clash-card__unit-name mt-3">Заказ №{{ $order->id }}</h4>
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
                                <div class="stat">{{ $order->status->name }}</div>
                                <div class="stat-value">Статус:</div>
                            </div>
                            <div class="one-third">
                                <div class="stat"></div>
                                <div class="stat-value"></div>
                            </div>
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
@endif
<h6 class="Sborna anim1 mt-5 mb-4">Ваши сборки</h6>
<div class="container">
    <div class="row anim1">
        @forelse ($configurations as $configuration)
        <div class="col-md-4 g-5">
            <div class="configurator-menu-item">
                <div class="wrapper">
                    <div class="clash-card barbarian h-100 w-100">
                        <div class="clash-card__image clash-card__image--barbarian">
                            <img class="logopro my-3" src="{{url('/config')}}/{{ $configuration->processor->img_brand }}" alt="">
                        </div>
                        <div class="clash-card__level clash-card__level--barbarian"></div>
                        <div class="clash-card__unit-name">Заказ №{{ $configuration->id }}</div>
                        <div class="knopka text-center">
                        </div>
                        <div class="clash-card__unit-description">
                            <p class="card-text">Процессор: {{ $configuration->processor->name }}</p>
                            <p class="card-text">Материнская плата: {{ $configuration->motherboard->name }}</p>
                            <p class="card-text">ОЗУ: {{ $configuration->ram->name }}</p>
                            <p class="card-text">Видеокарта: {{ $configuration->gpu->vendor }}</p>
                            <p class="card-text">Блок питания: {{ $configuration->psu->vendor }}</p>
                            <p class="card-text">Корпус: {{ $configuration->case->name }}</p>
                            <p class="card-text">Накопитель: {{ $configuration->rom->name }}</p>
                        </div>
                        <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                            <div class="one-third">
                                <div class="stat"></div>
                                <div class="stat-value"></div>
                            </div>
                            <div class="one-third">
                                <div class="stat">{{ $configuration->status->name }}</div>
                                <div class="stat-value">Статус:</div>
                            </div>
                            <div class="one-third">
                                <div class="stat"></div>
                                <div class="stat-value"></div>
                            </div>
                        </div>
                    </div> <!-- end clash-card barbarian-->
                </div> <!-- end wrapper -->
            </div>
        </div>
        @empty
        <h6 class="Sborna anim1 mt-3 mb-4">
            <p class="Sborna anim1 butpod text-decoration-none">У вас пока нет сборок пк</a>
        </h6>
        @endforelse
    </div>
</div>
@endsection