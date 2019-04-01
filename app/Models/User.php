<?php

namespace App\Models;

class User extends BaseModel
{
    protected $hidden = [
        'password', 'remember_token', 'updated_at', 'deleted_at',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
