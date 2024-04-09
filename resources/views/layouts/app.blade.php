<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts --> <!-- Стили -->
    <link rel="stylesheet" href="main.css">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <!-- <link rel="stylesheet" href="{{ asset('css/materialize.css') }}"> -->
    <!-- JS -->



    <!-- Scripts -->
    @vite(['resources/sass/app.scss', 'resources/js/app.js'])
</head>

<body>
    <script src="{{ asset('/js/jquery.min.js') }}"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="{{ asset('/js/app.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <!-- <script src="{{ asset('js/materialize.js') }}"></script> -->
    <div id="app">
        <nav class="barsik navbar navbar-expand-md navbar-dark shadow-sm anim1">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link text-light" href="/where">О компании</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="/sborki">Сборки</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="{{ url('/configurator') }}">Конфигуратор</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="{{ url('/chat') }}">Онлайн-чат</a>
                        </li>
                        @guest
                        @else
                        <li class="nav-item">
                            <a class="nav-link text-light" href="{{ url('/profile') }}">Профиль</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="{{ url('/basket') }}">Корзина</a>
                        </li>
                        @endguest
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav d-flex align-items-center">
                        <li class="nav-item mt-2 me-3">
                            <a class="tele d-flex justify-content-center text-decoration-none" href="tel:+79293684677">+7 (929) 368-46-77</a>
                            <p class="time d-flex justify-content-center">Ежедневно с 09:00 до 21:00</p>
                        </li>
                        <!-- Authentication Links -->
                        @guest
                        <!-- Кнопка логина -->
                        @if (Route::has('login'))
                        <li class="nav-item">
                            <a class="nav-link text-white d-flex align-items-center" href="/login">
                                <p class="nav-text mx-2 my-0">Вход</p>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                                    <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"></path>
                                    <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"></path>
                                </svg>
                            </a>
                        </li>
                        @endif
                        @else
                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ Auth::user()->name }}
                            </a>

                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                @if (Auth::user()->type === 'admin')
                                <a class="dropdown-item" href="{{ route('admin.index') }}">Админ панель</a>
                                @endif

                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    {{ __('Выход') }}
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </li>
                        @endguest

                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-1">
            @yield('content')
        </main>
        <!-- Форма заказа звонка -->
        <div id="callFormOverlay" style="display: none;">
            <div id="callFormContainer">
                <h2>Заказать звонок</h2>
                <form id="callForm" action="/submit_call_form" method="post">
                    @csrf <!-- Добавление CSRF-токена -->
                    <div class="form-group">
                        <label for="name">Имя:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Номер телефона:</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>


                    <h4 class="mt-4">Выберите удобное время</h4>
                    <div class="form-group">
                        <label for="date">Дата:</label>
                        <input type="date" class="form-control" id="date" name="date" required min="{{ date('Y-m-d') }}">
                    </div>

                    <div class="form-group">
                        <label for="time">Время:</label>
                        <input type="time" class="form-control" id="time" name="time" required min="{{ date('H:i') }}">
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" id="rules" name="rules" required>
                        <a href="/rules">
                            <label class="mt-3" for="scales">Соглашаюсь с обработкой данных</label>
                        </a>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">Отправить</button>
                    <button id="closeForm" class="btn btn-secondary mt-3">Закрыть</button>
                    <div id="callFormal">

                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="footer anim1 text-white mt-5">
        <div class="container piska">
            <div class="zhopa me-auto">
                <div class="zhopa me-4">
                    <a href="https://vk.com/video-153644843_456239211"><img class="iccco me-2" src="/img/social/vk.png" alt="vk"></a>
                    <a href="https://t.me/Piledriver_bot"><img class="iccco me-2" src="/img/social/te.png" alt="telegram"></a>
                    <a href="https://www.whatsapp.com/?lang=ru"><img class="iccco" src="/img/social/wa.png" alt="wa"></a>
                </div>
                <div class="text-center align-items-center">
                    <a class=" poct text-decoration-none" href="https://yandex.ru/maps/-/CCUgrMC3TA">Адрес: бул. Архитекторов 14/6</a>
                    <br>
                    <a class="poct text-decoration-none" href="mailto:intkt03@mail.ru">Почта: intkt03@mail.ru</a>
                </div>
            </div>
            <div class="ms-auto zhopa">
                <div class="xyi me-3">
                    <a class="tele text-decoration-none" href="tel:+79293684677">+7 (929) 368-46-77</a>
                    <p class="time">Ежедневно с 09:00 до 21:00</p>
                </div>
                <div class="align-items-center">
                    <button type="submit" class="btn btn-primary zagab">Заказать звонок</button>
                </div>
                <!-- Форма заказа звонка -->
            </div>

        </div>
        </div>
    </footer>

</body>

</html>