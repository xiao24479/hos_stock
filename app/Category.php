<?php

namespace App;

use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use AdminBuilder, ModelTree {
        ModelTree::boot as treeBoot;
    }
    protected $fillable = ['parent_id', 'order', 'title','is_show'];

    public function __construct(array $attributes = [])
    {
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable('admin_categories');

        parent::__construct($attributes);
    }
}
