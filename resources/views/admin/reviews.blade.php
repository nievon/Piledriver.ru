@extends('layouts.app')

@section('content')
<h6 class="Sborna anim1 mt-3 mb-4">Отзывы клиентов</h6>
<div class="container anim1">
    <div class="row">
        @foreach($reviews as $review)
        <div class="col-md-3 g-5">
            <div class="card anim1">
                <div class="card-body text-center">
                    <img class="porfilee" src="{{url('/avatars')}}/{{ $review->user->avatar }}" alt="Аватар" style="width: 200px; height: 200px ;"><!-- автарка пользователя -->
                    <h5 class="card-title">{{ $review->user->name }}</h5>
                    <p class="card-text">{{ $review->text }}</p>
                    <h6 class="card-subtitle mb-2 text-muted">{{ $review->date }}</h6>
                    <form action="{{ route('admin.reviews.delete', $review->id) }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Удалить</button>
                    </form>
                    <form action="{{ route('admin.reviews.avatar', $review->user->id) }}" method="POST">
                        @csrf
                        <button type="submit" class="btn btn-warning mt-2">Снести аватарку</button>
                    </form>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection