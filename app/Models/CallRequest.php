<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CallRequest extends Model
{
    use HasFactory;

    protected $table = 'call_requests';

    protected $fillable = [
        'name',
        'phone',
        'date',
        'time',
    ];
}
