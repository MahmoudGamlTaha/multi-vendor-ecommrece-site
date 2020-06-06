<?php
namespace App\Models;
use App\Models\Company;
use Illuminate\Database\Eloquent\Model;
class ProductPriceList extends Model {
  protected $table = "product_price_list";
//sprint 3
  function compnayPriceList(){
      return $this->belongsTo(company::class, "company_id", "id");
  }

}
?>