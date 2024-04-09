<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'item_id',
        'quantity',
    ];

    public function item()
    {
        return $this->belongsTo(catalogs::class, 'item_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
