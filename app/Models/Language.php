<?php
#app/Models/Language.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    public $table      = 'language';
    public $timestamps = false;
    public static function getLanguages()
    {
        return self::where('status', 1)->get()->keyBy('id');
    }
}
