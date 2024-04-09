@extends('layouts.app')

@section('content')
<div class="container mt-5 anim1">
    <div class="row justify-content-center">
        <div class="col-md-4 mt-5">
            <div class="login-box">
                <h2>Вход</h2>
                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="user-box">
                        <input id="email" type="email" name="email" required>
                        <label>Почта</label>
                    </div>
                    <div class="user-box">
                        <input id="password" type="password" name="password" required>
                        <label>Пароль</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                        <label class="form-check-label rules" for="remember">
                            {{ __('Запомнить меня') }}
                        </label>
                    </div>
                    @if ($errors->any())
                    <div class="alert alert-danger mt-3">
                        <ul>
                            @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                    @endif
                    <div class="button-wrapper">
                        <button>
                            Вход
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <a href="/register" type="submit">
                            Регистрация
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection