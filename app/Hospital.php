<?php

namespace App;

use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/**
 * Class Menu.
 *
 * @property int $id
 *
 * @method where($parent_id, $id)
 */
class Hospital extends Model
{
    use AdminBuilder, ModelTree {
        ModelTree::boot as treeBoot;
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['parent_id', 'order', 'title','is_show'];

    /**
     * Create a new Eloquent model instance.
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = [])
    {
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable('admin_hospitals');

        parent::__construct($attributes);
    }

    public function users() : belongsToMany
    {
        $pivotTable = 'admin_user_hospitals';

        $relatedModel = User::class;

        return $this->belongsToMany($relatedModel, $pivotTable, 'hos_id', 'user_id');
    }

}
