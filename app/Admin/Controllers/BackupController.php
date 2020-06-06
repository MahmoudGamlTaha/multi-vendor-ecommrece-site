<?php
#app/Http/Admin/Controllers/BackupController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use DB;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;

class BackupController extends Controller
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
        $download = request('download') ?? '';
        if ($download) {
            $file = storage_path() . "/backups/" . $download;
            if (file_exists($file)) {
                $headers = array(
                    'Content-Type' => 'application/octet-stream',
                );
                return response()->download($file, '', $headers);
            }
        }
        return $content
            ->row('<span style="font-size:15px;font-style: italic;">(' . trans('language.backup.guide') . ')</span><br>')
            ->header(trans('language.backup.manager'))
            ->description(' ')
            ->body($this->render());
    }

/**
 * [render description]
 * @return [type] [description]
 */
    public function render()
    {
        $arrFiles = [];
        foreach (glob(storage_path() . "/backups/*.sql") as $file) {
            if (file_exists($file)) {
                $fileInfo         = [];
                $fileInfo['path'] = $file;
                $arr              = explode('/', $file);
                $fileInfo['name'] = end($arr);
                $fileInfo['size'] = number_format(filesize($file) / 1048576, 2) . 'MB';
                $fileInfo['time'] = date('Y-m-d H:i:s', filemtime($file));
                $arrFiles[]       = $fileInfo;
            }
        }
        rsort($arrFiles);
        return view('admin.BackupManager')->with(
            [
                "title"    => trans('language.backup.title'),
                "arrFiles" => $arrFiles,
            ])->render();
    }

/**
 * [processBackupFile description]
 * @return [type] [description]
 */
    public function processBackupFile()
    {
        $file     = request('file');
        $action   = request('action');
        $pathFull = storage_path() . "/backups/" . $file;
        $return   = ['error' => '', 'msg' => ''];
        if ($action === 'remove') {
            try {
                unlink($pathFull);
                admin_toastr(trans('language.backup.remove_success'), 'success');
                $return = ['error' => 0, 'msg' => trans('language.backup.remove_success')];
            } catch (\Exception $e) {
                admin_toastr($e->getMessage(), 'error');
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else if ($action === 'restore') {
            try {
                // DB::transaction(function () use ($pathFull) {
                DB::unprepared(file_get_contents($pathFull));
                admin_toastr(trans('language.backup.restore_success'), 'success');
                $return = ['error' => 0, 'msg' => trans('language.backup.restore_success')];
                // });
            } catch (\Exception $e) {
                admin_toastr($e->getMessage(), 'error');
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        }

        return json_encode($return);
    }
    /**
     * [generateBackup description]
     * @return [type] [description]
     */
    public function generateBackup()
    {
        $return = shell_exec("php " . base_path() . "/artisan BackupDatabase");
        admin_toastr(trans('language.backup.generate_success'), 'success');
        return $return;
    }
}
