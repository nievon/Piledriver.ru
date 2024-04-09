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
        Schema::create('socketdrams', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('socket_id');
            $table->unsignedBigInteger('dram_id');
            $table->foreign('socket_id')->references('id')->on('sockets')->onDelete('cascade');
            $table->foreign('dram_id')->references('id')->on('drams')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('socketdrams');
    }
};
