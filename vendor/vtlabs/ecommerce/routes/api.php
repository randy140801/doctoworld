<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


use Illuminate\Http\Request;

Route::middleware('api')->prefix('api')->name('api')->namespace('Vtlabs\Ecommerce\Http\Controllers\Api')->group(function () {
    Route::namespace('Admin')->name('admin')->prefix('admin')->group(function () {
        
        Route::get('products/download-template-file', 'ProductController@downloadTemplateFile');
        Route::post('products/import-file', 'ProductController@importFromFile');

        Route::middleware('auth:api')->group(function () {
            Route::apiResource('vendors', 'VendorController');
            Route::apiResource('products', 'ProductController');
            Route::apiResource('orders', 'OrderController');
            Route::apiResource('coupons', 'CouponController');
            Route::apiResource('deliverymodes', 'DeliveryModeController');
            Route::apiResource('deliveries', 'DeliveryProfileController');
            Route::apiResource('coupons', 'CouponController');
            Route::apiResource('appointments', 'AppointmentController')->except(['create']);

            Route::get('/dashboard/order-analytics', 'DashboardController@orderAnalytics');
            Route::get('/dashboard/progress-info', 'DashboardController@progressInfo');
            Route::get('/dashboard/active-order-locations', 'DashboardController@activeOrderLocations');
        });
    });

    // coupon
    Route::get('coupons', 'CouponController@index');

    // vendor
    Route::get('vendors/list', 'VendorController@index');
    Route::get('vendors/{vendor}', 'VendorController@show');
    Route::get('vendors/ratings/{vendor}', 'VendorController@ratingList');
    Route::get('vendors/ratings/summary/{vendor}', 'VendorController@ratingSummary');
    Route::get('products', 'ProductController@index');
    Route::get('products/{product}', 'ProductController@show');
    Route::get('products/ratings/{product}', 'ProductController@ratingList');
    Route::get('products/ratings/vendor/{vendor}', 'ProductController@ratingListByVendor');
    Route::get('products/ratings/summary/{product}', 'ProductController@ratingSummary');
    Route::get('products/ratings/{product}', 'ProductController@ratingList');

    // authentication delegation
    Route::post('authetication-delegations/authenticate', 'AuthenticationDelegationController@authenticate');

    Route::get('appointment', 'AppointmentController@index');
    Route::post('appointment', 'AppointmentController@store');
    Route::put('appointment/{appointment}', 'AppointmentController@update');

    // plan 
    Route::get('plans', 'PlanController@index');

    // order can be placed without authentication
    Route::post('orders', 'OrderController@store');
    Route::put('orders/{order}', 'OrderController@update');

    Route::middleware('auth:api')->group(function () {
        // coupon
        Route::get('coupons/check-validity', 'CouponController@checkValidity');
        Route::post('coupons', 'CouponController@store');
        Route::put('coupons/{coupon}', 'CouponController@update');
        Route::delete('coupons/{coupon}', 'CouponController@destroy');

        // product
        Route::post('products', 'ProductController@store');
        Route::put('products/{product}', 'ProductController@update');
        Route::put('products/{product}/stock', 'ProductController@updateStock');
        Route::post('products/ratings/{product}', 'ProductController@ratingStore');
        Route::get('products/favourites/list', 'ProductController@favourites');
        Route::post('products/favourites/{product}', 'ProductController@toggleFavourite');

        // vendor
        Route::get('vendors', 'VendorController@showMyProfile');
        Route::put('vendors/{vendor}', 'VendorController@update');
        Route::get('vendors/insights/{vendor}', 'VendorController@insights');
        Route::get('vendors/insights-order-type/{vendor}', 'VendorController@insightsOrderType');
        Route::get('vendors/insights-categories/{vendor}', 'VendorController@insightsCategory');
        Route::get('vendors/insights-feedback/{vendor}', 'VendorController@feedbackInsights');
        Route::post('vendors/ratings/{vendor}', 'VendorController@ratingStore');
        Route::get('vendors/favourites/list', 'VendorController@favourites');
        Route::post('vendors/favourites/{vendor}', 'VendorController@toggleFavourite');

        // feedback
        Route::get('vendors/feedback/{vendor}', 'VendorController@feedbackListQuestions');
        Route::post('vendors/feedback/{vendor}', 'VendorController@feedbackSaveQuestions');
        Route::post('vendors/feedback-submit/{vendor}', 'VendorController@feedbackSubmitResult');

        // address
        Route::get('addresses', 'AddressController@index');
        Route::post('addresses', 'AddressController@store');
        Route::put('addresses/{address}', 'AddressController@update');
        Route::delete('addresses/{address}', 'AddressController@destroy');

        Route::apiResource('customers', 'CustomerController')->except(['show']);

        // order
        Route::get('orders/calculate-delivery-fee', 'OrderController@calculateDeliveryFee');
        Route::get('orders', 'OrderController@index');
        Route::get('orders/{order}', 'OrderController@show');

        // delivery
        Route::get('delivery', 'DeliveryProfileController@showMyProfile');
        Route::put('delivery/{delivery}', 'DeliveryProfileController@update');
        Route::get('delivery/{delivery}/summary', 'DeliveryProfileController@summary');
        Route::get('delivery/{delivery}/order', 'DeliveryProfileController@currentOrder');
        Route::get('delivery/{delivery}/request', 'DeliveryProfileController@deliveryRequest');
        Route::put('delivery/request/{deliveryRequest}', 'DeliveryProfileController@updateDeliveryRequest');
        Route::get('delivery-modes', 'DeliveryProfileController@deliveryModes');

        // authentication delegation
        Route::get('authetication-delegations', 'AuthenticationDelegationController@index');
        Route::post('authetication-delegations', 'AuthenticationDelegationController@storeBulk');

        // plans
        Route::post('plans/{vendor}/{plan}', 'PlanController@purchasePlan');
    });
});
