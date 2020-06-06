<?php
#app/Models/LayoutType.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LayoutType extends Model
{
    public $timestamps = false;
    public $table      = 'layout_type';
    public static function getTypes()
    {
        return self::pluck('name', 'uniquekey')->all();
    }
}
