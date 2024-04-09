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
        Schema::table('roms', function (Blueprint $table) {
            $table->string('brand');
            $table->string('storage_type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('roms', function (Blueprint $table) {
            $table->dropColumn('brand');
            $table->dropColumn('storage_type');
        });
    }
};
