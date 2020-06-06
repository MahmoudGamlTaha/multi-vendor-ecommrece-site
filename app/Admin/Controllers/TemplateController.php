<?php
#app/Http/Admin/Controllers/TemplateController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ConfigGlobal;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;

class TemplateController extends Controller
{
    use HasResourceActions;
    public $namespaceGroup;
    /**
     * Index interface.
     *
     * @return Content
     */
    public function __construct()
    {

    }
    public function index(Content $content)
    {

        return $content
            ->row('<span style="font-size:15px;font-style: italic;">(' . trans('language.templates.guide') . ')</span><br>')
            ->header(trans('language.templates.manager'))
            ->description(' ')
            ->body($this->render());
    }

/**
 * [render description]
 * @return [type] [description]
 */
    public function render()
    {
        $arrTemplates = [];
        foreach (glob(resource_path() . "/views/templates/*") as $template) {
            if (is_dir($template)) {
                $infoTemlate['code'] = explode('templates/', $template)[1];
                $config              = ['name' => '', 'auth' => '', 'email' => '', 'website' => ''];
                if (file_exists($template . '/config.json')) {
                    $config = json_decode(file_get_contents($template . '/config.json'), true);
                }
                $infoTemlate['config']              = $config;
                $arrTemplates[$infoTemlate['code']] = $infoTemlate;
            }
        }
        return view('admin.TemplatesManager')->with(
            [
                "title"           => trans('language.templates.title'),
                "templates"       => $arrTemplates,
                "templateCurrent" => \Helper::configsGlobal()['template'],
            ])->render();
    }

    public function changeTemplate()
    {
        $key     = request('key');
        $process = ConfigGlobal::first()->update(['template' => $key]);
        if ($process) {
            $return = ['error' => 0, 'msg' => 'Change template success!'];
        } else {
            $return = ['error' => 1, 'msg' => 'Have an error!'];
        }
        return json_encode($return);
    }
}
