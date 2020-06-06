<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Config;
use App\Models\UofmGroups;
use App\Models\Uofms;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Http\Request;
//sprint 3
class UnitOfMeasureController extends Controller
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

            $content->header(trans('language.admin.config_control'));
            $content->description(' ');
            $content->body($this->grid());
         //   $content->row(function (Row $row) {
                //$row->column(1 / 2, new Box(trans('language.admin.config_email'), $this->viewSMTPConfig()));
              //  $row->column(1 / 2, new Box(trans('language.admin.config_display'), $this->viewDisplayConfig()));
           // });

        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(UofmGroups::class, function (Grid $grid) {

            $grid->id('ID')->sortable(); 
            $grid->code(trans("admin.code"));
            $grid->name(trans("admin.name"));
            $grid->model()->orderBy('id', 'desc');
            $grid->disableRowSelector();
            $grid->disableFilter();
            $grid->actions(function ($actions) {
                $actions->disableView();
            });
            $grid->tools(function ($tools) {
                $tools->disableRefreshButton();
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($id = null)
    {
        return Admin::form(UofmGroups::class, function (Form $form) use($id) {

            $form->display('id', 'ID');
            $form->text('code', 'Code');
            $form->text('name', 'name');
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->divider();
            $data= [];
            $fields = [];
            $uofms = Uofms::where('group_id', $id)->get();
           
            foreach($uofms as $key => $uofm){
                $data["title"] = $uofm->code;  
                $data['codeValue'] = $uofm->code;
                $data["key"] = $uofm->id;   
                $data["value"] = $uofm->name;
                $data["nameField"] = 'name';  
                $data["codeField"] = 'code';  
                $data["amountField"] = 'amount_in_base';  
                $data["amount"] = $uofm->amount_in_base;
                $data["type"] = "text";   
                $data["source"] = '';
                $data["url"] = route('updateUofmFields');
               // $data["url3"] = route('updateConfigField');
                $data["required"]=  0;
                $data["disabled"] = 0;
              array_push($fields, $data);
            }
            $form->html(   view('admin.uofm')->with([
                "datas" => $fields,
            ])->render());
        
    });
}

    public function updateUofm(Request $request)
    {
        $data  = $request->all();
        $key   = $data['pk'];
        
        $field = $data['name'];
        $value = $data['value'];
        Uofms::where('id', $key)->update([$field => $value]);
    }

    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header(trans('language.admin.units'));
            $content->description(' ');

            $content->body($this->form($id)->edit($id));
        });
    }

    /** sprint3
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header(trans('language.admin.units'));
            $content->description(' ');

            $content->body($this->form());
        });
    }
}
