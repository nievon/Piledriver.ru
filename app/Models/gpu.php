<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class gpu extends Model
{
    public function gpuWatt()
    {
        return $this->belongsTo(GpuWatt::class, 'gpuwatt_id');
    }
}
