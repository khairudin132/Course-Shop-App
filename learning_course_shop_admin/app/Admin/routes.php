<?php

use App\Admin\Controllers\CoursesController;
use App\Admin\Controllers\CourseTypeController;
use App\Admin\Controllers\LessonController;
use App\Admin\Controllers\UsersController;
use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('/users', UsersController::class);
    $router->resource('/course-types', CourseTypeController::class);
    $router->resource('/courses', CoursesController::class);
    $router->resource('/lessons', LessonController::class);
});
