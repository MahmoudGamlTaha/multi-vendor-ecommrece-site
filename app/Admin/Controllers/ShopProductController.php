<?php
#app/Admin/Controller/ShopProductController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Language;
use App\Models\ShopAttributeDetail;
use App\Models\ShopAttributeGroup;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopProduct;
use App\Models\ShopProductDescription;
use App\Models\ShopVendor;
use App\Models\UofmGroups;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use App\Models\ProductPriceList;

class ShopProductController extends Controller
{
    use HasResourceActions;
    public $arrType = ['0' => 'Default', '1' => 'New'];

    /**
     * Index interface.
     * sprint 3
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {
            $content->header(trans('language.admin.product_manager'));
            $content->description(' ');  
            $content->body($this->grid());

        });
    }//allha 
    public function update(Request $request, $id ){
        $arr = $request->all();
       // print_r($arr); die;
        $shopProductModel = ShopProduct::findOrFail($id);
        $shopProductModel->sku = $arr['sku'];
        $shopProductModel->price = $arr['price'];
        $shopProductModel->cost = $arr['cost'];
        $shopProductModel->category_id = $arr['category_id'];
        $shopProductModel->vendor_id = $arr['vendor_id'];
        $shopProductModel->status = $arr['status'] == 'on' ? 1 : 0;
        $shopProductModel->stock  = $arr['stock'];
      //  print_r($arr);die;
        
        $company = null;
        if($this->checkSuperUser()){
              $company = $arr['company_id'];
        }
        else {
            $company = $this->getUserCompany()[0]->id;
        }
        $shopProductModel->company_id = $company;
        $shopProductModel->brand_id = $arr['brand_id'];
        $shopProductModel->date_available = $arr['date_available'];

        $shopProductModel->save();
        $groups = UofmGroups::all()->pluck('code','name')->toArray();
        foreach($groups as $key => $code){
            if(!isset($arr[$code]) || (isset($arr[$code]) && $arr[$code] == 0))
                 continue;
          ProductPriceList::where('product_id', $shopProductModel->id)->where('uof_id', $arr[$code])->delete();
          $productPriceList = new ProductPriceList();
          $productPriceList->product_id =  $shopProductModel->id;
          $productPriceList->uof_id = $arr[$code];
          $productPriceList->price =  $shopProductModel->price;
          $productPriceList->company_id = $company;
          $productPriceList->save();
        }
     
        $languages = Language::getLanguages();
        $arrData = array();
        foreach ($languages as $key => $language) {
            $arrData[$language->code]['lang_id']    = $language->id;
            $arrData[$language->code]['product_id']    = $id;
            if(!isset($arr[$language->code . '__name']))
               continue;
            $arrData[$language->code]['company_id']  = $company; 
            $arrData[$language->code]['name']        = $arr[$language->code . '__name'];
            $arrData[$language->code]['keyword']     = $arr[$language->code . '__keyword'];
            $arrData[$language->code]['description'] = $arr[$language->code . '__description'];
            $arrData[$language->code]['content']     = $arr[$language->code . '__content'];
           // if(ShopProductDescription::where('lang_id', $arrData[$language->code]['lang_id'])->exists()){
                ShopProductDescription::where('lang_id', $arrData[$language->code]['lang_id'])->where('product_id', $arrData[$language->code]['product_id'])->delete();
            //}
            ShopProductDescription::insert($arrData[$language->code]);
        }
              return $this->edit($id);
        
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
            $content->header(trans('language.admin.product_manager'));
            $content->description(' ');

            $content->body($this->form($id)->edit($id));
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

            $content->header(trans('language.admin.product_manager'));
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
        return Admin::grid(ShopProduct::class, function (Grid $grid) {
            $grid->id('ID')->sortable();
            if($this->checkSuperUser()){
            $grid->company()->name(trans('admin.company')); //sprint 1
            }
            $grid->image(trans('language.admin.image'))->image('', 50);
            $grid->sku(trans('language.product.sku'))->sortable();
            $grid->name(trans('language.product.product_name'))->sortable();
            $grid->category()->name(trans('language.categories'));
            $grid->cost(trans('language.product.price_cost'))->display(function ($price) {
                return number_format($price);
            });
            $grid->price(trans('language.product.price'))->display(function ($price) {
                return number_format($price);
            });
            $arrType = $this->arrType;
            $grid->type(trans('language.product.product_type'))->display(function ($type) use ($arrType) {
                $style = ($type == 1) ? 'class="label label-success"' : (($type == 2) ? '  class="label label-danger"' : 'class="label label-default"');
                return '<span ' . $style . '>' . $arrType[$type] . '</span>';
            });
            $grid->status(trans('language.admin.status'))->switch();
            $grid->created_at(trans('language.admin.created_at'));
            $grid->model()->orderBy('id', 'desc');
            //$grid->disableExport();
            $grid->actions(function ($actions) {
                $actions->disableView();
            });

            $grid->tools(function ($tools) {
                $tools->append('<div class="pull-right">
            <div class="btn-group pull-right" style="margin-right: 10px">
             <a href="' . route('productImport') . '" class="btn btn-sm btn-success" title="New">
                <i class="fa fa-save"></i><span class="hidden-xs">&nbsp;&nbsp;&nbsp;' . trans('language.product.import_multi') . '</span>
            </a>
          </div>
        </div>');
            });
        //    print_r(session('locale_id'));
        //die;
            $grid->model()->leftJoin('shop_product_description', 'shop_product_description.product_id', '=', 'shop_product.id')
                ->where('lang_id', session('locale_id'));
            //$grid->expandFilter();
            if(!$this->checkSuperUser())
            {
              $grid->model()
                 ->where('shop_product.company_id',$this->getUserCompany()[0]->id);
            }
            $grid->filter(function ($filter) {
                $filter->disableIdFilter();
                $filter->like('name', trans('language.product.name'));
                $filter->like('sku', trans('language.product.sku'));
                $filter->like('company.name', trans('admin.company'));

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
        return Admin::form(ShopProduct::class, function (Form $form) use ($id) {
            $languages = Language::getLanguages();
            $form->tab(trans('language.product.product_info'), function ($form) use ($languages) {
//Language
                $arrParameters = request()->route()->parameters();
                $idCheck       = (int) end($arrParameters);

                $arrFields = array();
             //   print_r($idCheck);
                 $once = false;
                 $form->text('sku', trans('language.product.sku'));
                foreach ($languages as $key => $language) {
                    if($language->direction  != 'RTL') // only arabic 
                        continue;  
                    if ($idCheck /* product_id*/) {
                        $langDescriptions = ShopProductDescription::where('product_id', $idCheck)->where('lang_id', $language->id)->first();
                    }
                    if ($languages->count() > 1) { // no need if one language used
                     //   if($language->direction =='RTL')
                       //     $form->html('<b>' . $language->name . '</b>&nbsp; <img style="height:25px;float:right;" src="/' . config('filesystems.disks.path_file') . '/' . $language->icon . '">');
                        //else
                        //$form->html('<b>' . $language->name . '</b>&nbsp; <img style="height:25px;" src="/' . config('filesystems.disks.path_file') . '/' . $language->icon . '">');
                    }
                    if(!$this->checkSuperUser())
                    {
                      $form->model()->company_id = $this->getUserCompany()[0]->id;
                    }
                   
                    $form->text($language->code . '__name', trans('language.product.product_name'))->rules('required', ['required' => trans('validation.required')])->default(!empty($langDescriptions->name) ? $langDescriptions->name : null);
                    if(!$once) // print it one time independent from language just layout
                    {
                        $form->currency('price', trans('language.product.price'))->symbol('EGP')->options(['digits' => 0]);
                        $form->currency('cost', trans('language.product.price_cost'))->symbol('EGP')->options(['digits' => 0]);
                        $once = true;
                    }
                    $form->text($language->code . '__keyword', trans('language.admin.keyword'))->default(!empty($langDescriptions->keyword) ? $langDescriptions->keyword : null);
                   
                    $form->textarea($language->code . '__description', trans('language.admin.description'))->rules('max:300', ['max' => trans('validation.max')])->default(!empty($langDescriptions->description) ? $langDescriptions->description : null);
                    $form->ckeditor($language->code . '__content', trans('language.admin.content'))->default(!empty($langDescriptions->content) ? $langDescriptions->content : null)->rules('required');
                    $arrFields[] = $language->code . '__name';
                    $arrFields[] = $language->code . '__keyword';
                    $arrFields[] = $language->code . '__description';
                    $arrFields[] = $language->code . '__content';

                    $form->divide();
                    break; // working on arabic only at first
                }
               $uofms = ProductPriceList::where('product_id', $idCheck)->pluck('id', 'uof_id');
               
            //select 
               $form->inlineForm()->addSelectItem(UofmGroups::all(), $uofms);
              
                $form->ignore($arrFields);
