@extends('layouts.app')

@section('content')
<div class="container">
    <h6 class="Sborna anim1 mt-5 ">Готовые сборки</h6>
    <div class="row anim1">
        @foreach ($list as $pc)
        <div class="col-md-4 g-5">
            <div class="card sbor h-100">
                <img class="p-4 w-100" src="{{url('/img')}}/{{$pc->img}}" alt="{{$pc->name}}">
                <div class="card-body h-100 ">
                    <h5 class="pcna card-title">{{$pc->name}}</h5>
                    <p class="logan card-text">{{$pc->tagline}}</p>
                    <a href="{{url('/sborkapc')}}/{{$pc->id}}" class="butpod text-decoration-none">Подробнее ></a>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection