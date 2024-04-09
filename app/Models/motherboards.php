<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class motherboards extends Model
{
    use HasFactory;

    protected $table = 'motherboards';

    protected $fillable = [
        'name',
        'price',
        'socket',
        // Добавьте другие заполнимые поля для материнских плат
    ];

    // Определите связь с моделью Processor
    public function processors()
    {
        return $this->belongsToMany(Processor::class, 'motherboard_processor');
        
    }
}
