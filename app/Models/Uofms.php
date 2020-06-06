<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Uofms extends Model
{// sprint 3
  protected $table ="uofms";
  public function getGroup(){
   return $this->belongsTo(UofmGroups::class, "group_id", "id");
  }
}