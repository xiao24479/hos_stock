<?php

namespace App\Admin\Controllers;

use App\Hospital;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Show;
use Encore\Admin\Tree;
use Encore\Admin\Widgets\Box;

class HospitalController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
//    public function index(Content $content)
//    {
//        return $content
//            ->header(trans('admin.hospital'))
//            ->description(trans('admin.hospital_des'))
//            ->body($this->grid());
//    }

    public function index(Content $content)
    {
        return $content
            ->header(trans('admin.hospital'))
            ->description(trans('admin.list'))
            ->row(function (Row $row) {
                $row->column(6, $this->treeView()->render());
                $row->column(6, function (Column $column) {
                    $form = new \Encore\Admin\Widgets\Form();
                    $form->action(admin_base_path('hospitals'));
                    $roleModel = config('admin.database.roles_model');
                    $form->select('parent_id', trans('admin.parent_id'))->options(Hospital::selectOptions());
                    $form->text('title', trans('admin.hospital'))->rules('required');
                    $states = [
                        'on'  => ['value' => 1, 'text' => '是', 'color' => 'success'],
                        'off' => ['value' => 0, 'text' => '否', 'color' => 'danger'],
                    ];
                    $form->switch('is_show',trans('admin.is_show'))->states($states);
                    $form->hidden('_token')->default(csrf_token());
                    $column->append((new Box(trans('admin.new'), $form))->style('success'));
                });
            });
    }

    /**
     * Show interface.
     *
     * @param mixed   $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return redirect()->route('hospitals.edit', ['id' => $id]);
    }

    /**
     * @return \Encore\Admin\Tree
     */
    protected function treeView()
    {

        return Hospital::tree(function (Tree $tree) {
            $tree->disableCreate();

            $tree->branch(function ($branch) {
                $payload = "<strong>{$branch['title']}</strong>";
                if (!empty($branch['is_show'])) {
                    $payload .= "&nbsp;&nbsp;&nbsp;<span class=\"label label-success dd-nodrag\">显示</span>";
                } else {
                    $payload .= "&nbsp;&nbsp;&nbsp;<span class=\"label label-danger dd-nodrag\">隐藏</span>";
                }
                return $payload;
            });
        });
    }

    /**
     * Edit interface.
     *
     * @param mixed   $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Edit')
            ->description('description')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Create')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Hospital());

        $grid->id('ID')->sortable();
        $grid->column('title',trans('admin.hospital'));
        $grid->created_at('Created at');
        $grid->updated_at('Updated at');

        return $grid;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Hospital());
        $roleModel = config('admin.database.roles_model');
        $form->display('id', 'ID');
        $form->select('parent_id', trans('admin.parent_id'))->options(Hospital::selectOptions());
        $form->text('title', trans('admin.hospital'))->rules('required');
        $states = [
            'on'  => ['value' => 1, 'text' => '是', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '否', 'color' => 'danger'],
        ];
        $form->switch('is_show',trans('admin.is_show'))->states($states);
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));
        return $form;
    }
}
