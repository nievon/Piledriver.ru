@extends('layouts.app')

@section('content')
<script src="{{ asset('/js/app.js') }}"></script>
<div class="container anim1">
    <div class="row">
        <div class="infoc col-md-6 p-4 mt-5">
            <h2 class="chza text-light mt-4">Добро пожаловать в наш онлайн чат по сборке компьютеров!</h2>
            <h4 class="chop text-light mt-3">Получите экспертные рекомендации и помощь в выборе оптимальных комплектующих для вашего ПК. В нашем чате вы можете задать любые вопросы, связанные с выбором процессора, видеокарты, оперативной памяти, жестких дисков и других компонентов. Наши специалисты помогут вам сравнить модели, узнать последние тренды и сделать обдуманный выбор. Создайте идеальную сборку ПК, соответствующую вашим потребностям и бюджету.</h4>
        </div>
        <div id="chat-container" class="col-md-6 mt-5">
            <div id="chat-header">
                <h1>Онлайн чат</h1>
            </div>
            <div id="chat-messages">
                <!-- Здесь будут отображаться сообщения чата -->
            </div>
            <form id="chat-form" action="{{ url('/chat/process-message') }}" method="POST">
                @csrf
                <input type="text" name="question" id="question-input" placeholder="Введите ваш вопрос">
                <button type="submit" class="btn btn-primary">Отправить</button>
            </form>
        </div>
    </div>
</div>

@endsection