<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UsersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Users';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('email', __('Email'));
        // $grid->column('email_verified_at', __('Email verified at'));
        // $grid->column('remember_token', __('Remember token'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        // $grid->column('token', __('Token'));
        // $grid->column('uid', __('Uid'));
        $grid->column('phone', __('Phone')); 
        // $grid->column('deleted_at', __('Deleted at'));
        // $grid->column('access_token', __('Access token'));
        // $grid->column('type', __('Type'));
        // $grid->column('avatar', __('Avatar'));
        $grid->disableActions();
        $grid->disableCreateButton();

        return $grid;
    }

    /**
     * Make a show builder to show user individual details.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('email_verified_at', __('Email verified at'));
        $show->field('remember_token', __('Remember token'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('token', __('Token'));
        $show->field('uid', __('Uid'));
        $show->field('phone', __('Phone'));
        $show->field('deleted_at', __('Deleted at'));
        $show->field('access_token', __('Access token'));
        $show->field('type', __('Type'));
        $show->field('avatar', __('Avatar'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User());

        $form->text('name', __('Name'));
        $form->email('email', __('Email'));
        $form->datetime('email_verified_at', __('Email verified at'))->default(date('Y-m-d H:i:s'));
        $form->text('remember_token', __('Remember token'));
        $form->text('token', __('Token'));
        $form->text('uid', __('Uid'));
        $form->mobile('phone', __('Phone'));
        $form->text('access_token', __('Access token'));
        $form->number('type', __('Type'));
        $form->textarea('avatar', __('Avatar'));

        return $form;
    }
}
