<?php
#app/Modules/Cms/Models/CmsImage.php
namespace App\Modules\Cms\Models;

use App\Modules\Cms\Models\CmsContent;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CmsImage extends Model
{
    public $timestamps  = false;
    public $table       = 'cms_image';
    protected $fillable = ['id', 'image', 'content_id', 'status'];
    public function content()
    {
        return $this->belongsTo(CmsContent::class, 'content_id', 'id');
    }
//=========================

    public function uninstallExtension()
    {
        if (Schema::hasTable($this->table)) {
            Schema::drop($this->table);
        }
    }

    public function installExtension()
    {
        $return = ['error' => 0, 'msg' => 'Install modules success'];
        if (!Schema::hasTable($this->table)) {
            try {
                Schema::create($this->table, function (Blueprint $table) {
                    $table->increments('id');
                    $table->integer('content_id')->default(0);
                    $table->string('image', 100)->nullable();
                    $table->tinyInteger('sort')->default(0);
                    $table->tinyInteger('status')->default(0);
                });
            } catch (\Exception $e) {
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else {
            $return = ['error' => 1, 'msg' => 'Table ' . $this->table . ' exist!'];
        }
        return $return;
    }

}
