<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderPC extends Model
{
    protected $fillable = [
        'user_id',
        'total_price',
    ];

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function status()
    {
        return $this->belongsTo(statys::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
