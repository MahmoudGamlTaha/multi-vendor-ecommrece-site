<?php
#app/Modules/Cms/Models/CmsContentDescription.php
namespace App\Modules\Cms\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CmsContentDescription extends Model
{
    protected $primaryKey = null;
    public $timestamps    = false;
    public $table         = 'cms_content_description';
    protected $fillable   = ['lang_id', 'title', 'description', 'keyword', 'cms_content_id', 'content'];
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
                    $table->integer('cms_content_id');
                    $table->integer('lang_id');
                    $table->string('title', 200)->nullable();
                    $table->string('keyword', 200)->nullable();
                    $table->string('description', 200)->nullable();
                    $table->text('content')->nullable();
                    $table->unique(['cms_content_id', 'lang_id']);
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
