@extends('layouts.app')

@section('content')
<div class="container mt-5 anim1">
    <div class="row justify-content-center">
        <div class="col-md-4 mt-5">
            <div class="login-box">
                <h2>Регистрация</h2>
                <form method="POST" action="{{ route('register') }}">
                    @csrf
                    <div class="user-box">
                        <input id="name" type="text" name="name" required>
                        <label>Имя</label>
                    </div>
                    <div class="user-box">
                        <input id="email" type="email" name="email" required>
                        <label>Почта</label>
                    </div>
                    <div class="user-box">
                        <input id="password" type="password" name="password" required>
                        <label>Пароль</label>
                    </div>
                    <div class="user-box">
                        <input id="password-confirm" type="password" name="password_confirmation" required>
                        <label>Подтвердите пароль</label>
                    </div>
                    <div class="form-group">
                        <div class="checkbox">
                            <input type="checkbox" id="rules" name="rules" required>
                            <span class="rules" onclick="handleClick('/rules')">Соглашаюсь с обработкой данных</span>
                        </div>
                    </div>
                    <script>
                        function InWin(url) {
                            // Ваш код для открытия страницы по указанному URL
                            window.location.href = url;
                        }

                        function handleClick(url) {
                            InWin(url);
                        }
                    </script>

                    <button type="submit">
                        Зарегистрироваться
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection