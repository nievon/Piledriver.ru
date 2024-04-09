<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class catalogs extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'img',
        'price',
        'tagline',
        'description',
        'motherboard',
        'CPU',
        'GPU',
        'RAM',
        'ROM',
        'PSU',
        'coolingsys',
        'CASE',
        'FPS',
    ];
}
