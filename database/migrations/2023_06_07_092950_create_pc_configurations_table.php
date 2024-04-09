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
        Schema::create('pc_configurations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('processor_id');
            $table->unsignedBigInteger('motherboard_id');
            $table->unsignedBigInteger('ram_id');
            $table->unsignedBigInteger('gpu_id');
            $table->unsignedBigInteger('psu_id');
            $table->unsignedBigInteger('case_id');
            $table->unsignedBigInteger('rom_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('processor_id')->references('id')->on('processors');
            $table->foreign('motherboard_id')->references('id')->on('motherboards');
            $table->foreign('ram_id')->references('idss')->on('rams');
            $table->foreign('gpu_id')->references('id')->on('gpus');
            $table->foreign('psu_id')->references('id')->on('psus');
            $table->foreign('case_id')->references('id')->on('casees');
            $table->foreign('rom_id')->references('id')->on('roms');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pc_configurations');
    }
};
