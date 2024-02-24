<?php

namespace App\Admin\Controllers;

use App\Models\Course;
use App\Models\CourseType;
use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CoursesController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Courses';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Course());

        $grid->column('id', __('Id'));
        $grid->column('user_token', __('Teacher'))->display(function ($user_token) {
            return User::where('token', '=', $user_token)->value('name');
        });
        $grid->column('name', __('Name'));
        $grid->column('thumbnail', __('Thumbnail'))->image('', 50, 50);
        $grid->column('description', __('Description'));
        $grid->column('type_id', __('Category'))->display(function ($type_id) {
            return CourseType::where('id', '=', $type_id)->value('title');
        });
        $grid->column('price', __('Price'))->display(function ($price) {
            return 'RM' . number_format($price, 2);
        });
        $grid->column('lesson_num', __('Lesson num'));
        $grid->column('video_length', __('Video length'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Course::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_token', __('Teacher'))->display(function ($user_token) {
            return User::find($user_token)->name;
        });
        $show->field('name', __('Name'));
        $show->field('thumbnail', __('Thumbnail'));
        $show->field('description', __('Description'));
        $show->field('type_id', __('Category'))->display(function ($type_id) {
            return CourseType::where('id', '=', $type_id)->value('title');
        });
        $show->field('price', __('Price'))->display(function ($price) {
            return 'RM' . number_format($price, 2);
        });
        $show->field('lesson_num', __('Lesson num'));
        $show->field('video_length', __('Video length'));
        $show->field('follow', __('Follow'));
        $show->field('score', __('Score'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Course());
        $form->text('name', __('Name'));
        $result = CourseType::pluck('title', 'id');
        $form->select('type_id', __('Category'))->options($result);
        $form->image('thumbnail', __('Thumbnail'))
            ->uniqueName()
            ->attribute('accept', 'image/jpeg,image/png,image/jpg');
        $form->file('video', __('Video'))
            ->uniqueName()
            ->attribute('accept', 'video/mp4,video/ogg,video/webm,video/avi,video/mpeg,video/quicktime,video/x-ms-wmv');
        $form->text('description', __('Description'));
        $form->decimal('price', __('Price'));
        $form->number('lesson_num', __('Lesson number'));
        $form->number('video_length', __('Video length'));
        $result = User::pluck('name', 'token');
        $form->select('user_token', __('Teacher'))->options($result);
        return $form;
    }
}
