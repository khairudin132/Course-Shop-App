<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;
    use DefaultDatetimeFormat;

    protected $casts = [
        'price' => 'decimal:2',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_token', 'token');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'id', 'course_id');
    }


    public function getThumbnailAttribute($value)
    {
        if ($value) {
            return asset('uploads/' . $value);
        }

        return null;
    }
}
