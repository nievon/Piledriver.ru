<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class psu extends Model
{
    public function psuWatt()
    {
        return $this->belongsTo(PsuWatt::class, 'psuwatt_id');
    }
}
