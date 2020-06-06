<?php
#app/Models/Layout.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Layout extends Model
{
    public $timestamps  = false;
    public $table       = 'layout';
    protected $fillable = ['status', 'content', 'sort', 'type', 'page', 'position', 'name'];
    /**
     * Get value field page same array
     * @param  [type] $page [description]
     * @return [type]                 [description]
     */
    public function getPageAttribute($page)
    {
        if (is_string($page) && $page) {
            return explode(',', $page);
        } else {
            return $page;
        }
    }

/**
 * Set value for field page
 * @param [type] $page [description]
 */
    public function setPageAttribute($page)
    {
        if (is_array($page)) {
            $this->attributes['page'] = implode(',', $page);
        } else {
            $this->attributes['page'] = $page;
        }

    }

    public static function getLayout()
    {
        return self::where('status', 1)
            ->orderBy('sort', 'desc')
            ->get()
            ->groupBy('position');
    }

}
