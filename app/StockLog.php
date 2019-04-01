<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StockLog extends Model
{
    protected $fillable = ['uid', 'goods_id', 'content','add_time'];

    public $timestamps = false;

    public function __construct(array $attributes = [])
    {
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable('admin_goods_stock_log');

        parent::__construct($attributes);
    }
    public function goods()
    {
        return $this->belongsTo(Goods::class);
    }
}
