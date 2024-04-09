@extends('layouts.app')

@section('content')
<div class="container mt-5 anim1">
    <div class="row justify-content-center">
        <div class="col-md-4 mt-5">
            <div class="login-box">
                @if (session('status'))
                <div class="alert alert-success" role="alert">
                    {{ session('status') }}
                </div>
                @endif
                <h2>{{ __('Вы вошли в аккаунт!') }}</h2>
                </form>
                <a class="btn btn-primary" href="{{ route('profile.edit') }}">Перейти в профиль</a>
            </div>
        </div>
    </div>
</div>
@endsection