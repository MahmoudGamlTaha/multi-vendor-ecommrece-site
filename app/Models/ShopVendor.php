<?php
#app/Models/ShopVendor.php
namespace App\Models;

use Helper;
use Illuminate\Database\Eloquent\Model;

class ShopVendor extends Model
{
    public $timestamps = false;
    public $table      = 'shop_vendor';

    public function products()
    {
        return $this->hasMany(ShopProduct::class, 'vendor_id', 'id');
    }

    public function getVendorsList()
    {
        return $this->orderBy('id', 'desc')->orderBy('sort', 'desc')->get();
    }

    public function getVendors($limit = null, $opt = null, $sortBy = null, $sortOrder = 'asc')
    {
        $query = $this->sort($sortBy, $sortOrder);
        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else
        if ($opt == 'random') {
            return $query->inRandomOrder()->limit($limit)->get();
        } else {
            return $query->limit($limit)->get();
        }

    }

    public function getProductsToVendor($id, $limit = null, $opt = null, $sortBy = null, $sortOrder = 'asc')
    {
        $query = (new ShopProduct)->where('status', 1)->where('vendor_id', $id);

        //Hidden product out of stock
        if (empty(\Helper::configs()['product_display_out_of_stock'])) {
            $query = $query->where('stock', '>', 0);
        }
        $query = $query->sort($sortBy, $sortOrder);
        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else
        if ($opt == 'random') {
            return $query->inRandomOrder()->limit($limit)->get();
        } else {
            return $query->limit($limit)->get();
        }

    }

    /**
     * [getUrl description]
     * @return [type] [description]
     */
    public function getUrl()
    {
        return route('vendor', ['name' => Helper::strToUrl($this->name), 'id' => $this->id]);
    }

    /**
     * [getImage description]
     * @return [type] [description]
     */
    public function getImage()
    {
        $path_file = config('filesystems.disks.path_file', '');
        return $path_file . '/' . $this->image;

    }

//Scort
    public function scopeSort($query, $sortBy = null, $sortOrder = 'asc')
    {
        $sortBy = $sortBy ?? 'sort';
        return $query->orderBy($sortBy, $sortOrder);
    }
}
