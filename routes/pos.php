<?php

/*
|--------------------------------------------------------------------------
| POS Routes
|--------------------------------------------------------------------------
|
| Here is where you can register admin routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



//Admin
Route::group(['prefix' =>'admin', 'middleware' => ['auth', 'admin']], function(){

});
Route::group(['prefix' =>'seller', 'middleware' => ['seller', 'verified']], function(){
    //pos

});
