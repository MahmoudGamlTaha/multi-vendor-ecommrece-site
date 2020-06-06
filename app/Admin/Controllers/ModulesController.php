<?php
#app/Http/Admin/Controllers/ModulesController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;

class ModulesController extends Controller
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
        $this->namespaceGroup = [
            'Cms'   => '\App\Modules\Cms\Controllers',
            'Api'   => '\App\Modules\Api\Controllers',
            'Other' => '\App\Modules\Other\Controllers',
        ];

    }
    public function index($group, Content $content)
    {
        $body = $this->modulesGroup($group);
        return $content
            ->header(trans('language.modules.manager'))
            ->description(' ')
            ->body($body);
    }

/**
 * [modulesGroup description]
 * @param  [type] $group [description]
 * @return [type]        [description]
 */
    protected function modulesGroup($group)
    {
        $modulesInstalled = \Helper::getExtensionsGroup($group, $onlyActive = false);
        $modules          = \FindClass::classNames('Modules', $group);
        $namespace        = $this->namespaceGroup[$group];
        $title            = trans('language.modules.' . $group);
        return $this->render($modulesInstalled, $modules, $namespace, $title, $group);
    }

/**
 * [render description]
 * @param  [type] $modulesInstalled [description]
 * @param  [type] $modules          [description]
 * @param  [type] $namespace           [description]
 * @param  [type] $title               [description]
 * @param  [type] $group                [description]
 * @return [type]                      [description]
 */
    public function render($modulesInstalled, $modules, $namespace, $title, $group)
    {
        return view('admin.ModulesManager')->with(
            [
                "title"            => $title,
                "namespace"        => $namespace,
                "modulesInstalled" => $modulesInstalled,
                "modules"          => $modules,
                "group"            => $group,
            ])->render();
    }

    public function installModule()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->install();
        return json_encode($response);
    }
    public function uninstallModule()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->uninstall();
        return json_encode($response);
    }
    public function enableModule()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->enable();
        return json_encode($response);
    }
    public function disableModule()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->disable();
        return json_encode($response);
    }
    public function processModule($group, $key)
    {
        $data      = request()->all();
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->processConfig($data);
        return json_encode($response);
    }
}
