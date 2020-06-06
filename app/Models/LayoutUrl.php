<?php
#app/Models/LayoutUrl.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LayoutUrl extends Model
{
    public $timestamps = false;
    public $table      = 'layout_url';
    public static function getAllUrl()
    {
        return self::where('status', 1)->orderBy('sort', 'desc')->orderBy('id', 'desc')->get()->groupBy('group');
    }
}
