<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContactUsDetailsController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:api')->post('/logout', [AuthController::class, 'logout']);

Route::post('login', [AuthController::class, 'login']);
Route::post('createUser', [UserController::class, 'index']);
Route::post('saveContactDetails', [ContactUsDetailsController::class, 'index']);
Route::get('getContactList', [ContactUsDetailsController::class, 'getAll']);
Route::post('getSearchList', [ContactUsDetailsController::class, 'getSearch']);