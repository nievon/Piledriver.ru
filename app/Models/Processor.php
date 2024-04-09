<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Processor extends Model
{

    protected $table = 'processors';

    public function motherboards()
    {
        return $this->belongsToMany(motherboards::class, 'motherboard_processor');
    }

    public function socket()
    {
        return $this->belongsTo(socket::class);
    }
}
