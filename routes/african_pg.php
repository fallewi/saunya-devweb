<?php

Route::get('/african/configuration', 'AfricanPaymentGatewayController@configuration')->name('african.configuration');
Route::get('/african/credentials_index', 'AfricanPaymentGatewayController@credentials_index')->name('african_credentials.index');

//Mpesa

Route::prefix('lnmo')->group(function ()
{

});

//Mpesa End

// RaveController start


// RaveController end

//Payfast routes <starts>


//Payfast routes <ends>
