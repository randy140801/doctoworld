<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterVendorsAddPlanSortorderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ecommerce_vendors', function (Blueprint $table) {
            $table->integer('plan_sort_order')->unsigned()->default(100);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ecommerce_vendors', function (Blueprint $table) {
            $table->dropColumn('plan_sort_order');
        });
    }
}