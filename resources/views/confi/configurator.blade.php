@extends('layouts.app')

@section('content')
<!-- Проверка авторизации -->
@if (Auth::check())
<h6 class="Sborna anim1 mt-5">Конфигуратор ПК</h6>
<div class="configurator-menu anim1">
    <div class="container">
        <div class="row">
            <!-- Выбор процессора -->
            <div class="col-md-4 g-5">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name">Процессор</div>
                            <div class="knopka text-center">
                                <!-- <label for="processor-select"></label> -->
                                <select id="processor-select" class="optioform">
                                    <option value="0">Выберите процессор</option>
                                    @foreach ($processors as $processor)
                                    <option value="{{ $processor->id }}">{{ $processor->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="clash-card__unit-description">

                            </div>
                            <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Ядра</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Частота</div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian-->
                    </div> <!-- end wrapper -->
                </div>
            </div>


            <!-- Выбор материнской платы -->
            <div class="col-md-4 g-5" id="mbblock" style="display: none;">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image_mb clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level_mb clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name_mb">Материнская плата</div>
                            <label for="motherboard-select"></label>
                            <select id="motherboard-select" class="optioform" disabled>
                                <option value="">Выберите материнскую плату</option>
                            </select>
                            <div class="clash-card__unit-description_mb">

                            </div>
                            <div class="clash-card__unit-stats_mb clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Слоты PCI-e</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Чипсет</div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian -->
                    </div> <!-- end wrapper -->
                </div>
            </div>

            <!-- Выбор ОЗУ -->
            <div class="col-md-4 g-5" id="ramblock" style="display: none;">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image_ram clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level_ram clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name_ram">ОЗУ</div>
                            <label for="ram-select"></label>
                            <select id="ram-select" class="optioform" disabled>
                                <option value="">Выберите ОЗУ</option>
                            </select>
                            <div class="clash-card__unit-description_ram">

                            </div>
                            <div class="clash-card__unit-stats_ram clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Частота</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Объем</div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian -->
                    </div> <!-- end wrapper -->
                </div>
            </div>
            <!-- Выбор GPU -->
            <div class="col-md-4 g-5" id="gpublock" style="display: none;">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image_gpu clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level_gpu clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name_gpu">Видеокарта</div>
                            <label for="gpu-select"></label>
                            <select id="gpu-select" class="optioform" disabled>
                                <option value="">Выберите видеокарту</option>
                            </select>
                            <div class="clash-card__unit-description_gpu">

                            </div>
                            <div class="clash-card__unit-stats_gpu clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Видеопамять</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Частота GPU</div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian -->
                    </div> <!-- end wrapper -->
                </div>
            </div>
            <!-- Выбор PSU -->
            <div class="col-md-4 g-5" id="psublock" style="display: none;">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image_psu clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level_psu clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name_psu">Блок питания</div>
                            <label for="psu-select"></label>
                            <select id="psu-select" class="optioform" disabled>
                                <option value="">Выберите БП</option>
                            </select>
                            <div class="clash-card__unit-description_psu">

                            </div>
                            <div class="clash-card__unit-stats_psu clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Мощность</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat"></div>
                                    <div class="stat-value"></div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian -->
                    </div> <!-- end wrapper -->
                </div>
            </div>
            <!-- Выбор корпуса -->
            <div class="col-md-4 g-5" id="caseblock" style="display: none;">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image_case clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level_case clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name_case">Корпус</div>
                            <label for="case-select"></label>
                            <select id="case-select" class="optioform" disabled>
                                <option value="">Выберите корпус</option>
                            </select>
                            <div class="clash-card__unit-description_case">

                            </div>
                            <div class="clash-card__unit-stats_case clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Подсветка</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat"></div>
                                    <div class="stat-value"></div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian -->
                    </div> <!-- end wrapper -->
                </div>
            </div>
        </div>
        <!-- Выбор жесткого диска -->
        <div class="row justify-content-center" id="romblock" style="display: none;">
            <div class="col-md-4 mt-2">
                <div class="configurator-menu-item">
                    <div class="wrapper">
                        <div class="clash-card barbarian h-100 w-100">
                            <div class="clash-card__image_rom clash-card__image--barbarian">
                                <img src="ссылка" alt="">
                            </div>
                            <div class="clash-card__level_rom clash-card__level--barbarian"></div>
                            <div class="clash-card__unit-name_rom">Накопитель</div>
                            <label for="rom-select"></label>
                            <select id="rom-select" class="optioform" disabled>
                                <option value="">Выберите накопитель</option>
                            </select>
                            <div class="clash-card__unit-description_rom">

                            </div>
                            <div class="clash-card__unit-stats_rom clash-card__unit-stats--barbarian clearfix">
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Скорость</div>
                                </div>
                                <div class="one-third">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Объем</div>
                                </div>
                                <div class="one-third no-border">
                                    <div class="stat">-</div>
                                    <div class="stat-value">Цена</div>
                                </div>
                            </div>
                        </div> <!-- end clash-card barbarian -->
                    </div> <!-- end wrapper -->
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="user-id" value="{{ Auth::user()->id }}">
    <button id="build-button" class="floating-button" disabled>Собрать ПК</button>
</div>
@else
<div class="configurator-menu anim1">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 mt-2">
                <div class="card">
                    <div class="card-body text-center">
                        <h2 class="card-title">Добро пожаловать в наш конфигуратор ПК!</h2>
                        <p class="card-text">У нас ты можешь создать собственную уникальную сборку компьютера и оформить заказ с легкостью.</p>
                        <p class="card-text">Создайте свою идеальную систему, выбрав процессор, материнскую плату, оперативную память, видеокарту, блок питания, корпус и накопитель. Наш конфигуратор предлагает широкий выбор компонентов, чтобы удовлетворить все твои потребности и предпочтения.</p>
                        <p class="card-text">Оформление заказа стало проще, чем когда-либо. Для начала, пожалуйста, авторизуйтесь на нашем сайте. Зарегистрируйте свою учетную запись, чтобы получить полный доступ к функциям конфигуратора и личному кабинету. Войдите в систему, чтобы сохранять свои сборки, отслеживать статусы заказов и быстро оформлять новые.</p>
                        <a href="/login">
                            <button class="floating-button">Войти</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endif
@endsection