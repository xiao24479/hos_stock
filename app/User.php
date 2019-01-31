<?php

namespace App;

use Encore\Admin\Auth\Database\Administrator as BaseAdministrator;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class User extends BaseAdministrator
{
    /**
     * A user has and belongs to many roles.
     *
     * @return BelongsToMany
     */
    public function hospitals() : BelongsToMany
    {
        $pivotTable = 'admin_user_hospitals';

        $relatedModel = Hospital::class;

        return $this->belongsToMany($relatedModel, $pivotTable, 'user_id', 'hos_id');
    }

}
