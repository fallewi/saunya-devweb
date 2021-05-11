<?php

/*
|--------------------------------------------------------------------------
| Refund System Routes
|--------------------------------------------------------------------------
|
| Here is where you can register admin routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Admin Panel
Route::group(['prefix' =>'admin', 'middleware' => ['auth', 'admin']], function(){

});

//FrontEnd User panel
Route::group(['middleware' => ['user', 'verified']], function(){

});

Route::group(['middleware' => ['auth']], function(){


});
