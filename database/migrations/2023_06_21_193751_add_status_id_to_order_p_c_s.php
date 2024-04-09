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
        Schema::table('order_p_c_s', function (Blueprint $table) {
            if (!Schema::hasColumn('order_p_c_s', 'status_id')) {
                $table->unsignedBigInteger('status_id')->nullable()->default(1);
                $table->foreign('status_id')->references('id')->on('statys')->onDelete('cascade');
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_p_c_s', function (Blueprint $table) {
            $table->dropForeign(['status_id']);
            $table->dropColumn('status_id');
        });
    }
};
