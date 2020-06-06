<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ConfigGlobal;
use App\Models\Language;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\MessageBag;

class LanguageController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('language.admin.language_manager'))
            ->description(' ')
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
            ->header(trans('language.admin.language_manager'))
            ->description(' ')
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
            ->header(trans('language.admin.language_manager'))
            ->description(' ')
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
            ->header(trans('language.admin.language_manager'))
            ->description(' ')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Language);

        $grid->id('Id');
        $grid->name('Name');
        $grid->code('Code');
        $grid->icon('Icon')->image('', 50);
        $grid->status('Status');
        $grid->sort('Sort');
        $grid->actions(function ($actions) {
            if ($actions->getKey() == 1) {
                // 1: en
                $actions->disableDelete();
            }
            $actions->disableView();
        });
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableFilter();
        $grid->disablePagination();
        $grid->tools(function ($tools) {
            $tools->disableRefreshButton();
        });
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
        $show = new Show(Language::findOrFail($id));

        $show->id('Id');
        $show->name('Name');
        $show->code('Code');
        $show->icon('Icon');
        $show->status('Status');
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
        $form          = new Form(new Language);
        $arrParameters = request()->route()->parameters();
        $idCheck       = (int) end($arrParameters);
        $form->text('name', 'Name');

        if ($idCheck == '1') {
            $form->display('code', 'Code');
        } else {
            $form->text('code', 'Code')->rules(function ($form) {
                return 'required|unique:language,code,' . $form->model()->id . ',id';
            })->placeholder('Ex: vi, au, en,..')->help(trans('validation.validate_nickname'));
        }
        $form->image('icon', 'Icon')->move('language');
        $form->switch('status', 'Status')->default(1);
        $form->number('sort', 'Sort')->rules('numeric|min:0')->default(0);
        $form->disableViewCheck();
        $form->disableEditingCheck();
        $form->tools(function (Form\Tools $tools) use ($idCheck) {
            $tools->disableView();
            if ($idCheck == '1') {
                $tools->disableDelete();
            }

        });

        $form->saving(function (Form $form) {
            if ($form->status === 0 || $form->status === 'off') {
                $locale = ConfigGlobal::first()->locale;
                if ($locale == $form->code) {
                    $error = new MessageBag([
                        'title'   => trans('language.admin.access_denied'),
                        'message' => trans('language.admin.access_denied_msg'),
                    ]);
                    return back()->with(compact('error'));
                }

            }
        });
        return $form;
    }
}
