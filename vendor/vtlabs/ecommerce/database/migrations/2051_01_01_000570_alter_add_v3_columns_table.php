<?php

use Vtlabs\Ecommerce\Models\Order;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterAddV3ColumnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasColumn('ecommerce_orders', 'order_type')) {
            Schema::table('ecommerce_orders', function (Blueprint $table) {
                $table->enum('order_type', [Order::ORDER_TYPE_CUSTOM, Order::ORDER_TYPE_NORMAL, Order::ORDER_TYPE_TAKEAWAY, Order::ORDER_TYPE_DINEIN])->default(Order::ORDER_TYPE_NORMAL);
            });
        }

        if (!Schema::hasColumn('ecommerce_orders', 'delivery_mode_id')) {
            Schema::table('ecommerce_orders', function (Blueprint $table) {
                $table->integer('delivery_mode_id')->unsigned()->nullable();
                $table->foreign('delivery_mode_id')->references('id')->on('ecommerce_delivery_modes')->onDelete('cascade');
            });
        }

        if (!Schema::hasColumn('ecommerce_order_addresses', 'type')) {
            Schema::table('ecommerce_order_addresses', function (Blueprint $table) {
                $table->enum('type', ['source', 'destination'])->default('destination');
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ecommerce_orders', function (Blueprint $table) {
            $table->dropForeign(['delivery_mode_id']);
        });

        Schema::table('ecommerce_orders', function (Blueprint $table) {
            $table->dropColumn('delivery_mode_id');
            $table->dropColumn('order_type');
        });

        Schema::table('ecommerce_order_addresses', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
}
