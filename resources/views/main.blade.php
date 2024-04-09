@extends('layouts.app')

@section('content')

<div class="previews anim1">
  <div class="container start">
    <div class="row">
      <div class="col-md-6 col-12 starts">
        <h6 class="Spec mt-5 text-light">Продажа и сборка компьютеров в Омске</h6>
        <h2 class="opi mt-4 text-light">Наша компания специализируется на создании персональных компьютеров на заказ. Мы предоставляем услуги по выбору и установке комплектующих, сборке и настройке ПК в соответствии с потребностями и требованиями клиентов.</h2>
        <a class="phon mt-4 text-decoration-none" href="tel:+79293684677">+7 (929) 368-46-77</a>
        <h2 class="slogan mt-4 text-light">"Соберем ПК, который будет соответствовать твоим потребностям и превзойдет твои ожидания!"</h2>
      </div>
      <div class="col-md-6 col-12 mt-5">
        <img class="w-100 mobile" src="/img/pcpic.png" alt="Классный клевый пк для показа">
      </div>
    </div>
    <a href="#scroll-target" class="scroll-down Sborna anim1 mb-2">
      <p class="srcc anim1">Готовые сборки</p>
      <img class="strelka anim1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAAA8klEQVR4nO2WSQrCQBAA5xMG8/+f6CmiFz34nJIQT0Jglt4kXec0TDGdpEpJkiRJEkGAC3AHphIMYAIewLXm4Rsbr0gybBLrmVaWmoET8PwOvIHZ5KRtZzr3Ds5/JxFJhlGJCDJISXjKIC3hIYOWhKUM2hIWMmYSmjLmEhoybhKSMqoSNETjT/80tVnPLJrROHCgkZlFZWVaZnrWCctorJkxldCScZGQlnGVEH6Z1T8GVjfjdxPCMjEkBNbMb532yGjcIaMxypq534TST9NXwioaTdGKRheko9EVqWgMwWg0hqI3GkPSGo2hqY3GJEmSY/EBCdisCNIAPSoAAAAASUVORK5CYII=" alt="стрелка">
    </a>
  </div>
</div>
<div class="container">
  <h6 id="scroll-target" class="Sborna anim1 mt-5 ">Готовые сборки</h6>
  <div class="row anim1">
    @foreach ($list as $pc)
    <div class="col-md-4 g-5">
      <div id="scrollsborki" class="card sbor h-100">
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
  <a href="/sborki" class="butpods anim1 text-decoration-none mt-4">Другие сборки ></a>
  <div class="container">
    <h6 class="Sborna anim1 mt-5">Конфигуратор</h6>
    <div class="row justify-content-center anim1">
      <div class="col-md-6">
        <div class="card kofe mt-5">
          <div class="row ">
            <div class="col-md-6">
              <div class="configurator-block">
                <h2 class="configurator-title mb-2">Конфигуратор сборки ПК</h2>
                <p class="configurator-description mb-4">Создайте свою идеальную конфигурацию ПК с нашим простым в использовании конфигуратором.</p>
                <a href="{{ url('/configurator') }}" class="configurator-button text-decoration-none">Начать сборку</a>
              </div>
            </div>
            <div class="col-md-6">
              <img class="confi" src="img/pc.png" alt="config">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <h6 class="Sborna anim1 mt-5">Наши отзывы</h6>
  <div id="testimonial-slider" class="carousel slide anim1" data-bs-ride="carousel">
    <div class="carousel-inner anim1 kofee">
      @foreach($recalls as $recall)
      @if($loop->first)
      <div class="carousel-item active">
        @else
        <div class="carousel-item">
          @endif
          <div class="testimonial">
            <img class="porfile" src="{{url('/avatars')}}/{{ $recall->user->avatar }}" alt="Аватар"><!-- автарка пользователя -->
            <h3 class="testimonial-name">{{ $recall->user->name }}</h3><!-- имя пользователя -->
            <p class="testimonial-text">{{ $recall->text }}</p><!-- текст отзыва -->
            <h1>{{ $recall->date }}</h1> <!-- время отзыва  -->
          </div>
        </div>
        @endforeach
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#testimonial-slider" data-bs-slide="prev">
        <span class="carousel-control-prev-icon anim1" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span> <!-- кнопка вперед -->
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#testimonial-slider" data-bs-slide="next">
        <span class="carousel-control-next-icon anim1" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span> <!-- кнопка вперед -->
      </button>
    </div>
  </div>
</div>
@endsection