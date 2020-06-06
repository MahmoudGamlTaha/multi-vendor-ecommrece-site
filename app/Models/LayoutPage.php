<?php
#app/Models/LayoutPage.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LayoutPage extends Model
{
    public $timestamps = false;
    public $table      = 'layout_page';
    public static function getPages()
    {
        return self::pluck('name', 'uniquekey')->all();
    }
}
