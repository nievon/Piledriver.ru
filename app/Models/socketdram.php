<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class socketdram extends Model
{
    public function drams()
    {
        return $this->belongsToMany(dram::class, 'dram_id');
    }

    public function sockets()
    {
        return $this->belongsToMany(socket::class, 'socket_id');
    }
}
