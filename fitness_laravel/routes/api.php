<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CoachController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\ServiceTypeController;
use App\Http\Controllers\TypeController;
use App\Http\Controllers\UsageController;
use App\Http\Controllers\UserCategoryController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('users', UserController::class);
Route::resource('services', ServiceController::class);
Route::resource('categories', CategoryController::class);
Route::resource('types', TypeController::class);
Route::resource('coaches', CoachController::class);
Route::resource('categories.users', UserCategoryController::class)->only(['index']);
Route::resource('types.services', ServiceTypeController::class)->only(['index']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) {
        return auth()->user();
    });

    // Route::group(['middleware' => ['admin']], function () {
    // });
    
    Route::resource('services', ServiceController::class)->only(['update', 'store', 'delete']);//->middleware('admin');
    Route::resource('categories', CategoryController::class)->only(['update', 'store', 'delete']);//->middleware('admin');
    Route::resource('types', TypeController::class)->only(['update', 'store', 'delete']);//->middleware('admin');
    Route::resource('coaches', CoachController::class)->only(['update', 'store', 'delete']);//->middleware('admin');
    Route::resource('usages', UsageController::class)->only(['index','update', 'store', 'delete']);
    Route::put('/update-user', [AuthController::class, 'update']);

    Route::post('/logout', [AuthController::class, 'logout']);
});

