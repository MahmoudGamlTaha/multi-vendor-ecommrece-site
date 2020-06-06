<?php
#app/Modules/Cms/Models/CmsCategoryDescription.php
namespace App\Modules\Cms\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CmsCategoryDescription extends Model
{
    protected $primaryKey = null;
    public $timestamps    = false;
    public $table         = 'cms_category_description';
    protected $fillable   = ['lang_id', 'title', 'description', 'keyword', 'cms_category_id'];

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
                    $table->integer('cms_category_id');
                    $table->integer('lang_id');
                    $table->string('title', 200)->nullable();
                    $table->string('keyword', 200)->nullable();
                    $table->string('description', 200)->nullable();
                    $table->unique(['cms_category_id', 'lang_id']);
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
