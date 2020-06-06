<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ConfigGlobal;
use App\Models\ShopCurrency;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\MessageBag;

class CurrencyController extends Controller
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
            ->header(trans('language.currency.manager'))
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
            ->header(trans('language.currency.manager'))
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
            ->header(trans('language.currency.manager'))
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
            ->header(trans('language.currency.manager'))
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
        $grid = new Grid(new ShopCurrency);

        // $grid->id('Id');
        $grid->name(trans('language.currency.name'));
        $grid->code(trans('language.currency.code'));
        $grid->symbol(trans('language.currency.symbol'));
        $grid->exchange_rate(trans('language.currency.rate'));
        $grid->thousands(trans('language.currency.thousands'));
        $grid->precision(trans('language.currency.precision'));
        $grid->symbol_first(trans('language.currency.symbol_first'));
        $grid->status(trans('language.currency.status'));
        $grid->sort(trans('language.currency.sort'));
        $grid->actions(function ($actions) {
            if ($actions->getKey() == 1) {
                // 1: usd
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
        $show = new Show(ShopCurrency::findOrFail($id));

        $show->id('Id');
        $show->name('Name');
        $show->code('Code');
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
        $form          = new Form(new ShopCurrency);
        $arrParameters = request()->route()->parameters();
        $idCheck       = (int) end($arrParameters);
        $form->text('name', trans('language.currency.name'));
        if ($idCheck == '1') {
            $form->display('code', trans('language.currency.code'));
        } else {
            $form->text('code', 'Code')->rules(function ($form) {
                return 'required|unique:shop_currency,code,' . $form->model()->id . ',id';
            })->placeholder('Ex: USD, VND, ..')->help(trans('validation.validate_nickname'));
        }
        $form->text('symbol', trans('language.currency.symbol'));
        $form->number('exchange_rate', trans('language.currency.rate'));
        $form->number('precision', trans('language.currency.precision'));
        $form->text('thousands', trans('language.currency.thousands'));
        $form->switch('symbol_first', trans('language.currency.symbol_first'));
        $form->switch('status', trans('language.currency.status'))->default(1);
        $form->number('sort', trans('language.currency.sort'))->rules('numeric|min:0')->default(0);
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
