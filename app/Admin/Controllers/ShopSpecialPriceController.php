<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopProduct;
use App\Models\ShopSpecialPrice;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopSpecialPriceController extends Controller
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

            $content->header(trans('language.admin.special_price_manager'));
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

            $content->header(trans('language.admin.special_price_manager'));
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

            $content->header(trans('language.admin.special_price_manager'));
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
        return Admin::grid(ShopSpecialPrice::class, function (Grid $grid) {

            $grid->id(trans('language.admin.sort'))->sortable();
            $grid->product(trans('language.admin.product'))->display(function ($product) {
                return $product['name'] . "<br>(SKU: " . $product['sku'] . ")";
            });
            $grid->price(trans('language.admin.special_price'))->display(function ($price) {
                return number_format($price);
            });
            $grid->date_start(trans('language.admin.date_start'))->display(function ($date) {
                return ($date) ?? '<span style="color:red">NULL</span>';
            })->sortable();
            $grid->date_end(trans('language.admin.date_end'))->display(function ($date) {
                return ($date) ?? '<span style="color:red">NULL</span>';
            })->sortable();
            $grid->comment(trans('language.admin.comment'));
            $grid->status(trans('language.admin.status'))->switch();
            $grid->created_at(trans('language.admin.created_at'));
            $grid->model()->orderBy('id', 'desc');
            $grid->disableExport();
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
    protected function form()
    {
        Admin::script($this->jsProcess());
        return Admin::form(ShopSpecialPrice::class, function (Form $form) {
            $company = $this->getUserCompany()[0]->id;
            $products = ShopProduct::getArrayProductNameForCompany($company);
            $form->select('product_id', trans('language.admin.product'))->options($products)->rules(function ($form) {
                return 'required|unique:shop_special_price,product_id,' . $form->model()->id . ',id';
            });

            $form->html('
        <div class="input-group">
        <span class="input-group-addon">Bit</span><input disabled style="width: 120px; text-align: right;" type="text" id="price-old"  value="0" class="form-control price">
        </div>', trans('language.admin.origin_price'));
            $form->model()->company_id =  $company ;
            $form->currency('off', trans('language.admin.discount_percent'))->symbol('%')->options(['digits' => 0])->default(0);
            $form->currency('price', trans('language.admin.special_price'))->symbol('')->options(['digits' => 0])->default(0);
            $form->switch('status', trans('language.admin.status'));
            $form->datetime('date_start', trans('language.admin.date_start'));
            $form->datetime('date_end', trans('language.admin.date_end'));
            $form->textarea('comment', trans('language.admin.comment'));
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->tools(function (Form\Tools $tools) {
                $tools->disableView();
            });
        });
    }

    public function jsProcess()
    {
        $urlgetInfoProduct = route('getInfoProduct');
        return <<<JS
        $(document).ready(function(){
            var id = $('select[name*="product_id"]').val();
            $.ajax({
                url : '$urlgetInfoProduct',
                type : "get",
                datatype : "json",
                dateType:"application/json; charset=utf-8",
                data : {
                     id : id
                },
                success: function(result){
                    console.log(result);
                    var returnedData = JSON.parse(result);
                    $('#price-old').val(returnedData.price);
                }
            });
        });

        $('[name*="product_id"]').change(function(){
            var id = $(this).val();
                $.ajax({
                    url : '$urlgetInfoProduct',
                    type : "get",
                    datatype : "json",
                    dateType:"application/json; charset=utf-8",
                    data : {
                         id : id
                    },
                    success: function(result){
                        var returnedData = JSON.parse(result);
                        $('#price-old').val(returnedData.price);
                        var newPrice = returnedData.price * (100 - parseInt($('#off').val())) /100;
                        $('#price').val(newPrice);
                    }
                });
        });

    $('#off').change(function(){
        var offData = $('#off').val();
        if(offData ===''){
            $('#off').val(0);
        }
    var newPrice = parseInt($('#price-old').val().replace(',','')) * (100 - parseInt($('#off').val())) /100;
    $('#price').val(newPrice);
    });


  function formatNumber (num) {
      return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
  }


JS;
    }

    public function getInfoProduct(Request $request)
    {
        $id = $request->input('id');
        return ShopProduct::find($id)->toJson();

    }

    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(ShopSpecialPrice::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }

}
