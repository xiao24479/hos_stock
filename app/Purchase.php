<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable = ['goods_id','quantity','price','remark','operated_admin_id'];

    public function __construct(array $attributes = [])
    {
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable('admin_purchase');

        parent::__construct($attributes);
    }

    public function goods()
    {
        return $this->belongsTo(Goods::class,'goods_id');
    }
}
