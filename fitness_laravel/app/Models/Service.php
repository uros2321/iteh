<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $guarded=[];

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

    public function coach()
    {
        return $this->belongsToMany(Coach::class);
    }

    public function usage()
    {
        return $this->hasMany(Usage::class);
    }

}
