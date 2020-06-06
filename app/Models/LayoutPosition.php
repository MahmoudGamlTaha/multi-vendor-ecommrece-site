<?php
#app/Models/LayoutPosition.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LayoutPosition extends Model
{
    public $timestamps = false;
    public $table      = 'layout_position';
    public static function getPositions()
    {
        return self::pluck('name', 'uniquekey')->all();
    }
}
