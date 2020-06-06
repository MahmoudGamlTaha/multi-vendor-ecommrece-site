<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\LayoutUrl;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class LayoutUrlController extends Controller
{
    use HasResourceActions;

    protected $arrTarget = [];
    protected $arrGroup  = [];

    public function __construct()
    {
        $this->arrTarget = ['_blank' => '_blank', '_self' => '_self'];
        $this->arrGroup  = ['menu' => 'Menu', 'footer' => 'Footer'];
    }

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Index')
            ->description('description')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Edit')
            ->description('description')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Create')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new LayoutUrl);

        $grid->id('Id');
        $grid->name('Name')->display(function ($name) {
            return trans($name);
        });
        $grid->url('Url');
        $grid->module('Module');
        $grid->target('Action');
        $grid->group('Group');
        $grid->status('Status')->switch()->editable();
        $grid->sort('Sort')->editable();

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
        $show = new Show(LayoutUrl::findOrFail($id));

        $show->id('Id');
        $show->name('Name');
        $show->url('Url');
        $show->target('Action');
        $show->group('Group');
        $show->sort('Sort');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new LayoutUrl);

        $form->text('name', 'Name')->rules('required');
        $form->text('url', 'Url')->rules('required');
        $form->text('module', 'Module');
        $form->select('target', 'Action')->options($this->arrTarget)->default('_self');
        $form->select('group', 'Group')->options($this->arrGroup)->default('menu');
        $form->switch('status', 'Status')->default(1);
        $form->number('sort', 'Sort')->rules('numeric|min:0')->default(0);

        return $form;
    }
}
