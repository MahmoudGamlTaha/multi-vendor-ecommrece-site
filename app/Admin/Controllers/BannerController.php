<?php
#app/Http/Admin/Controllers/BannerController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class BannerController extends Controller
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
            ->header(trans('language.admin.banner_manager'))
            ->description(' ')
            ->body($this->grid());
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('language.admin.banner_manager'))
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
            ->header(trans('language.admin.banner_manager'))
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
        $grid = new Grid(new Banner);
        $grid->id('ID')->sortable();
        $grid->image(trans('language.admin.image'))->image('', 50);
        $grid->url('URL');
        $grid->html('HTML')->display(function ($text) {
            return htmlentities($text);
        })->style('max-width:200px;word-break:break-all;');
        $grid->status(trans('language.admin.status'))->switch();
        $grid->sort(trans('language.admin.sort'))->sortable();
        $grid->disableRowSelector();
        $grid->disableFilter();
        $grid->tools(function ($tools) {
            $tools->disableRefreshButton();
        });
        $grid->disableExport();
        $grid->actions(function ($actions) {
            $actions->disableView();
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
        $form = new Form(new Banner);
        $form->image('image', trans('language.admin.image'))->uniqueName()->move('banner')->removable();
        $form->textarea('html', 'html');
        $form->text('url', 'Url');
        $form->switch('status', trans('language.admin.status'));
        $form->number('sort', trans('language.admin.sort'))->rules('numeric|min:0')->default(0);
        $form->display('created_at', trans('language.admin.created_at'));
        $form->display('updated_at', trans('language.admin.last_modify'));
        $form->disableViewCheck();
        $form->disableEditingCheck();
        $form->tools(function (Form\Tools $tools) {
            $tools->disableView();
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
        $show = new Show(Banner::findOrFail($id));
        return $show;
    }

}
