@extends('layouts.app')

@section('content')
<div class="container anim1">
    <div class="row">
        <div class="col-md-12">
            <h6 class="Sborna anim1 mt-3 mb-4">Профиль Админа</h6>
            <div class="d-flex justify-content-center">
                <div class="admin-buttons anim1">
                    <a href="{{ route('admin.orders') }}" class="btn btn-primary mt-2">Посмотреть заказы</a>
                    <a href="{{ route('admin.configurations') }}" class="btn btn-warning mt-2">Посмотреть сборки</a>
                    <a href="{{ route('admin.reviews') }}" class="btn btn-success mt-2">Посмотреть отзывы</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <h2 class="text-center mt-5 anim1">Заявки на обратный звонок</h2>
        @foreach($callbacks as $callback)
        <div class="col-md-3 g-5">
            <div class="card anim1">
                <div class="card-body text-center">
                    <h5 class="card-title">{{ $callback->name }}</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Номер: {{ $callback->phone }}</h6>
                    <h6 class="card-subtitle mb-2 text-muted">Дата: {{ $callback->date }}</h6>
                    <h6 class="card-subtitle mb-2 text-muted">Время: {{ $callback->time }}</h6>
                    <button class="btn btn-success delete-callback" data-callback-id="{{ $callback->id }}">Прозвонили</button>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection