// Чат онлайн
$(document).ready(function () {
    $('#chat-form').off().submit(function (e) {
        e.preventDefault();

        var question = $('#question-input').val();

        var chatMessages = $('#chat-messages');
        chatMessages.append('<div class="user-message"> <img class="people" src="/img/user.png" alt="user">' + question + '</div>');

        $('#question-input').val(''); // Очищаем поле ввода сразу после нажатия кнопки "Отправить"

        // Добавляем анимацию "Оператор печатает"
        chatMessages.append('<div class="assistant-message-type"> <img class="bots" src="/img/bot1.gif" alt="bot"> <div class="typing-indicator"></div> </div>');
        chatMessages.scrollTop(chatMessages[0].scrollHeight);

        $.ajax({
            url: '/chat/process-message',
            type: 'POST',
            data: {
                question: question
            },
            success: function (response) {
                // Удаляем анимацию "Оператор печатает"
                chatMessages.find('.assistant-message-type').remove();

                chatMessages.append('<div class="assistant-message"> <img class="bots" src="/img/bot1.gif" alt="bot">' + response + '</div>');
                chatMessages.scrollTop(chatMessages[0].scrollHeight);
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });
});


// Скрипт анимации загрузки
window.addEventListener('DOMContentLoaded', () => {
    ScrollReveal().reveal('.anim1', {
        delay: 300, // Задержка перед анимацией
        distance: '20px', // Расстояние, на которое блок будет смещаться при анимации
        duration: 900, // Продолжительность анимации
        easing: 'ease-in-out', // Функция плавности анимации
        origin: 'top', // Начальное положение блока (снизу)
    });
});
// Кнопка сборки
document.addEventListener('DOMContentLoaded', function () {
    var scrollDownLink = document.querySelector('.scroll-down');
    var scrollTarget = document.querySelector('#scroll-target');
    var scrollsborki = document.querySelector('#scrollsborki');
    scrollDownLink.addEventListener('click', function (event) {
        event.preventDefault();
        scrollTarget.scrollIntoView({ behavior: 'smooth' });
    });

    window.addEventListener('scroll', function () {
        if (isScrolledIntoView(scrollsborki)) {
            scrollDownLink.classList.add('hidden'); // Добавить класс "hidden" при достижении целевого блока
        } else {
            scrollDownLink.classList.remove('hidden'); // Удалить класс "hidden" при прокрутке от целевого блока
        }
    });

    function isScrolledIntoView(element) {
        var rect = element.getBoundingClientRect();
        var elemTop = rect.top;
        var elemBottom = rect.bottom;

        // Видимая часть элемента должна быть больше 50% для считания его просмотренным
        var isVisible = (elemTop < window.innerHeight) && (elemBottom >= (window.innerHeight / 2));

        return isVisible;
    }
});



// Конфигуратор
$(document).ready(function () {
    // Загрузка списка процессоров при загрузке страницы
    loadProcessors();

    // Обработчик выбора процессора
    $('#processor-select').change(function () {
        var processorId = $(this).val();
        if (processorId) {
            // Загрузка списка материнских плат
            loadMotherboards(processorId);
            // Загрузка информации о выбранном процессоре
            loadProcessorInfo(processorId);
            // Сброс озу и мтеринской
            resetRAMInfo();
            resetMotherboardInfo();
        } else {
            // Сброс выбора материнской платы
            resetMotherboards();
            // Сброс информации о процессоре
            resetProcessorInfo();
        }
    });


    // Обработчик выбора материнской платы
    $('#motherboard-select').change(function () {
        var motherboardId = $(this).val();
        if (motherboardId) {
            // Загрузка списка ОЗУ на основе выбранной материнской платы
            loadRAMs(motherboardId);

            // Загрузка информации о выбранной материнской плате
            loadMotherboardInfo(motherboardId);
            // Сброс инфы
            resetMotherboardInfo();
            // Сброси озу
            resetRAMInfo();
        } else {
            // Сброс выбора ОЗУ и информации о материнской плате
            resetRAMs();
            resetMotherboardInfo();
        }
    });

    // Обработчик выбора ОЗУ
    $('#ram-select').change(function () {
        var ramId = $(this).val();
        if (ramId) {
            if (!$('#gpu-select').prop('disabled')) {
                // Если список GPU уже загружен, не загружаем его снова
                loadRAMInfo(ramId);
            } else {
                // Загрузка списка GPU
                loadGpus(function () {
                    loadRAMInfo(ramId);
                });
            }
        } else {
            resetRAMInfo();
        }
    });


    // Загрузка списка процессоров при загрузке страницы
    function loadProcessors() {
        $.ajax({
            url: '/configurator/processors',
            type: 'GET',
            success: function (data) {
                var options = '<option value="1">Выберите процессор</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.name + '</option>';
                });
                $('#processor-select').html(options);
            },
            error: function () {
                $('#processor-select').html('<option value="">Ошибка загрузки</option>');
            }
        });
    }

    // Загрузка информации о выбранном процессоре
    function loadProcessorInfo(processorId) {
        $.ajax({
            url: '/configurator/processors/' + processorId,
            type: 'GET',
            success: function (item) {
                // Загрузка информации о сокете
                loadSocketInfo(item.socket_id, function (socketInfo) {
                    var cpuInfoWrapper = $('.configurator-menu-item .wrapper');
                    cpuInfoWrapper.find('.clash-card__image img').attr('src', '/config/' + item.img_brand);
                    cpuInfoWrapper.find('.clash-card__image img').attr('alt', item.brand);
                    cpuInfoWrapper.find('.clash-card__image img').addClass('logopro my-3');
                    cpuInfoWrapper.find('.clash-card__level').text(item.brand);
                    cpuInfoWrapper.find('.clash-card__unit-name').text(item.name);
                    cpuInfoWrapper.find('.clash-card__unit-description').text(socketInfo.name);
                    cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(1) .stat').text(item.core);
                    cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(2) .stat').text(item.frequency);
                    cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(3) .stat').text(item.price);
                });
            },
            error: function () {
                resetProcessorInfo();
            }
        });
    }


    // Сброс инфы о проце
    function resetProcessorInfo() {
        var cpuInfoWrapper = $('.configurator-menu-item .wrapper');
        cpuInfoWrapper.find('.clash-card__image img').attr('src', '');
        cpuInfoWrapper.find('.clash-card__image img').attr('alt', '');
        cpuInfoWrapper.find('.clash-card__image img').removeClass('logopro my-3');
        cpuInfoWrapper.find('.clash-card__level').text('');
        cpuInfoWrapper.find('.clash-card__unit-name').text('Процессор');
        cpuInfoWrapper.find('.clash-card__unit-description').text('');
        cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(1) .stat').text('-');
        cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(2) .stat').text('-');
        cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(3) .stat').text('-');
        cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(1) .stat-value').text('Мощность');
        cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(2) .stat-value').text('Частота');
        cpuInfoWrapper.find('.clash-card__unit-stats .one-third:nth-child(3) .stat-value').text('Цена');
        cpuInfoWrapper.find('.clash-card__unit-stats').removeClass('clash-card__unit-stats--barbarian');
    }



    // Загрузка списка материнских плат на основе выбранного процессора
    function loadMotherboards(processorId) {
        $.ajax({
            url: '/configurator/motherboards',
            type: 'GET',
            data: { processor_id: processorId },
            success: function (data) {
                var options = '<option value="">Выберите материнскую плату</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.name + '</option>';
                });
                $('#motherboard-select').html(options).prop('disabled', false);
                // Показать элемент с id mbblock
                $('#mbblock').show();
            },
            error: function () {
                $('#motherboard-select').html('<option value="">Ошибка загрузки</option>').prop('disabled', true);
                // Показать элемент с id mbblock
                $('#mbblock').show();
            }
        });
    }

    // Загрузка информации о выбранной материнской плате
    function loadMotherboardInfo(motherboardId) {
        $.ajax({
            url: '/configurator/motherboards/' + motherboardId,
            type: 'GET',
            success: function (data) {
                loadSocketInfo(data.socket_id, function (socketInfo) {
                    $('.clash-card__image_mb img').attr('src', '/config/' + data.img_brand);
                    $('.clash-card__image_mb img').attr('alt', data.brand);
                    $('.clash-card__image_mb img').addClass('logopro my-3');
                    $('.clash-card__level_mb').text(data.brand);
                    $('.clash-card__unit-name_mb').text(data.name);
                    $('.clash-card__unit-description_mb').text(socketInfo.name);
                    $('.clash-card__unit-stats_mb .stat:eq(0)').text(data.pcie);
                    $('.clash-card__unit-stats_mb .stat:eq(1)').text(data.chipset);
                    $('.clash-card__unit-stats_mb .stat:eq(2)').text(data.price);
                });
            },
            error: function () {
                // Обработка ошибки загрузки информации о материнской плате
            }
        });
    }

    // Загрузка информации о сокете
    function loadSocketInfo(socketId, callback) {
        $.ajax({
            url: '/configurator/sockets/' + socketId,
            type: 'GET',
            success: function (socketInfo) {
                callback(socketInfo);
            },
            error: function () {
                callback({ name: 'Ошибка загрузки' });
            }
        });
    }
    // Сброс информации о материнской плате
    function resetMotherboardInfo() {
        $('.clash-card__image_mb img').attr('src', '');
        $('.clash-card__image_mb img').attr('alt', '');
        $('.clash-card__image_mb img').removeClass('logopro my-3');
        $('.clash-card__level_mb').text('');
        $('.clash-card__unit-name_mb').text('Материнская плата');
        $('.clash-card__unit-description_mb').text('');
        $('.clash-card__unit-stats_mb .stat:eq(0)').text('-');
        $('.clash-card__unit-stats_mb .stat:eq(1)').text('-');
        $('.clash-card__unit-stats_mb .stat:eq(2)').text('-');
    }


    // Загрузка списка ОЗУ на основе выбранной материнской платы
    function loadRAMs(motherboardId) {
        $.ajax({
            url: '/configurator/ramss',
            type: 'GET',
            data: { motherboard_id: motherboardId },
            success: function (data) {
                var options = '<option value="">Выберите ОЗУ</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.idss + '">' + item.name + ' ' + item.size + ' гб' + '</option>';
                });
                $('#ram-select').html(options).prop('disabled', false);
                // Показать элемент с id mbblock
                $('#ramblock').show();
            },
            error: function () {
                $('#ram-select').html('<option value="">Ошибка загрузки</option>').prop('disabled', true);
                // Показать элемент с id mbblock
                $('#ramblock').show();
            }
        });
    }

    // Загрузка информации о выбранном ОЗУ
    function loadRAMInfo(ramId) {
        $.ajax({
            url: '/configurator/ramss/' + ramId, // Обновленный маршрут
            type: 'GET',
            success: function (data) {
                loadddrInfo(data.dram_id, function (dramInfo) {
                    $('.clash-card__image_ram img').attr('src', '/config/' + data.img_brand);
                    $('.clash-card__image_ram img').attr('alt', data.brand);
                    $('.clash-card__image_ram img').addClass('logopro my-3');
                    $('.clash-card__level_ram').text(data.brand);
                    $('.clash-card__unit-name_ram').text(data.name);
                    $('.clash-card__unit-description_ram').text(dramInfo.type);
                    $('.clash-card__unit-stats_ram .stat:eq(0)').text(data.frequency + ' MHz');
                    $('.clash-card__unit-stats_ram .stat:eq(1)').text(data.size + ' Гб');
                    $('.clash-card__unit-stats_ram .stat:eq(2)').text(data.price);
                });
            },
            error: function () {
                // Обработка ошибки загрузки информации об ОЗУ
                resetRAMInfo();
            }
        });
    }

    // Сброс информации о ОЗУ
    function resetRAMInfo() {
        $('.clash-card__image_ram img').attr('src', '');
        $('.clash-card__image_ram img').attr('alt', '');
        $('.clash-card__image_ram img').removeClass('logopro my-3');
        $('.clash-card__level_ram').text('');
        $('.clash-card__unit-name_ram').text('ОЗУ');
        $('.clash-card__unit-description_ram').text('');
        $('.clash-card__unit-stats_ram .stat').text('-');
    }

    // Загрузка информации о ddr
    function loadddrInfo(ddrId, callback) {
        $.ajax({
            url: '/configurator/dram/' + ddrId,
            type: 'GET',
            success: function (dramInfo) {
                callback(dramInfo);
            },
            error: function () {
                callback({ name: 'Ошибка загрузки' });
            }
        });
    }

    // Загрузка списка GPU на основе выбранного ОЗУ
    function loadGpus(ramId) {
        $.ajax({
            url: '/configurator/gpus',
            type: 'GET',
            data: { ram_id: ramId },
            success: function (data) {
                var options = '<option value="">Выберите GPU</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.vendor + ' ' + item.model + '</option>';
                });
                $('#gpu-select').html(options).prop('disabled', false);
                // Показать элемент с id mbblock
                $('#gpublock').show();
            },
            error: function () {
                $('#gpu-select').html('<option value="">Ошибка загрузки</option>').prop('disabled', true);
                // Показать элемент с id mbblock
                $('#gpublock').show();
            }
        });
    }

    // Загрузка информации о выбранной видеокарте
    function loadGPUInfo(gpuId) {
        $.ajax({
            url: '/configurator/gpus/' + gpuId,
            type: 'GET',
            success: function (data) {
                $('.clash-card__image_gpu img').attr('src', '/config/' + data.img_brand);
                $('.clash-card__image_gpu img').attr('alt', data.vendor);
                $('.clash-card__image_gpu img').addClass('logopro my-3');
                $('.clash-card__level_gpu').text(data.vendor);
                $('.clash-card__unit-name_gpu').text(data.model);
                $('.clash-card__unit-description_gpu').text(' ');
                $('.clash-card__unit-stats_gpu .stat:eq(0)').text(data.size);
                $('.clash-card__unit-stats_gpu .stat:eq(1)').text(data.gpu_frequency + ' MHz');
                $('.clash-card__unit-stats_gpu .stat:eq(2)').text(data.price);
            },
            error: function () {
                resetGPUInfo();
            }
        });
    }

    // Сброс информации о видеокарте
    function resetGPUInfo() {
        $('.clash-card__image_gpu img').attr('src', '');
        $('.clash-card__image_gpu img').attr('alt', '');
        $('.clash-card__image_gpu img').removeClass('logopro my-3');
        $('.clash-card__level_gpu').text('');
        $('.clash-card__unit-name_gpu').text('Видеокарта');
        $('.clash-card__unit-description_gpu').text('');
        $('.clash-card__unit-stats_gpu .stat:eq(0)').text('-');
        $('.clash-card__unit-stats_gpu .stat:eq(1)').text('-');
        $('.clash-card__unit-stats_gpu .stat:eq(2)').text('-');
    }

    // Загрузка списка PSU на основе выбранной GPU
    function loadPsus(gpuId) {
        $.ajax({
            url: '/configurator/psus',
            type: 'GET',
            data: { gpu_id: gpuId },
            success: function (data) {
                var options = '<option value="">Выберите PSU</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.vendor + ' ' + item.model + '</option>';
                });
                $('#psu-select').html(options).prop('disabled', false);
                // Показать элемент с id mbblock
                $('#psublock').show();
            },
            error: function () {
                $('#psu-select').html('<option value="">Ошибка загрузки</option>').prop('disabled', true);
                // Показать элемент с id mbblock
                $('#psublock').show();
            }
        });
    }

    // Загрузка информации о выбранном блоке питания
    function loadPSUInfo(psuId) {
        $.ajax({
            url: '/configurator/psus/' + psuId,
            type: 'GET',
            success: function (data) {
                $('.clash-card__image_psu img').attr('src', '/config/' + data.img_brand);
                $('.clash-card__image_psu img').attr('alt', data.vendor);
                $('.clash-card__image_psu img').addClass('logopro my-3');
                $('.clash-card__level_psu').text(data.vendor);
                $('.clash-card__unit-name_psu').text(data.model);
                $('.clash-card__unit-description_psu').text(data.typemodyls);
                $('.clash-card__unit-stats_psu .stat:eq(0)').text(data.power);
                $('.clash-card__unit-stats_psu .stat:eq(2)').text(data.price);

            },
            error: function () {
                resetPSUInfo();
            }
        });
    }

    // Сброс информации о блоке питания
    function resetPSUInfo() {
        $('.clash-card__image_psu img').attr('src', '');
        $('.clash-card__image_psu img').attr('alt', '');
        $('.clash-card__image_psu img').removeClass('logopro my-3');
        $('.clash-card__level_psu').text('');
        $('.clash-card__unit-name_psu').text('Блок питания');
        $('.clash-card__unit-description_psu').text('');
        $('.clash-card__unit-stats_psu .stat:eq(0)').text('-');
        $('.clash-card__unit-stats_psu .stat:eq(1)').text('-');
        $('.clash-card__unit-stats_psu .stat:eq(2)').text('-');
    }

    // Загрузка списка корпусов
    function loadCases() {
        $.ajax({
            url: '/configurator/cases',
            type: 'GET',
            success: function (data) {
                var options = '<option value="">Выберите корпус</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.name + ' ' + item.brand + '</option>';
                });
                $('#case-select').html(options).prop('disabled', false);
                // Показать элемент с id mbblock
                $('#caseblock').show();
            },
            error: function () {
                $('#case-select').html('<option value="">Ошибка загрузки</option>').prop('disabled', true);
                // Показать элемент с id mbblock
                $('#caseblock').show();
            }
        });
    }

    // Загрузка информации о выбранном корпусе
    function loadCaseInfo(caseId) {
        $.ajax({
            url: '/configurator/cases/' + caseId,
            type: 'GET',
            success: function (data) {
                $('.clash-card__image_case img').attr('src', '/config/' + data.img_brand);
                $('.clash-card__image_case img').attr('alt', data.brand);
                $('.clash-card__image_case img').addClass('logopro my-3');
                $('.clash-card__level_case').text(data.brand);
                $('.clash-card__unit-name_case').text(data.name);
                $('.clash-card__unit-description_case').text(data.color);
                $('.clash-card__unit-stats_case .stat:eq(0)').text(data.led);
                $('.clash-card__unit-stats_case .stat:eq(2)').text(data.price);
            },
            error: function () {
                resetCaseInfo();
            }
        });
    }

    // Сброс информации о корпусе
    function resetCaseInfo() {
        $('.clash-card__image_case img').attr('src', '');
        $('.clash-card__image_case img').attr('alt', '');
        $('.clash-card__image_case img').removeClass('logopro my-3');
        $('.clash-card__level_case').text('');
        $('.clash-card__unit-name_case').text('Корпус');
        $('.clash-card__unit-description_case').text('');
        $('.clash-card__unit-stats_case .stat:eq(0)').text('-');
        $('.clash-card__unit-stats_case .stat:eq(1)').text('-');
        $('.clash-card__unit-stats_case .stat:eq(2)').text('-');
    }

    // Загрузка списка жестких дисков
    function loadROMs() {
        $.ajax({
            url: '/configurator/roms',
            type: 'GET',
            success: function (data) {
                var options = '<option value="">Выберите накопитель</option>';
                data.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.name + ' ' + item.size + '</option>';
                });
                $('#rom-select').html(options).prop('disabled', false);
                // Показать элемент с id mbblock
                $('#romblock').show();
            },
            error: function () {
                $('#rom-select').html('<option value="">Ошибка загрузки</option>').prop('disabled', true);
                // Показать элемент с id mbblock
                $('#romblock').show();
            }
        });
    }

    // Загрузка информации о выбранном накопителе
    function loadROMInfo(romId) {
        $.ajax({
            url: '/configurator/roms/' + romId,
            type: 'GET',
            success: function (data) {
                $('.clash-card__image_rom img').attr('src', '/config/' + data.img_brand);
                $('.clash-card__image_rom img').attr('alt', data.brand);
                $('.clash-card__image_rom img').addClass('logopro my-3');
                $('.clash-card__level_rom').text(data.brand);
                $('.clash-card__unit-name_rom').text(data.name);
                $('.clash-card__unit-description_rom').text(data.storage_type);
                $('.clash-card__unit-stats_rom .stat:eq(0)').text(data.speed);
                $('.clash-card__unit-stats_rom .stat:eq(1)').text(data.size);
                $('.clash-card__unit-stats_rom .stat:eq(2)').text(data.price);
            },
            error: function () {
                resetROMInfo();
            }
        });
    }

    // Сброс информации о накопителе
    function resetROMInfo() {
        $('.clash-card__image_rom img').attr('src', '');
        $('.clash-card__image_rom img').attr('alt', '');
        $('.clash-card__image_rom img').removeClass('logopro my-3');
        $('.clash-card__level_rom').text('');
        $('.clash-card__unit-name_rom').text('Накопитель');
        $('.clash-card__unit-description_rom').text('');
        $('.clash-card__unit-stats_rom .stat:eq(0)').text('-');
        $('.clash-card__unit-stats_rom .stat:eq(1)').text('-');
        $('.clash-card__unit-stats_rom .stat:eq(2)').text('-');
    }

    // Обработчик выбора GPU
    $('#gpu-select').change(function () {
        var gpuId = $(this).val();
        if (gpuId) {
            if (!$('#psu-select').prop('disabled')) {
                // Если список PSU уже загружен, не загружаем его снова
                loadGPUInfo(gpuId);
            } else {
                // Загрузка списка PSU
                loadGPUInfo(gpuId);
                loadPsus(gpuId, function () {
                    loadGPUInfo(gpuId);
                });
            }
        } else {
            // Сброс выбора GPU и PSU
            resetGPUInfo();
            resetPsus();
        }
    });



    // Обработчик выбора PSU
    $('#psu-select').change(function () {
        var psuId = $(this).val();
        if (psuId) {
            if (!$('#case-select').prop('disabled')) {
                // Если список CASE уже загружен, не загружаем его снова
                loadPSUInfo(psuId);
            } else {
                // Загрузка списка CASE
                loadPSUInfo(psuId);
                loadCases(psuId, function () {
                    loadPSUInfo(psuId);
                });
            }
        } else {
            // Сброс выбора PSU
            resetPSUInfo();
            // Сброс выбора CASE
            resetCases();
        }
    });


    // Обработчик выбора корпуса
    $('#case-select').change(function () {
        var caseId = $(this).val();
        if (caseId) {
            // Загрузка информации о выбранном корпусе
            loadCaseInfo(caseId);
            // Загрузка списка ROM
            loadROMs(caseId);
        } else {
            // Сброс выбора корпуса
            resetCaseInfo();
            // Сброс выбора ROM
            resetROMs();
        }
    });

    // Обработчик выбора накопителя
    $('#rom-select').change(function () {
        var romId = $(this).val();
        if (romId) {
            // Загрузка информации о выбранном накопителе
            loadROMInfo(romId);
            // Активация кнопки "Собрать ПК"
            enableBuildButton();
        } else {
            // Сброс выбора накопителя
            resetROMInfo();
            // Деактивация кнопки "Собрать ПК"
            disableBuildButton();
        }
    });

    // Активация кнопки "Собрать ПК"
    function enableBuildButton() {
        var processorId = $('#processor-select').val();
        var motherboardId = $('#motherboard-select').val();
        var ramId = $('#ram-select').val();
        var gpuId = $('#gpu-select').val();
        var psuId = $('#psu-select').val();
        var caseId = $('#case-select').val();
        var romId = $('#rom-select').val();

        if (processorId && motherboardId && ramId && gpuId && psuId && caseId && romId) {
            $('#build-button').prop('disabled', false);
        }
    }

    // Деактивация кнопки "Собрать ПК"
    function disableBuildButton() {
        $('#build-button').prop('disabled', true);
    }

    // Сброс выбора GPU
    function resetGpus() {
        $('#gpu-select').val('').prop('disabled', true);
    }

    // Сброс выбора PSU
    function resetPsus() {
        $('#psu-select').val('').prop('disabled', true);
    }

    // Обработчик нажатия кнопки "Собрать ПК"
    $('#build-button').click(function () {
        // Получение ID выбранных комплектующих
        var processorId = $('#processor-select').val();
        var motherboardId = $('#motherboard-select').val();
        var ramId = $('#ram-select').val();
        var gpuId = $('#gpu-select').val();
        var psuId = $('#psu-select').val();
        var caseId = $('#case-select').val();
        var romId = $('#rom-select').val();
        var userId = $('#user-id').val(); // Получение ID пользователя из скрытого поля формы

        // Проверка, что все комплектующие выбраны
        if (processorId && motherboardId && ramId && gpuId && psuId && caseId && romId && userId) {
            // Отправка AJAX-запроса на сервер
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                url: '/save-config', // Замените на URL вашего обработчика сохранения в базу данных
                method: 'POST',
                data: {
                    processorId: processorId,
                    motherboardId: motherboardId,
                    ramId: ramId,
                    gpuId: gpuId,
                    psuId: psuId,
                    caseId: caseId,
                    romId: romId,
                    userId: userId
                },
                success: function (response) {
                    // Обработка успешного ответа от сервера
                    console.log(response);
                    // Вывод сообщения пользователю
                    alert('Сборка сформирована!');
                    // Перенаправление на страницу с заказами
                    window.location.href = '/profile'; // Замените на URL вашей страницы с заказами
                },
                error: function (xhr, status, error) {
                    // Обработка ошибки
                    console.log(xhr.responseText);
                    alert('Произошла ошибка. Попробуйте еще раз.');
                }
            });
        } else {
            // Если не все комплектующие выбраны, выводите сообщение об ошибке
            alert('Выберите все комплектующие перед сборкой ПК.');
        }
    });
});
// Форма звонка
$(document).ready(function () {
    $('.zagab').click(function (event) {
        event.preventDefault();
        $('#callFormOverlay').fadeIn();
    });

    $('#closeForm').click(function () {
        $('#callFormOverlay').fadeOut();
    });

    $('#callForm').submit(function (event) {
        event.preventDefault();

        // Удаление сообщения об успешной отправке, если оно уже есть
        $('.alert-success').remove();

        // Получение данных из формы
        var formData = $(this).serialize();

        // Отправка AJAX-запроса
        $.ajax({
            url: '/submit_call_form',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function (response) {
                // Очистка полей формы
                $('#callForm')[0].reset();

                // Вывод сообщения об успешной отправке
                $('#callFormal').append('<div class="alert alert-success mt-3">' + '<p style="font-size: 24px;">' + response.message + '</p>' + '</div>');

                // Закрытие формы с плавностью через некоторое время
                setTimeout(function () {
                    $('#callFormal').fadeOut('slow');
                }, 3000); // Изменено на 5000 (5 секунд)
            },
            error: function (error) {
                // Обработка ошибок при отправке AJAX-запроса
                console.log(error);
            }
        });
    });

    $('#callFormOverlay').click(function (event) {
        if (event.target === this) {
            $(this).fadeOut();
        }
    });
});
$(document).ready(function () {
    $('#phone').mask('+0 (000) 000-00-00');
});

// Админка
// Заявки удаление
// Обработчик клика на кнопку удаления
$(document).on('click', '.delete-callback', function () {
    var callbackId = $(this).data('callback-id');
    var card = $(this).closest('.col-md-3');
    card.fadeOut(1000, function () {
        $(this).remove();
    });

    // AJAX запрос на удаление заявки
    $.ajax({
        url: '/admin/callbacks/' + callbackId,
        type: 'DELETE',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
});




