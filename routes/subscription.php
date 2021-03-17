<?php

Route::group(['prefix' =>'admin', 'middleware' => ['auth', 'admin']], function(){

	// subscription 
	Route::get('/subscription', 'SubscriptionController@index')->name('subscription-index');
	Route::get('/subscription/create', 'SubscriptionController@create')->name('subscription-create');
	Route::post('/subscription/create', 'SubscriptionController@store')->name('subscription-store');
	Route::get('/subscription/edit/{id}', 'SubscriptionController@edit')->name('subscription-edit');
	Route::post('/subscription/edit/{id}', 'SubscriptionController@update')->name('subscription-update');
	Route::get('/subscription/delete/{id}', 'SubscriptionController@destroy')->name('subscription-delete');
	
	Route::get('/seller/subscriptions', 'SubscriptionController@seller_subscription')->name('seller_subscription');
	Route::get('/seller/subscriptions/view/{id}', 'SubscriptionController@seller_subscription_view')->name('seller_subscription_view');
	Route::get('/seller/subscriptions/invoice/{id}', 'SubscriptionController@seller_subscription_invoice')->name('seller.subscription.download');
  
    // end subscription 
});


Route::group(['prefix' =>'seller', 'middleware' => ['seller', 'verified']], function(){
	// package 
	Route::get('/package', 'SubscriptionController@package')->name('package');
	Route::get('/subscription/{id}', 'SubscriptionController@vendorrequest')->name('vendor-request');
	Route::post('/vendor-request', 'SubscriptionController@vendorrequestsub')->name('vendor-request-submit');
	//Paypal START
    //Stripe END
});