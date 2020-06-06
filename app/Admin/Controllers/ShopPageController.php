<?php
#app/Http/Admin/Controllers/ShopPageController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\ShopPage;
use App\Models\ShopPageDescription;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopPageController extends Controller
{
    use HasResourceActions;
    /**
     * Index interface.
     *
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('language.admin.shop_page'))
            ->description(' ')
            ->body($this->grid());
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
            ->header(trans('language.admin.shop_page'))
            ->description(' ')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('language.admin.shop_page'))
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
        $grid = new Grid(new ShopPage);
        $grid->id('ID')->sortable();
        $grid->title(trans('language.admin.page_name'))->sortable();
        $grid->status(trans('language.admin.status'))->switch();
        $grid->actions(function ($actions) {
            if ($actions->getKey() == 1 || $actions->getKey() == 2) {
                // 1: about, 2: contact
                $actions->disableDelete();
            }
            $actions->disableView();
        });
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableFilter();
        $grid->tools(function ($tools) {
            $tools->disableRefreshButton();
        });
        $grid->model()->orderBy('id', 'desc');
        return $grid;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ShopPage);
//Language
        $arrParameters = request()->route()->parameters();
        $idCheck       = (int) end($arrParameters);
        $languages     = Language::getLanguages();
        $arrFields     = array();
        foreach ($languages as $key => $language) {
            if ($idCheck) {
                $langDescriptions = ShopPageDescription::where('page_id', $idCheck)->where('lang_id', $language->id)->first();
            }
            if ($languages->count() > 1) {
                $form->html('<b>' . $language->name . '</b> <img style="height:25px" src="/' . config('filesystems.disks.path_file') . '/' . $language->icon . '">');
            }
            $form->text($language->code . '__title', 'Tên')->rules('required', ['required' => trans('validation.required')])->default(!empty($langDescriptions->title) ? $langDescriptions->title : null);
            $form->text($language->code . '__keyword', trans('language.admin.keyword'))->default(!empty($langDescriptions->keyword) ? $langDescriptions->keyword : null);
            $form->text($language->code . '__description', trans('language.admin.description'))->rules('max:300', ['max' => trans('validation.max')])->default(!empty($langDescriptions->description) ? $langDescriptions->description : null);
            $form->ckeditor($language->code . '__content', trans('language.admin.content'))->default(!empty($langDescriptions->content) ? $langDescriptions->content : null)->rules('required');
            $arrFields[] = $language->code . '__title';
            $arrFields[] = $language->code . '__keyword';
            $arrFields[] = $language->code . '__description';
            $arrFields[] = $language->code . '__content';
            $form->divide();
        }
        $form->ignore($arrFields);
//end language

        if ($idCheck == '1' || $idCheck == '2') {
            $form->display('uniquekey', 'Unique Key');
        } else {
            $form->text('uniquekey', 'Unique Key')->rules(function ($form) {
                return 'required|unique:shop_page,uniquekey,' . $form->model()->id . ',id';
            }, ['required' => trans('validation.required'), 'unique' => trans('validation.unique')])->placeholder('Ví dụ: thong-tin-khuyen-mai, tin-tuc,...')->help(trans('validation.validate_nickname'));
        }
        $form->switch('status', trans('language.admin.status'));
        $form->disableViewCheck();
        $form->disableEditingCheck();
        $form->tools(function (Form\Tools $tools) use ($idCheck) {
            $tools->disableView();
            if ($idCheck == '1' || $idCheck == '2') {
                // 1: about, 2: contact
                $tools->disableDelete();
            }

        });

        $arrData = array();
        $form->saving(function (Form $form) use ($languages, &$arrData) {
            //Lang
            foreach ($languages as $key => $language) {
                $arrData[$language->code]['title']       = request($language->code . '__title');
                $arrData[$language->code]['keyword']     = request($language->code . '__keyword');
                $arrData[$language->code]['description'] = request($language->code . '__description');
                $arrData[$language->code]['content']     = request($language->code . '__content');

            }
            //end lang
        });

        $form->saved(function (Form $form) use ($languages, &$arrData) {
            $id = $form->model()->id;
            //Lang
            foreach ($languages as $key => $language) {
                if (array_filter($arrData[$language->code], function ($v, $k) {
                    return $v != null;
                }, ARRAY_FILTER_USE_BOTH)) {
                    $arrData[$language->code]['page_id'] = $id;
                    $arrData[$language->code]['lang_id'] = $language->id;
                    ShopPageDescription::where('lang_id', $arrData[$language->code]['lang_id'])->where('page_id', $arrData[$language->code]['page_id'])->delete();
                    ShopPageDescription::insert($arrData[$language->code]);
                }
            }

            //end lang
        });

        return $form;
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
            ->description(' ')
            ->body($this->detail($id));
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(ShopPage::findOrFail($id));
        return $show;
    }

}
