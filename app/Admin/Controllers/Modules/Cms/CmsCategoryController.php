<?php
#app/Http/Admin/Controllers/Modules/Cms/CmsCategoryController.php
namespace App\Admin\Controllers\Modules\Cms;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Modules\Cms\Models\CmsCategory;
use App\Modules\Cms\Models\CmsCategoryDescription;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class CmsCategoryController extends Controller
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

            $content->header(trans('language.admin.cms_category'));
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

            $content->header(trans('language.admin.cms_category'));
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

            $content->header(trans('language.admin.cms_category'));
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
        return Admin::grid(CmsCategory::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->image(trans('language.admin.image'))->image('', 50);
            $grid->title(trans('language.admin.name'))->display(function () {
                return CmsCategory::find($this->id)->getTitle();
            });
            $grid->status(trans('language.admin.status'))->switch();
            $grid->sort(trans('language.admin.sort'))->editable();
            $grid->disableExport();
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
    protected function form()
    {
        return Admin::form(CmsCategory::class, function (Form $form) {
//Language
            $arrParameters = request()->route()->parameters();
            $idCheck       = (int) end($arrParameters);
            $languages     = Language::getLanguages();
            $arrFields     = array();
            foreach ($languages as $key => $language) {
                if ($idCheck) {
                    $langDescriptions = CmsCategoryDescription::where('cms_category_id', $idCheck)->where('lang_id', $language->id)->first();
                }
                if ($languages->count() > 1) {
                    $form->html('<b>' . $language->name . '</b> <img style="height:25px" src="/' . config('filesystems.disks.path_file') . '/' . $language->icon . '">');
                }
                $form->text($language->code . '__title', trans('language.admin.name'))->rules('required', ['required' => trans('validation.required')])->default(!empty($langDescriptions->title) ? $langDescriptions->title : null);
                $form->text($language->code . '__keyword', trans('language.admin.keyword'))->default(!empty($langDescriptions->keyword) ? $langDescriptions->keyword : null);
                $form->text($language->code . '__description', trans('language.admin.description'))->rules('max:300', ['max' => trans('validation.max')])->default(!empty($langDescriptions->description) ? $langDescriptions->description : null);
                $arrFields[] = $language->code . '__title';
                $arrFields[] = $language->code . '__keyword';
                $arrFields[] = $language->code . '__description';
                $form->divide();
            }
            $form->ignore($arrFields);
//end language

            $form->image('image', trans('language.admin.image'))->uniqueName()->move('cms_category')->removable();
            $form->number('sort', trans('language.admin.sort'))->rules('numeric|min:0')->default(0);
            $form->switch('status', trans('language.admin.status'));
            $arrData = array();

            $form->saving(function (Form $form) use ($languages, &$arrData) {
                //Lang
                foreach ($languages as $key => $language) {
                    $arrData[$language->code]['title']       = request($language->code . '__title');
                    $arrData[$language->code]['keyword']     = request($language->code . '__keyword');
                    $arrData[$language->code]['description'] = request($language->code . '__description');

                }
                //end lang
            });

            $form->saved(function (Form $form) use ($languages, &$arrData) {
                $idForm = $form->model()->id;

                //Language
                foreach ($languages as $key => $language) {
                    if (array_filter($arrData[$language->code], function ($v, $k) {
                        return $v != null;
                    }, ARRAY_FILTER_USE_BOTH)) {
                        $arrData[$language->code]['cms_category_id'] = $idForm;
                        $arrData[$language->code]['lang_id']         = $language->id;
                        CmsCategoryDescription::where('lang_id', $arrData[$language->code]['lang_id'])->where('cms_category_id', $arrData[$language->code]['cms_category_id'])->delete();
                        CmsCategoryDescription::insert($arrData[$language->code]);
                    }
                }
                //End language
                $file_path_admin = config('filesystems.disks.admin.root');
                $statusWatermark = \Helper::configs()['watermark'];
                $fileWatermark   = $file_path_admin . '/' . \Helper::configsGlobal()['watermark'];
                try {
                    //image primary
                    \Helper::processImageThumb($pathRoot = $file_path_admin, $pathFile = $form->model()->image, $widthThumb = 250, $heightThumb = null, $statusWatermark, $fileWatermark);

                } catch (\Exception $e) {
                    echo $e->getMessage();
                }

            });
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
            $content->body(Admin::show(CmsCategory::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
