<?php
#app/Modules/Cms/Controllers/News.php
namespace App\Modules\Cms\Controllers;

use App\Models\Config;
use App\Modules\Cms\Models\CmsNews;
use App\Modules\Cms\Models\CmsNewsDescription;
use Encore\Admin\Auth\Database\Menu;

class News extends \App\Http\Controllers\GeneralController
{
    protected $configType = 'Modules';
    protected $configCode = 'Cms';
    protected $configKey  = 'News';

    public $title;
    const ON  = 1;
    const OFF = 0;
    public function __construct()
    {
        parent::__construct();
        $this->title = trans($this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title');
        app('view')->prependNamespace($this->configType,
            base_path('app/' . $this->configType . '/' . $this->configCode . '/Views'));
    }
    public function getData()
    {
        return $this->processData();
    }

    public function processData()
    {
        $arrData = [
            'title' => $this->title,
            'code'  => $this->configKey,
        ];
        return $arrData;
    }

    public function install()
    {
        $return = ['error' => 0, 'msg' => ''];
        $check  = Config::where('key', $this->configKey)->first();
        if ($check) {
            $return = ['error' => 1, 'msg' => 'Module exist'];
        } else {
            $process = Config::insert(
                [
                    'code'   => $this->configCode,
                    'key'    => $this->configKey,
                    'type'   => $this->configType,
                    'value'  => self::ON, //1- Enable extension; 0 - Disable
                    'detail' => 'Modules/' . $this->configCode . '/' . $this->configKey . '.title',
                ]
            );
            if (!$process) {
                $return = ['error' => 1, 'msg' => 'Error when install'];
            } else {
                $checkMenu = Menu::find('100');
                if (!$checkMenu) {
                    Menu::insert([
                        'id'        => 100,
                        'order'     => 9,
                        'parent_id' => 0,
                        'title'     => 'CMS Manager',
                        'icon'      => 'fa-coffee',
                    ]);
                }
                (new CmsNews)->installExtension();
                (new CmsNewsDescription)->installExtension();
                Menu::insert([
                    'order'     => 10,
                    'parent_id' => 100,
                    'title'     => 'Blog & News',
                    'icon'      => 'fa-file-powerpoint-o',
                    'uri'       => 'modules/cms/cms_news',
                ]);
            }
        }
        return $return;
    }

    public function uninstall()
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = (new Config)->where('key', $this->configKey)->delete();
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error when uninstall'];
        }

        //Drop table
        (new CmsNews)->uninstallExtension();
        (new CmsNewsDescription)->uninstallExtension();

        //Remove menu
        (new Menu)->where('uri', 'modules/cms/cms_news')->delete();
        if (!(new Menu)->where('parent_id', 100)->count()) {
            (new Menu)->find(100)->delete();
        }

        return $return;
    }
    public function enable()
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = (new Config)->where('key', $this->configKey)->update(['value' => self::ON]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error enable'];
        }
        return $return;
    }
    public function disable()
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = (new Config)->where('key', $this->configKey)->update(['value' => self::OFF]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error disable'];
        }
        return $return;
    }

    public function config()
    {
        //Process
    }
    public function processConfig($data)
    {
        //Process
    }

//=======================

/**
 * [news description]
 * @return [type] [description]
 */
    public function news()
    {
        $news = (new CmsNews)->getItemsNews($limit = $this->configs['product_new'], $opt = 'paginate');
        return view($this->configType . '::' . 'cms_news',
            array(
                'title'       => trans('language.blog'),
                'description' => $this->configsGlobal['description'],
                'keyword'     => $this->configsGlobal['keyword'],
                'news'        => $news,
                'og_image'    => $this->logo,
            )
        );
    }

    public function newsDetail($name, $id)
    {
        $news_currently = CmsNews::find($id);
        if ($news_currently) {
            $title = ($news_currently) ? $news_currently->title : trans('language.not_found');
            return view($this->configType . '::' . 'cms_news_detail',
                array(
                    'title'          => $title,
                    'news_currently' => $news_currently,
                    'description'    => $this->configsGlobal['description'],
                    'keyword'        => $this->configsGlobal['keyword'],
                    'blogs'          => (new CmsNews)->getItemsNews($limit = 4),
                    'og_image'       => url($this->path_file . '/' . $news_currently->image),
                )
            );
        } else {
            return view($this->theme . '.notfound',
                array(
                    'title'       => trans('language.not_found'),
                    'description' => '',
                    'keyword'     => $this->configsGlobal['keyword'],
                )
            );
        }

    }
}
