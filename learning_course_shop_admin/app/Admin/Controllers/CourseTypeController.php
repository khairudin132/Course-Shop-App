<?php

namespace App\Admin\Controllers;

use App\Models\CourseType;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Tree;

class CourseTypeController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'CourseType';

    public function index(Content $content)
    {
        $tree = new Tree(new CourseType);
        return $content->header('Course Types')->body($tree);
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    // protected function grid()
    // {
    //     $grid = new Grid(new CourseType());

    //     $grid->column('id', __('Id'));
    //     $grid->column('title', __('Title'));
    //     $grid->column('parent_id', __('Parent id'));
    //     $grid->column('description', __('Description'));
    //     $grid->column('order', __('Order'));
    //     $grid->column('created_at', __('Created at'));
    //     $grid->column('updated_at', __('Updated at'));

    //     return $grid;
    // }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(CourseType::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('parent_id', __('Parent id'));
        $show->field('description', __('Description'));
        $show->field('order', __('Order'));
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
        $form = new Form(new CourseType());

        $form->select('parent_id', __('Parent Category'))->options((new CourseType())::selectOptions());
        $form->text('title', __('Title'));
        $form->textarea('description', __('Description'));
        $form->number('order', __('Order'));

        return $form;
    }
}
