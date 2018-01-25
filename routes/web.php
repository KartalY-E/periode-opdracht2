<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', 'HomeController@index');

Auth::routes();

Route::post('/home/all', 'HomeController@showmore');
Route::get('/home', 'HomeController@index');

Route::get('/profile','HomeController@profile');
Route::post('/updateprofile','PostController@updateprofile');

Route::post('/profile','Auth\RegisterController@updateuser'); // !! werk ni

Route::post("/addpost","PostController@addpost");
Route::get('/post'   ,function(){return view("post");   });

Route::get('/view/{id}'     , 'PostController@postviewpage');
Route::post('/comment/{id}' , 'PostController@comment');

Route::get('/like/{id}', 'PostController@like');
Route::get('/dislike/{id}', 'PostController@dislike');

Route::get('/likehome/{id}', 'PostController@likehome');
Route::get('/dislikehome/{id}', 'PostController@dislikehome');


Route::get('/home/old' , 'HomeController@old');
Route::get('/home/new' , 'HomeController@new');
Route::get('/home/title' , 'HomeController@title');

Route::post('/search' , 'PostController@search');