//end language
                if(!$this->checkSuperUser())
                {
                  $arrBrand  = ShopBrand::where('company_id', $this->getUserCompany()[0]->id)->pluck('name', 'id')->all();
                }
                else {
                    $arrBrand  = ShopBrand::pluck('name', 'id')->all();      
                }
                $arrBrand  = ['0' => '-- ' . trans('language.brands') . ' --'] + $arrBrand;
                if(!$this->checkSuperUser())
                {
                  $arrVendor = ShopVendor::where('company_id', $this->getUserCompany()[0]->id)->pluck('name', 'id')->all();
                  $arrCate = (new ShopCategory)->getTreeCategoriesForCompany($this->getUserCompany()[0]->id);
                }
                else{
                    $arrVendor = ShopVendor::pluck('name','id')->all();
                    $companies = Company::pluck('name','id');
                    $arrCate = (new ShopCategory)->getTreeCategories();
                }
                $arrVendor = ['0' => '-- ' . trans('language.vendor') . ' --'] + $arrVendor;
                
                if($arrCate!=null || sizeof($arrCate) > 0)
                {
                    
                  $form->select('category_id', trans('language.admin.shop_category'))->options($arrCate)
                    ->rules('required');
                }
                if(isset($companies))
                {
                    $form->divide();
                    $form->select('company_id', trans('admin.company'))->options($companies)
                   ->rules('required');
                }
                $form->image('image', trans('language.admin.image'))->uniqueName()->move('product');
                $form->number('stock', trans('language.product.stock'))->rules('numeric|min:0')->default('0'); //sprint 1
            
                $form->select('brand_id', trans('language.brands'))->options($arrBrand)->default('0')
                    ->rules('required');
                $form->select('vendor_id', trans('language.vendor'))->options($arrVendor)->default('0')
                    ->rules('required');
                $form->switch('status', trans('language.admin.status'));
                $form->number('sort', trans('language.admin.sort'))->rules('numeric|min:0')->default(0);
                $form->divide();
                $form->radio('type', trans('language.product.product_type'))->options($this->arrType)->default('0');
                $form->datetime('date_available', trans('language.date_available'))->help(trans('language.default_available'));

            })->tab(trans('language.admin.sub_image'), function ($form) {
                $form->hasMany('images', ' ', function (Form\NestedForm $form) {
                    $form->image('image', trans('language.admin.sub_image'))->uniqueName()->move('product_slide');
                });

            })->tab(trans('language.product.attribute'), function ($form) use ($id) {
                $groups = ShopAttributeGroup::pluck('name', 'id')->all();
                $html   = '';
                foreach ($groups as $key => $group) {
                    ${'group_' . $key} = ShopAttributeDetail::where('product_id', $id)->where('attribute_id', $key)->get();
                    $html .= '
                        <table class="table box  table-bordered table-responsive">
                            <thead>
                              <tr>
                                <th colspan="4">' . $group . '</th>
                              </tr>
                            </thead>
                            <tbody>
                                      <tr>
                                        <td><span> ' . trans('language.attribute.detail_name') . ' ' . $group . '</span></td>
                                        <td></td>
                                      </tr>';
                    if (count(${'group_' . $key}) == 0) {
                        $html .= '<tr id="no-item-' . $key . '">
                                <td colspan="4" align="center" style="color:#cc2a2a">' . trans('language.attribute.no_item') . '</td>
                              </tr>';
                    } else {

                        foreach (${'group_' . $key} as $key2 => $value2) {
                            $html .= '
                                      <tr>
                                        <td>
                                        <span><div class="input-group"><input  type="text" name="group[' . $key . '][name][]" value="' . $value2['name'] . '" class="form-control" placeholder="' . trans('language.attribute.detail_name') . '"></div></span>
                                        </td>
                                        <td>
                                         <button onclick="removeItemForm(this);" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal"  data-placement="top" rel="tooltip" data-original-title="" title="Remove item"><span class="glyphicon glyphicon-remove"></span>' . trans('admin.remove') . '</button>
                                        </td>
                                      </tr>';
                        }
                    }

                    $html .= '
                               <tr id="addnew-' . $key . '">
                                <td colspan="8">  <button type="button" class="btn btn-sm btn-success"  onclick="morItem(' . $key . ');" rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> ' . trans('language.attribute.add_more') . '</button>
                        </td>
                              </tr>
                        <tr>
                        </tr>
                            </tbody>
                          </table> ';
                }
                $detail_name = trans('language.attribute.detail_name');
                $remove      = trans('admin.remove');
                $script      = <<<SCRIPT
               <script>
                function morItem(id){
                        $("#no-item-"+id).remove();
                    $("tr#addnew-"+id).before("<tr><td><span><span class=\"input-group\"><input  type=\"text\" name=\"group["+id+"][name][]\" value=\"\" class=\"form-control\" placeholder=\"$detail_name\"></span></span></td><td><button onclick=\"removeItemForm(this);\" class=\"btn btn-danger btn-xs\" data-title=\"Delete\" data-toggle=\"modal\"  data-placement=\"top\" rel=\"tooltip\" data-original-title=\"\" title=\"Remove item\"><span class=\"glyphicon glyphicon-remove\"></span> $remove</button></td></tr>");
                    }

                    function removeItemForm(elmnt){
                      elmnt.closest("tr").remove();
                    }

                </script>
SCRIPT;
                $form->html($html . $script);

            });
            if(!$this->checkSuperUser())
               {
                $form->model()->company_id = $this->getUserCompany()[0]->id;
               }
            $arrData = array();
            $form->saving(function (Form $form) use ($languages, &$arrData) {
                //Lang
                foreach ($languages as $key => $language) {
                    $arrData[$language->code]['name']        = request($language->code . '__name');
                    $arrData[$language->code]['keyword']     = request($language->code . '__keyword');
                    $arrData[$language->code]['description'] = request($language->code . '__description');
                    $arrData[$language->code]['content']     = request($language->code . '__content');
                }
              //  print_r($arrData);die;
                //end lang
            });
        //    print_r($arrData);die;
            //saved
            $form->saved(function (Form $form) use ($languages, &$arrData) {
                $id = $form->model()->id;
                //Lang
                foreach ($languages as $key => $language) {
                    if (array_filter($arrData[$language->code], function ($v, $k) {
                        return $v != null;
                    }, ARRAY_FILTER_USE_BOTH)) {
                        $arrData[$language->code]['product_id'] = $id;
                        $arrData[$language->code]['lang_id']    = $language->id;
                        $arrData[$language->code]['company_id'] = $form->model()->company_id; // sprint 1
                        ShopProductDescription::where('lang_id', $arrData[$language->code]['lang_id'])->where('product_id', $arrData[$language->code]['product_id'])->delete();
                        ShopProductDescription::insert($arrData[$language->code]);
                    }
                }
                //end lang
                $product         = ShopProduct::find($id);
                $file_path_admin = config('filesystems.disks.admin.root');
                $statusWatermark = \Helper::configs()['watermark'];
                $fileWatermark   = $file_path_admin . '/' . \Helper::configsGlobal()['watermark'];
                try {
                    //image primary
                    \Helper::processImageThumb($pathRoot = $file_path_admin, $pathFile = $product->image, $widthThumb = 250, $heightThumb = null, $statusWatermark, $fileWatermark);

                    if (($product->images)) {
                        foreach ($product->images as $key => $image) {
                            //images slide
                            \Helper::processImageThumb($pathRoot = $file_path_admin, $pathFile = $image->image, $widthThumb = 250, $heightThumb = null, $statusWatermark, $fileWatermark);
                        }
                    }

                    if (($product->options)) {
                        foreach ($product->options as $key => $image) {
                            //images options
                            \Helper::processImageThumb($pathRoot = $file_path_admin, $pathFile = $image->opt_image, $widthThumb = 250, $heightThumb = null, $statusWatermark, $fileWatermark);
                        }
                    }

                } catch (\Exception $e) {
                    echo $e->getMessage();
                }

                ShopAttributeDetail::where('product_id', $id)->delete();
                $groups = $form->group;
                if ($groups > 0) {
                    foreach ($groups as $attID => $group) {
                        foreach ($group['name'] as $key => $value) {
                            if ($value != '') {
                                ShopAttributeDetail::insert(['name' => $value, 'attribute_id' => $attID, 'product_id' => $id]);
                            }

                        }
                    }
                }
            });
            $form->disableViewCheck();
        //    $form->disableEditingCheck();
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
            $content->body(Admin::show(ShopProduct::findOrFail($id), function (Show $show) {
                $show->id('ID');
                $show->name('name');
              //  $show->company()->name('name');
            }));
        });
    }

}
