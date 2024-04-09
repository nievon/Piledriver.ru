@extends('layouts.app')

@section('content')
<h6 class="Sborna anim1 mt-4 mb-4">Заказы на сборки</h6>
<div class="container">
    <div class="row anim1">
        @forelse ($configurations as $configuration)
        <div class="col-md-4 g-5">
            <div class="configurator-menu-item">
                <div class="wrapper">
                    <div class="clash-card barbarian h-100 w-100">
                        <div class="clash-card__image clash-card__image--barbarian">
                            <img class="logopros my-3" src="{{url('/avatars')}}/{{$configuration->user->avatar}}" alt="{{$configuration->processor->brand}}">
                        </div>
                        <h4 class="clash-card__unit-name mt-3">Заказ №{{ $configuration->id }}</h4>
                        <div class="clash-card__level clash-card__level--barbarian"></div>
                        <div class="knopka text-center">
                        </div>
                        <div class="clash-card__unit-description">
                            <p class="card-title mb-3">Пользователь: {{ $configuration->user->name }}</p>
                            <p class="card-text mt-3">Процессор: {{ $configuration->processor->name }}</p>
                            <p class="card-text">Материнская плата: {{ $configuration->motherboard->name }}</p>
                            <p class="card-text">ОЗУ: {{ $configuration->ram->name }}</p>
                            <p class="card-text">Видеокарта: {{ $configuration->gpu->vendor }}</p>
                            <p class="card-text">Блок питания: {{ $configuration->psu->vendor }}</p>
                            <p class="card-text">Корпус: {{ $configuration->case->name }}</p>
                            <p class="card-text">Накопитель: {{ $configuration->rom->name }}</p>
                        </div>
                        <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                            <div class="one-third">
                                <form method="POST" action="{{ route('admin.configuration.updateStatus', $configuration->id) }}">
                                    @csrf
                                    <div class="stat">
                                        <select class="optioform" id="status_id" name="status_id">
                                            @foreach($statuses as $status)
                                            <option value="{{ $status->id }}" {{ $configuration->status_id == $status->id ? 'selected' : '' }}>
                                                {{ $status->name }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                            </div>
                            <div class="one-third"></div>
                            <div class="one-third"><button type="submit" class="btn btn-primary">Изменить статус</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @empty
        <h6 class="Sborna anim1 mt-3 mb-4">
            <p class="Sborna anim1 butpod text-decoration-none">Нет сборок пк</a>
        </h6>
        @endforelse
    </div>
</div>
@endsection