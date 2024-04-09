<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('psus', function (Blueprint $table) {
            // Удаление ограничения внешнего ключа
            $table->dropForeign(['psuwatt_id']);
            // Удаление столбца 'psuwatt_id'
            $table->dropColumn('psuwatt_id');
            // Добавление столбца "мощность"
            $table->integer('power')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('psus', function (Blueprint $table) {
            // Добавление столбца 'psuwatt_id'
            $table->unsignedBigInteger('psuwatt_id');
            // Добавление ограничения внешнего ключа
            $table->foreign('psuwatt_id')->references('id')->on('psuwatts');
            // Удаление столбца "мощность"
            $table->dropColumn('power');
        });
    }
};
