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
        Schema::create('catalogs', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('img');
            $table->decimal('price', 15, 5);
            $table->string('tagline');
            $table->string('description');
            $table->string('motherboard');
            $table->string('CPU');
            $table->string('GPU');
            $table->string('RAM');
            $table->string('ROM');
            $table->string('PSU');
            $table->string('coolingsys');
            $table->string('CASE');
            $table->integer('FPS');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('catalogs');
    }
};
