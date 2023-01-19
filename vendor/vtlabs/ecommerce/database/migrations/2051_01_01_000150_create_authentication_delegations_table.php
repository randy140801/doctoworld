<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAuthenticationDelegationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ecommerce_authentication_delegations', function (Blueprint $table) {
            $table->increments('id');
            $table->string('identifier');
            $table->string('type');
            $table->json('meta')->nullable();

            // vendor
            $table->integer('vendor_id')->unsigned()->nullable();
            $table->foreign('vendor_id')->references('id')->on('ecommerce_vendors')->onDelete('cascade');

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
        Schema::table('ecommerce_authentication_delegations', function (Blueprint $table) {
            $table->dropForeign(['vendor_id']);
        });

        // delete orders
        Schema::dropIfExists('ecommerce_authentication_delegations');
    }
}
