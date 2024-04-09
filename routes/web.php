<?php

use App\Http\Controllers\ConfiguratorController;
use App\Http\Controllers\catalog;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\RecallController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\PcConfigurationController;
use App\Http\Controllers\AvatarController;
use App\Http\Controllers\CallRequestController;
use App\Http\Controllers\AdminController;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Processor;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();
// main 
Route::get('/', [catalog::class, 'cataloglist']);
Route::get('/sborki', [catalog::class, 'sborki']);
Route::get('/where', [catalog::class, 'where']);
Route::get('/rules', [catalog::class, 'rules']);
Route::get('/sborkapc/{product}', [catalog::class, 'onelist']); //вывод одного товара и всей его информации
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
// чат
Route::get('/chat', [ChatController::class, 'show']);
Route::post('/chat/process-message', [ChatController::class, 'processMessage']);
// Отзывы
Route::get('/recalls/create', [RecallController::class, 'create'])->name('recalls.create');
Route::post('/recalls', [RecallController::class, 'store'])->name('recalls.store');
// Профиль
Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
Route::put('/profile', [ProfileController::class, 'update'])->name('profile.update');

// Конфигрутор
Route::get('/configurator', [ConfiguratorController::class, 'index']);
Route::get('/configurator/processors', [ConfiguratorController::class, 'getProcessors']);
Route::get('/configurator/sockets', [ConfiguratorController::class, 'getsockets']);
Route::get('/configurator/processors/{id}', [ConfiguratorController::class, 'getProcessorsshow']);
Route::get('/configurator/motherboards/{id}', [ConfiguratorController::class, 'getmothersshow']);
Route::get('/configurator/sockets/{id}', [ConfiguratorController::class, 'getsocketsshow']);
Route::get('/configurator/dram/{id}', [ConfiguratorController::class, 'getdramsshow']);
Route::get('/configurator/motherboards', [ConfiguratorController::class, 'getMotherboardsByProcessor'])->name('configurator.motherboards');
Route::get('/configurator/ramss', [ConfiguratorController::class, 'getRams']);
Route::get('/configurator/ramss/{id}', [ConfiguratorController::class, 'getramsshow']);
Route::get('/configurator/gpus', [ConfiguratorController::class, 'getGpus']);
Route::get('/configurator/gpus/{id}', [ConfiguratorController::class, 'getgpusshow']);
Route::get('/configurator/psus', [ConfiguratorController::class, 'getPsus']);
Route::get('/configurator/psus/{id}', [ConfiguratorController::class, 'getpsusshow']);
Route::get('/configurator/roms', [ConfiguratorController::class, 'getRoms']);
Route::get('/configurator/roms/{id}', [ConfiguratorController::class, 'getromsshow']);
Route::get('/configurator/cases', [ConfiguratorController::class, 'getCasees']);
Route::get('/configurator/cases/{id}', [ConfiguratorController::class, 'getcasesshow']);
Route::post('/save-config', [PcConfigurationController::class, 'saveConfig']);
// Корзина
Route::post('/cart/add/{id}', [catalog::class, 'addToCart'])->name('cart.add');
Route::get('/basket', [catalog::class, 'cart'])->name('cart');
Route::delete('/cart/remove/{id}', [catalog::class, 'removeFromCart'])->name('cart.remove');
Route::post('/cart/update/{id}', [catalog::class, 'updateCart'])->name('cart.update');
// заказ офрмление
Route::post('/order', [catalog::class, 'storeOrder'])->name('order.store');
// Заказать звонок
Route::post('/submit_call_form', [CallRequestController::class, 'store']);
// Админка
Route::middleware(['auth', 'admin'])->group(function () {
    // Главная страница админ-панели
    Route::get('/admin', [AdminController::class, 'index'])->name('admin.index');

    // Маршруты для просмотра заказов, сборок и отзывов
    Route::get('/admin/orders', [AdminController::class, 'orders'])->name('admin.orders');
    Route::get('/admin/configurations', [AdminController::class, 'configurations'])->name('admin.configurations');
    Route::post('admin/configurations/{id}/status', [AdminController::class, 'updateConfigurationStatus'])->name('admin.configuration.updateStatus');
    Route::post('/admin/order/{id}/update-status', [AdminController::class, 'updateOrderStatus'])->name('admin.order.updateStatus');
    Route::get('/admin/reviews', [AdminController::class, 'reviews'])->name('admin.reviews');
    Route::delete('/admin/reviews/{id}', [AdminController::class, 'deleteReview'])->name('admin.reviews.delete');
    Route::post('/admin/reviews/{id}/avatar', [AdminController::class, 'updateAvatar'])->name('admin.reviews.avatar');
    Route::delete('admin/callbacks/{id}', [AdminController::class, 'deleteCallback'])->name('admin.callback.delete');
});
