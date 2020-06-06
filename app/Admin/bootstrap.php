<?php
/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */
use App\Admin\Extensions\Column\Expands;
use App\Admin\Extensions\Form\CKEditor;
use App\Models\ConfigGlobal;
use App\Models\Language;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid\Column;

//Set language
$configs_global = ConfigGlobal::first();
$languages      = Language::where('status', 1)->get()->keyBy('code');
Encore\Admin\Form::forget(['map', 'editor']);
//custome template admin
app('view')->prependNamespace('admin', resource_path('views/admin'));
Column::extend('expand', Expands::class);

Form::extend('ckeditor', CKEditor::class);
//end Ckeditor
Admin::navbar(function (\Encore\Admin\Widgets\Navbar $navbar) use ($languages) {
    $path_file = config('filesystems.disks.path_file');
    if (count($languages) > 1) {
        $navbar->left(view('admin.language', compact('languages', 'path_file')));
    }
    if (!empty(Admin::user()->username) && Admin::user()->username == 'test') {
        $navbar->left(trans('language.admin.note_test'));
    }
    $navbar->left(view('admin.search-bar'));

    $navbar->right('');

});
