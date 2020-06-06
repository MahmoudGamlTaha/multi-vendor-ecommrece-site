<?php
 namespace App\Admin\Controllers;
 use App\Http\Controllers\Controller;
 use App\Models\Company;
 use App\Models\ShopActivity;
 use App\Models\CompanyContact;
use App\Models\ConfigGlobalDescription;
use App\Models\Language;
use App\Models\ShopCurrency;
use App\Models\ShopProduct;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Input;
use Encore\Admin\Controllers\HasResourceActions;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
  use HasResourceActions;
  public function index(){
    
    return Admin::content(function (Content $content) {
      $content->header(trans('language.admin.companies_manager'));
      $content->description(' ');  
      $content->body($this->grid());

  });
   }
   public function create()
   {
       return Admin::content(function (Content $content) {

           $content->header(trans('admin.company'));
           $content->description(trans('admin.edit'));

           $content->body($this->form());
       });
   }

   public function getAllshopActiviy()
   {
       $allActivity = ShopActivity::all();
       return $this->sendResponse($allActivity, 200);
   }

   public function getAllShopWithActivityId($activityId)
   {
    $allShopsWithActivity = Company::where("activity_id", $activityId)->get();
    return $this->sendResponse($allShopsWithActivity, 200 );
   }

   public function getCompanyProfile($companyId)
   {
     $profile = CompanyContact::where("company_id", $companyId)->get();
     return $this->sendResponse($profile, 200);
   }

   public function getAllCompanyProduct($companyId)
   {
       $companyProducts = Company::find(1)->getProducts()->where('company_id',$companyId)->get();
       return $this->sendResponse($companyProducts, 200);
       /*
        $user = User::find(1);
        $post = $user->posts()->find($postId);
        $comments = $post->comments;
       */
   }
   protected function grid()
    {
        return Admin::grid(Company::class, function (Grid $grid) {
            //if($this->checkSuperUser())
          //  $grid->model()->company_id = 1;
            $grid->id('ID')->sortable();
          //  $grid->image(trans('language.admin.image'))->image('', 50);
            $grid->name(trans('admin.company'))->sortable();
         //   $grid->model()->name(trans('language.categories'));
         
          //  $arrType = $this->arrType;
         
            $grid->active(trans('language.admin.status'))->switch();
            $grid->seller(trans('admin.seller'))->switch();
            $grid->created_at(trans('language.admin.created_at'));
            $grid->notes(trans('language.notes'));
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
          //  $grid->model()->leftJoin('shop_product_description', 'shop_product_description.product_id', '=', 'shop_product.id')
            //    ->where('lang_id', session('locale_id'));
            //$grid->expandFilter();
            if(!$this->checkSuperUser())
            {
            //  $grid->model()
              //   ->where('id',$this->getUserCompany()[0]->id);
            }
            $grid->filter(function ($filter) {
                $filter->disableIdFilter();
                $filter->like('name', trans('admin.company'));
              

            });
        });
    }
    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(Company::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
    
   public function edit($id = null){
    return Admin::content(function (Content $content) use ($id) {
      $content->header(trans('admin.companies'));
      $content->description(trans('admin.edit'));
      
      $content->body($this->form($id)->edit($id));
  });
   }
   //from allah 
   public function update(Request $request, $id ){
     $arr = $request->all();
    
     $model = Company::findOrFail($id);
     $model->activity_id = $arr['activity_id'];
     $model->name = $arr['name'];
     $model->notes = $arr['notes'];
     $model->save();
    return $this->edit($id);
   }
   protected function form($id = null)
    {
        return Admin::form(Company::class, function (Form $form) use ($id) {
            $languages = Language::getLanguages();
            $form->tab(trans('admin.company'), function ($form) use ($languages, $id) {
//Language      
                $name = '';
                $notes = '';
                $selected = '0';
                $arrData = array();
                 if($id != null){
                      $entity = Company::find($id);
                      $name = $entity->name;
                      $notes = $entity->notes;
                      $selected = strval($entity->activity_id);
                      $companyContacts = $entity->getContact()->get();
                      $config = $entity->configs();
                     
                 }
                 
              //  print_r($selected);
              //  $arrParameters = request()->route()->parameters();
            //    $idCheck       = (int) end($arrParameters);
                $allActivity =  ShopActivity::where('active', true)->pluck('type', 'id');
                $form->text('name', trans('admin.company'))->default(!empty($name) ? $name : null);
                $form->text('notes', trans('language.notes'))->default(!empty($notes) ? $notes : null);
                $form->select('activity_id', trans('admin.activity'))->options($allActivity)->default($selected);
                $form->text('iban', trans('admin.iban'));
                $form->saving(function (Form $form) use ($languages, &$arrData) {
                    //Lang
                    //if($this->isValidIBAN($form->model()->iban))
                    if(sizeof($arrData) > 0){
                    foreach ($languages as $key => $language) {
                        $arrData[$language->code]['name']        = request($language->code . '__name');
                        $arrData[$language->code]['keyword']     = request($language->code . '__keyword');
                        $arrData[$language->code]['description'] = request($language->code . '__description');
                    }
    
                    }
                  
                });
                $form->saved(function (Form $form) use ($languages, &$arrData) {
                $id = $form->model()->id;
                //Lang
                foreach ($languages as $key => $language) {
                    if (sizeof($arrData) > 0 && array_filter($arrData[$language->code], function ($v, $k) {
                        return $v != null;
                    }, ARRAY_FILTER_USE_BOTH)) {
                       //config save
                    }
                }
                //end lang
            
            $form->disableViewCheck();
        //    $form->disableEditingCheck();
            $form->tools(function (Form\Tools $tools) {
                $tools->disableView();
            });
         
        });//sprint 2
            })->tab(trans('admin.setting'), function($form) use($id){
           //  $form1 = clone $form;
            $form->html(Admin::grid(CompanyContact::class, function (Grid $grid) use($id){
            
                $grid->html('&nbsp;');
                $grid->model()->where('company_id', $id);
                $grid->logo(trans('language.config.logo'))->image('', 50);
                if (\Helper::configs()['watermark']) {
                    $grid->watermark(trans('language.config.watermark'))->image('', 50);
                }
    
                $languages = Language::getLanguages();
                $grid->descriptions(trans('language.config.description'))->expand(function () use ($languages) {
                    $html = '<table width="100%" class="table-padding padding5"  border=1 style="border: 1px solid #d0bcbc;direction:rtl !important;"><tr>
                <td>' . trans('language.config.language') . '</td>
                <td>' . trans('language.config.title') . '</td>
                <td>' . trans('language.config.description') . '</td>
                <td>' . trans('language.config.keyword') . '</td>
                </tr>';
                    foreach ($languages as $key => $lang) {
                        $langDescriptions = ConfigGlobalDescription::where('config_id', $this->id)->where('lang_id', $key)->first();
                        $html .= '<tr>
                <td>' . $lang['name'] . '</td>
                <td>' . $langDescriptions['title'] . '</td>
                <td>' . $langDescriptions['description'] . '</td>
                <td>' . $langDescriptions['keyword'] . '</td>
                </tr>';
                    }
                    $html .= '</table>';
                    return $html;
                }, trans('language.admin.detail'));
    
                $grid->phone(trans('language.config.phone'));
                $grid->long_phone(trans('language.config.long_phone'))->display(function ($text) {
                    return '<div style="max-width:120px; overflow:auto;">' . $text . '</div>';
                });
                $grid->time_active(trans('language.config.time_active'))->display(function ($text) {
                    return '<div style="max-width:150px; overflow:auto;">' . $text . '</div>';
                });
    
                $grid->address(trans('language.config.address'))->display(function ($text) {
                    return '<div style="max-width:150px; overflow:auto;">' . $text . '</div>';
                });
                $grid->email(trans('language.config.email'))->display(function ($text) {
                    return '<div style="max-width:170px; overflow:auto;">' . $text . '</div>';
                });
                // $grid->locale(trans('language.config.language'))->display(function ($locale) {
                //     $languages = Language::pluck('name', 'code')->all();
                //     return $languages[$locale];
                // });
                // $grid->currency(trans('language.config.currency'))->display(function ($currency) {
                //     $currencies = ShopCurrency::pluck('name', 'code')->all();
                //     return $currencies[$currency];
                // });
             //   $grid->disableCreation();
                $grid->disableExport();
                //$grid->disableRowSelector();
                $grid->disableFilter();
           //     $grid->disablePagination();
                $grid->actions(function ($actions) {
                    $actions->disableView();
                    $actions->disableDelete();
                });
                $grid->tools(function ($tools) {
                    $tools->disableRefreshButton();
                    
                });
            })->render());   
            

            })->tab(trans('language.admin.product_manager'), function($form)  use($id){
               
               $form->html( Admin::grid(ShopProduct::class, function (Grid $grid)  use($id) {
              if(!isset($id)){
                $id = -1;
              }
                $grid->model()
                ->where('shop_product.company_id', $id); 
                $grid->id('ID')->sortable();
                $grid->company()->name(trans('admin.company')); //sprint 1
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
              /*  $arrType = $this->arrType;
                $grid->type(trans('language.product.product_type'))->display(function ($type) use ($arrType) {
                    $style = ($type == 1) ? 'class="label label-success"' : (($type == 2) ? '  class="label label-danger"' : 'class="label label-default"');
                    return '<span ' . $style . '>' . $arrType[$type] . '</span>';
                });*/
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
            })->render());
            });
          });
      }
//sprint 1
      function isValidIBAN ($iban) {

        $iban = strtolower($iban);
        $Countries = array(
          'al'=>28,'ad'=>24,'at'=>20,'az'=>28,'bh'=>22,'be'=>16,'ba'=>20,'br'=>29,'bg'=>22,'cr'=>21,'hr'=>21,'cy'=>28,'cz'=>24,
          'dk'=>18,'do'=>28,'ee'=>20,'fo'=>18,'fi'=>18,'fr'=>27,'ge'=>22,'de'=>22,'gi'=>23,'gr'=>27,'gl'=>18,'gt'=>28,'hu'=>28,
          'is'=>26,'ie'=>22,'il'=>23,'it'=>27,'jo'=>30,'kz'=>20,'kw'=>30,'lv'=>21,'lb'=>28,'li'=>21,'lt'=>20,'lu'=>20,'mk'=>19,
          'mt'=>31,'mr'=>27,'mu'=>30,'mc'=>27,'md'=>24,'me'=>22,'nl'=>18,'no'=>15,'pk'=>24,'ps'=>29,'pl'=>28,'pt'=>25,'qa'=>29,
          'ro'=>24,'sm'=>27,'sa'=>24,'rs'=>22,'sk'=>24,'si'=>19,'es'=>24,'se'=>24,'ch'=>21,'tn'=>24,'tr'=>26,'ae'=>23,'gb'=>22,'vg'=>24
        );
        $Chars = array(
          'a'=>10,'b'=>11,'c'=>12,'d'=>13,'e'=>14,'f'=>15,'g'=>16,'h'=>17,'i'=>18,'j'=>19,'k'=>20,'l'=>21,'m'=>22,
          'n'=>23,'o'=>24,'p'=>25,'q'=>26,'r'=>27,'s'=>28,'t'=>29,'u'=>30,'v'=>31,'w'=>32,'x'=>33,'y'=>34,'z'=>35
        );
      
        if (strlen($iban) != $Countries[ substr($iban,0,2) ]) { return false; }
      
        $MovedChar = substr($iban, 4) . substr($iban,0,4);
        $MovedCharArray = str_split($MovedChar);
        $NewString = "";
      
        foreach ($MovedCharArray as $k => $v) {
      
          if ( !is_numeric($MovedCharArray[$k]) ) {
            $MovedCharArray[$k] = $Chars[$MovedCharArray[$k]];
          }
          $NewString .= $MovedCharArray[$k];
        }
        if (function_exists("bcmod")) { return bcmod($NewString, '97') == 1; }
        $x = $NewString; $y = "97";
        $take = 5; $mod = "";
      
        do {
          $a = (int)$mod . substr($x, 0, $take);
          $x = substr($x, $take);
          $mod = $a % $y;
        }
        while (strlen($x));
      
        return (int)$mod == 1;
      }
    }