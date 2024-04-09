@extends('layouts.app')

@section('content')
<div class="container anim1">
    @foreach($pc as $pcs)
    <h6 class="Sborna mt-3 mb-4">Сборка: {{$pcs->name}}</h6>
    @endforeach
    <div class="row justify-content-around">
        <div class="col-md-4">
            @foreach($pc as $pcs)
            <div class="card sbor h-100">
                <img class="p-4 w-100" src="{{url('/img')}}/{{$pcs->img}}" alt="{{$pcs->name}}">
                <div class="card-body h-100 ">
                    <h5 class="pcna card-title">{{$pcs->description}}</h5>
                    <p class="logan card-text mt-3">Цена: {{$pcs->price}}</p>
                    @endforeach
                    @if (auth()->check())
                    <form action="{{ route('cart.add', ['id' => $pc[0]->id]) }}" method="POST">
                        @csrf
                        <button type="submit" class="btn btn-primary">Добавить в корзину</button>
                    </form>

                    @else
                    <a href="{{url('/login')}}" class="btn btn-info">Авторизируйтесь</a>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-5">
            <div class="card sbor" style="width: 18rem;">
                <div class="card-header">
                    Характеристики
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>Материнская плата:</strong> {{$pcs->motherboard}}</li>
                    <li class="list-group-item"><strong>Процессор:</strong> {{$pcs->CPU}}</li>
                    <li class="list-group-item"><strong>Видеокарта:</strong> {{$pcs->GPU}}</li>
                    <li class="list-group-item"><strong>Оперативная память:</strong> {{$pcs->RAM}}</li>
                    <li class="list-group-item"><strong>Накопитель:</strong> {{$pcs->ROM}}</li>
                    <li class="list-group-item"><strong>Блок питания:</strong> {{$pcs->PSU}}</li>
                    <li class="list-group-item"><strong>Охлаждение:</strong> {{$pcs->coolingsys}}</li>
                    <li class="list-group-item"><strong>Корпус:</strong> {{$pcs->CASE}}</li>
                    <li class="list-group-item"><strong>Поинты в 3DMark:</strong> {{$pcs->FPS}}</li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
@endsection