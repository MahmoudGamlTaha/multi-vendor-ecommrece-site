<?php

namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class CKEditor extends Field
{
    public static $js = [
        '/packages/ckeditor/ckeditor.js',
        '/packages/ckeditor/adapters/jquery.js',
    ];

    protected $view = 'admin.CKEditor';

    public function render()
    {
        $this->script = "$('textarea.{$this->getElementClassString()}').ckeditor(
                {
                    filebrowserImageBrowseUrl: '/" . config('admin.route.prefix') . "/documents?type=Images',
                    filebrowserImageUploadUrl: '/" . config('admin.route.prefix') . "/documents/upload?type=Images&_token=',
                    filebrowserBrowseUrl: '/" . config('admin.route.prefix') . "/documents?type=Files',
                    filebrowserUploadUrl: '/" . config('admin.route.prefix') . "/documents/upload?type=Files&_token=',
                    filebrowserWindowWidth: '900',
                    filebrowserWindowHeight: '500'
                }
            );
            ";
        return parent::render();
    }
}
