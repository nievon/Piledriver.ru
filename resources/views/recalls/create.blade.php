@extends('layouts.app')

@section('content')
<div class="container anim1">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card mt-4">
                <div class="card-header">
                    <h2 class="text-center">Отправка отзыва</h2>
                </div>
                <div class="card-body">
                    <form action="{{ route('recalls.store') }}" method="POST">
                        @csrf
                        <input type="hidden" name="user_id" value="{{ Auth::id() }}">
                        <div class="form-group">
                            <label for="text">Отзыв:</label>
                            <textarea name="text" id="text" rows="4" cols="50" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="captcha" class="captcha-label mt-3">Введите капчу: {{ $captcha }}</label>
                            <br>
                            <input type="text" name="captcha" id="captcha" required class="captcha-input">
                            <div class="checkbox">
                                <input type="checkbox" id="rules" name="rules" required>
                                <a href="/rules">
                                    <label class="mt-3" for="scales">Соглашаюсь с обработкой данных</label>
                                </a>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3">Отправить отзыв</button>
                    </form>
                    @if(session('success'))
                    <div class="alert alert-success mt-3">
                        {{ session('success') }}
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection