<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Goods extends Model
{
    protected $fillable = ['name','is_valid','remark','hos_id','cate_id','operated_admin_id'];

    public function __construct(array $attributes = [])
    {
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable('admin_goods');

        parent::__construct($attributes);
    }
}
