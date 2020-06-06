<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class UofmGroups extends Model
{
  protected $table ="uofm_groups";
//sprint 3
  public function getUnits(){
    return $this->hasMany(Uofms::class,'group_id', 'id');
  }
}