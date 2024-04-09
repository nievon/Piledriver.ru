<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'cpu',
        'motherboard',
        'ram',
        'gpu',
        'psu',
        'case',
        'rom',
    ];
}
