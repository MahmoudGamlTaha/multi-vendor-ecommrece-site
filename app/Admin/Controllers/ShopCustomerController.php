<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\ExcelExpoter;
use App\Http\Controllers\Controller;
use App\User;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopCustomerController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header(trans('language.order.customer'));
            $content->description(' ');
            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header(trans('language.order.customer'));
            $content->description(' ');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header(trans('language.order.customer'));
            $content->description(' ');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(User::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->email('Email')->sortable();
            $grid->name(trans('language.order.customer_name'))->sortable();

            $grid->created_at(trans('language.admin.created_at'));
            $grid->updated_at(trans('language.admin.last_modify'));
            $grid->model()->orderBy('id', 'desc');
            $grid->exporter(new ExcelExpoter('dataCustomer', 'Customer list'));
            $grid->actions(function ($actions) {
                $actions->disableView();
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(User::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->text('name', trans('language.order.customer_name'));
            $form->email('email', 'Email');
            $form->password('password', 'Password')->rules('required| min:6');
            $form->text('address1', trans('language.order.shipping_address1'));
            $form->text('address2', trans('language.order.shipping_address2'));
            $form->text('phone', trans('language.order.shipping_phone'));
            $form->saving(function (Form $form) {
                if ($form->password) {
                    $form->password = bcrypt($form->password);
                } else {
                    $form->password = $form->model()->password;
                }
            });
            $form->model()->company_id = $this->getUserCompany()[0]->id;
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->tools(function (Form\Tools $tools) {
                $tools->disableView();
            });

        });
    }

    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(ShopCategory::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
