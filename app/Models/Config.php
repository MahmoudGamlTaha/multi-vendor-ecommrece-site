<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Config extends Model
{
    public $timestamps = false;
    public $table      = 'config';

/**
 * [getExtensionsGroup description]
 * @param  [type]  $group      [description]
 * @param  boolean $onlyActive [description]
 * @return [type]              [description]
 */
    public static function getExtensionsGroup($group, $onlyActive = true)
    {
        $return = self::where('code', $group);
        if ($onlyActive) {
            $return = $return->where('value', 1);
        }
        $return = $return->orderBy('sort', 'asc')
            ->get()->keyBy('key');
        return $return;
    }

}
