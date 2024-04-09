<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MotherboardProcessor extends Model
{
    protected $table = 'motherboard_processor';

    public function motherboard()
    {
        return $this->belongsTo(motherboards::class, 'motherboard_id');
    }

    public function processor()
    {
        return $this->belongsTo(Processor::class, 'processor_id');
    }
}
