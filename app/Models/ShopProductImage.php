<?php
#app/Models/ShopProductImage.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductImage extends Model
{
    public $timestamps  = false;
    public $table       = 'shop_product_image';
    protected $fillable = ['id', 'image', 'product_id', 'status'];
    public function product()
    {
        return $this->belongsTo(ShopProduct::class, 'product_id', 'id');
    }

    /**
     * [getThumb description]
     * @return [type] [description]
     */
    public function getThumb()
    {
        $path_file = config('filesystems.disks.path_file', '');
        if (!file_exists($path_file . '/thumb/' . $this->image)) {
            return $path_file . '/' . $this->image;
        } else {
            return $path_file . '/thumb/' . $this->image;
        }
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
}
