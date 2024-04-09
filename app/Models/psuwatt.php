<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class psuwatt extends Model
{
    public function gpuwatts()
    {
        return $this->belongsToMany(GpuWatt::class, 'gpupsuwatts', 'psuwatt_id', 'gpuwatt_id');
    }

    public function psus()
    {
        return $this->hasMany(Psu::class);
    }
}
