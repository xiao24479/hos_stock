<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    protected $fillable = ['goods_id', 'department_id', 'applicant','quantity','remark'];

    public function __construct(array $attributes = [])
    {
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable('admin_application');

        parent::__construct($attributes);
    }

}
