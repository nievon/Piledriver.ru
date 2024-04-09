<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GpuWatt extends Model
{
    protected $table = 'gpuwatts';
    
    public function psuwatts()
    {
        return $this->belongsToMany(PsuWatt::class, 'gpupsuwatts', 'gpuwatt_id', 'psuwatt_id');
    }

    public function gpus()
    {
        return $this->hasMany(Gpu::class);
    }
}
