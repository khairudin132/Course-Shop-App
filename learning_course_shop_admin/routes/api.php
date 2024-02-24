<?php

use App\Admin\Controllers\CoursesController;
use App\Http\Controllers\Api\CourseController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group(['namespace' => 'Api'], function () {
    // Route::post('/login', [UserController::class, 'loginUser']);

    // Writing style if using global namespace for import controller
    Route::post('/login', 'UserController@loginUser');

    Route::group(['middleware' => 'auth:sanctum'], function () {
        Route::get('/course-type-list', 'CourseTypeController@courseTypeList');
        Route::get('/course-list', 'CourseController@courseList');
        Route::get('/course-detail', 'CourseController@courseDetail');
        Route::get('/course-detail', 'CourseController@courseDetail');
        Route::get('/lesson-list', 'LessonController@lessonList');
        Route::post('/checkout', 'PaymentController@checkout');
    });

    Route::any('/webGoHooks', 'PaymentController@webGoHooks');
});
