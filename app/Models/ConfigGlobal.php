<?php
#app/Models/ConfigGlobal.php
namespace App\Models;

use App\Models\ConfigGlobalDescription;
use App\Models\Language;
use Illuminate\Database\Eloquent\Model;

class ConfigGlobal extends Model
{
    public $timestamps  = false;
    public $table       = 'config_global';
    protected $fillable = ['locale', 'template'];
    protected $appends  = [
        'title',
        'keyword',
        'description',
    ];
    public function local()
    {
        $lang = Language::pluck('id', 'code')->all();
        return ConfigGlobalDescription::where('config_id', $this->id)
            ->where('lang_id', $lang[app()->getLocale()])
            ->first();
    }
    //Fields language
    public function getTitle()
    {
        return empty($this->local()->title) ? '' : $this->local()->title;
    }
    public function getDescription()
    {
        return empty($this->local()->description) ? '' : $this->local()->description;
    }
    public function getKeyword()
    {
        return empty($this->local()->keyword) ? '' : $this->local()->keyword;
    }
    //Get Attributes
    public function getTitleAttribute()
    {
        return $this->getTitle();
    }
    public function getDescriptionAttribute()
    {
        return $this->getDescription();
    }
    public function getKeywordAttribute()
    {
        return $this->getKeyword();
    }
}
