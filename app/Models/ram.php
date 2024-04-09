<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ram extends Model
{
    protected $table = 'rams';
    protected $primaryKey = 'idss';
    
    public function dram()
    {
        return $this->belongsTo(dram::class);
    }
}
