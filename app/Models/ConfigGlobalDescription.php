<?php
#app/Models/ConfigGlobalDescription.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConfigGlobalDescription extends Model
{
    protected $primaryKey = null;
    public $timestamps    = false;
    public $table         = 'config_global_description';
    protected $fillable   = ['lang_id', 'title', 'description', 'keyword', 'config_id'];
}
