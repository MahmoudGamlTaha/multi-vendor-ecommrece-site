<?php
namespace App\Scart;

use Gnugat\NomoSpaco\File\FileRepository;
use Gnugat\NomoSpaco\FqcnRepository;
use Gnugat\NomoSpaco\Token\ParserFactory;

class FindClass
{

    public static function start()
    {
        $fileRepository = new FileRepository();
        $parserFactory  = new ParserFactory();

        return new FqcnRepository($fileRepository, $parserFactory);
    }
    public static function classNames($folder, $group = null)
    {
        $group      = ucfirst($group);
        $arrModules = [];
        $path       = app_path() . '/' . $folder . '/' . $group . '/Controllers';
        $modules    = self::start()->findIn($path);
        if ($modules) {
            foreach ($modules as $key => $module) {
                $arrTmp       = explode('\\', $module);
                $arrModules[] = end($arrTmp);
            }
        }

        return $arrModules;
    }

    public static function findClassNames($folder, $group = null, $module = null)
    {
        $group = ucfirst($group);
        $path  = app_path() . '/' . $folder . '/' . $group . '/Controllers';
        if ($module) {
            return self::start()->findInFor($path, $module);
        } else {
            return self::start()->findIn($path);
        }
    }
}
