<?php
#app/Http/Admin/Controllers/ShopAttributeGroupController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopAttributeGroup;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopAttributeGroupController extends Controller
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
            ->header(trans('language.attribute.manager'))
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
            ->header(trans('language.attribute.manager'))
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
            ->header(trans('language.attribute.manager'))
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
            ->header(trans('language.attribute.manager'))
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
        $grid = new Grid(new ShopAttributeGroup);

        $grid->id('Id');
        $grid->name(trans('language.attribute.group_name'));
        $grid->status(trans('language.attribute.status'));
        $grid->sort(trans('language.attribute.sort'));
        $grid->type(trans('language.attribute.type'));

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
        $show = new Show(ShopAttributeGroup::findOrFail($id));

        $show->id('Id');
        $show->name(trans('language.attribute.group_name'));
        $show->status(trans('language.attribute.status'));
        $show->sort(trans('language.attribute.sort'));
        $show->type(trans('language.attribute.type'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ShopAttributeGroup);

        $form->text('name', trans('language.attribute.group_name'))->rules('required');
        $form->model()->company_id = $this->getUserCompany()[0]->id;
        $form->switch('status', trans('language.attribute.status'));
        $form->number('sort', trans('language.attribute.sort'))->rules('numeric|min:0')->default(0);
        $form->select('type', trans('language.attribute.type'))->options(['radio' => 'Radio', 'select' => 'Select'])->rules('required');

        return $form;
    }
}
