<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class recall extends Model
{
    protected $fillable = ['user_id', 'text', 'date'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
