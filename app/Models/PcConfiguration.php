<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PcConfiguration extends Model
{
    protected $table = 'pc_configurations';

    public function processor()
    {
        return $this->belongsTo('App\Models\Processor');
    }

    public function motherboard()
    {
        return $this->belongsTo('App\Models\motherboards');
    }

    public function ram()
    {
        return $this->belongsTo('App\Models\ram', 'ram_id', 'idss');
    }


    public function gpu()
    {
        return $this->belongsTo('App\Models\gpu');
    }

    public function psu()
    {
        return $this->belongsTo('App\Models\psu');
    }

    public function case()
    {
        return $this->belongsTo('App\Models\casee');
    }

    public function rom()
    {
        return $this->belongsTo('App\Models\rom');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function status()
{
    return $this->belongsTo(statys::class);
}
}
