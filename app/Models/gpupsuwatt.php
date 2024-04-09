<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class gpupsuwatt extends Model
{
    public function gpuWatt()
    {
        return $this->belongsTo(GpuWatt::class, 'gpuwatt_id');
    }

    public function psuWatt()
    {
        return $this->belongsTo(PsuWatt::class, 'psuwatt_id');
    }
}
