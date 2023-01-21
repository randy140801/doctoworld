<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFeedbacksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ecommerce_feedback_questions', function (Blueprint $table) {
            $table->increments('id');
            $table->json('title')->nullable();
            $table->json('meta')->nullable();

            // vendor
            $table->integer('vendor_id')->unsigned()->nullable();
            $table->foreign('vendor_id')->references('id')->on('ecommerce_vendors')->onDelete('cascade');

            $table->timestamps();            
        });

        Schema::create('ecommerce_feedback_options', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('rank')->unsigned();

            $table->json('title')->nullable();

            // vendor
            $table->integer('vendor_id')->unsigned()->nullable();
            $table->foreign('vendor_id')->references('id')->on('ecommerce_vendors')->onDelete('cascade');

            $table->timestamps();            
        });

        Schema::create('ecommerce_feedback_results', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('rank')->unsigned();

            // vendor
            $table->integer('feedback_question_id')->unsigned()->nullable();
            $table->foreign('feedback_question_id')->references('id')->on('ecommerce_feedback_questions')->onDelete('cascade');

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
        Schema::table('ecommerce_feedback_results', function (Blueprint $table) {
            $table->dropForeign(['feedback_question_id']);
        });

        Schema::table('ecommerce_feedback_options', function (Blueprint $table) {
            $table->dropForeign(['vendor_id']);
        });

        Schema::table('ecommerce_feedback_questions', function (Blueprint $table) {
            $table->dropForeign(['vendor_id']);
        });

        // delete
        Schema::dropIfExists('ecommerce_feedback_results');
        Schema::dropIfExists('ecommerce_feedback_options');
        Schema::dropIfExists('ecommerce_feedback_questions');
    }
}
