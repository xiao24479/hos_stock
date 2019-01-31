<?php

namespace App\Admin\Controllers;

use App\Hospital;
use App\User;
use Encore\Admin\Controllers\UserController as BaseUserController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends BaseUserController
{

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $userModel = User::class;

        $grid = new Grid(new $userModel());

        $grid->id('ID')->sortable();
        $grid->username(trans('admin.username'));
        $grid->name(trans('admin.name'));
        $grid->roles(trans('admin.roles'))->pluck('name')->label();
        $grid->hospitals(trans('admin.hospitals'))->display(function ($hospitals) {
            $arr = [];
            $hos_tree = generateTree(Hospital::all()->toArray());
            if (!empty($hospitals)) {
                foreach ($hospitals as $key => $value) {
                    foreach ($hos_tree as $k => $val) {
                        if ($value['parent_id'] == $val['id']) {
                            $arr[] = $val['title'].'-'.$value['title'];
                        }
                    }
                }
            }
            return $arr;
        })->label();
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            if ($actions->getKey() == 1) {
                $actions->disableDelete();
            }
        });

        $grid->tools(function (Grid\Tools $tools) {
            $tools->batch(function (Grid\Tools\BatchActions $actions) {
                $actions->disableDelete();
            });
        });

        return $grid;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    public function form()
    {
        $userModel = User::class;
        $permissionModel = config('admin.database.permissions_model');
        $roleModel = config('admin.database.roles_model');

        $form = new Form(new $userModel());

        $form->display('id', 'ID');

        $form->text('username', trans('admin.username'))->rules('required');
        $form->text('name', trans('admin.name'))->rules('required');
        $form->image('avatar', trans('admin.avatar'));
        $form->password('password', trans('admin.password'))->rules('required|confirmed');
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')
            ->default(function ($form) {
                return $form->model()->password;
            });

        $form->ignore(['password_confirmation']);

        $form->multipleSelect('roles', trans('admin.roles'))->options($roleModel::all()->pluck('name', 'id'));
        $form->multipleSelect('permissions', trans('admin.permissions'))->options($permissionModel::all()->pluck('name', 'id'));

        $hos_tree = generateTree(Hospital::all()->toArray());
        $hospitals = [];
        foreach ($hos_tree as $key => $value) {
            if (!empty($value['son'])) {
                foreach ($value['son'] as $k => $val) {
                    $hospitals[$val['id']] = $value['title'].'---'.$val['title'];
                }
            }
        }
        $form->listbox('hospitals', trans('admin.hospitals'))->options($hospitals);

        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = bcrypt($form->password);
            }
        });

        return $form;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        $userModel = User::class;

        $show = new Show($userModel::findOrFail($id));

        $show->id('ID');
        $show->username(trans('admin.username'));
        $show->name(trans('admin.name'));
        $show->roles(trans('admin.roles'))->as(function ($roles) {
            return $roles->pluck('name');
        })->label();
        $show->permissions(trans('admin.permissions'))->as(function ($permission) {
            return $permission->pluck('name');
        })->label();
        $show->hospitals(trans('admin.hospitals'))->as(function ($hospitals) {
            $arr = [];
            $hos_tree = generateTree(Hospital::all()->toArray());
            if (!empty($hospitals)) {
                foreach ($hospitals as $key => $value) {
                    foreach ($hos_tree as $k => $val) {
                        if ($value['parent_id'] == $val['id']) {
                            $arr[] = $val['title'].'-'.$value['title'];
                        }
                    }
                }
            }
            return $arr;
        })->label();

        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }
}
