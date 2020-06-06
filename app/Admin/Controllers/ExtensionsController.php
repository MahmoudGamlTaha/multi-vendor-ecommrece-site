<?php
#app/Http/Admin/Controllers/ExtensionsController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;

class ExtensionsController extends Controller
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
            'Shipping' => '\App\Extensions\Shipping\Controllers',
            'Payment'  => '\App\Extensions\Payment\Controllers',
            'Total'    => '\App\Extensions\Total\Controllers',
            'Other'    => '\App\Extensions\Other\Controllers',
        ];

    }
    public function index($group, Content $content)
    {
        $action       = request('action');
        $extensionKey = request('extensionKey');
        if ($action == 'config' && $extensionKey != '') {
            $namespace = $this->namespaceGroup[$group] . '\\' . $extensionKey;
            $body      = (new $namespace)->config();
        } else {
            $body = $this->extensionsGroup($group);
        }
        return $content
            ->header(trans('language.extensions.manager'))
            ->description(' ')
            ->body($body);
    }

/**
 * [extensionsGroup description]
 * @param  [type] $group [description]
 * @return [type]        [description]
 */
    protected function extensionsGroup($group)
    {
        $extensionsInstalled = \Helper::getExtensionsGroup($group, $onlyActive = false);
        $extensions          = \FindClass::classNames('Extensions', $group);
        $namespace           = $this->namespaceGroup[$group];
        $title               = trans('language.extensions.' . $group);
        return $this->render($extensionsInstalled, $extensions, $namespace, $title, $group);
    }

/**
 * [render description]
 * @param  [type] $extensionsInstalled [description]
 * @param  [type] $extensions          [description]
 * @param  [type] $namespace           [description]
 * @param  [type] $title               [description]
 * @param  [type] $group                [description]
 * @return [type]                      [description]
 */
    public function render($extensionsInstalled, $extensions, $namespace, $title, $group)
    {
        return view('admin.ExtensionsManager')->with(
            [
                "title"               => $title,
                "namespace"           => $namespace,
                "extensionsInstalled" => $extensionsInstalled,
                "extensions"          => $extensions,
                "group"               => $group,
            ])->render();
    }

    public function installExtension()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->install();
        return json_encode($response);
    }
    public function uninstallExtension()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->uninstall();
        return json_encode($response);
    }
    public function enableExtension()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->enable();
        return json_encode($response);
    }
    public function disableExtension()
    {
        $key       = request('key');
        $group     = request('group');
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->disable();
        return json_encode($response);
    }
    public function processExtension($group, $key)
    {
        $data      = request()->all();
        $namespace = $this->namespaceGroup[$group];
        $class     = $namespace . '\\' . $key;
        $response  = (new $class)->processConfig($data);
        return json_encode($response);
    }
}
