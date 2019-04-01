<?php

namespace App\Admin\Controllers;

use App\Category;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Column;
use Encore\Admin\Show;
use Encore\Admin\Layout\Row;
use Encore\Admin\Tree;
use Encore\Admin\Widgets\Box;

class CategoryController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('商品分类'))
            ->description('商品分类')
            ->row(function (Row $row) {
                $row->column(6, $this->treeView()->render());
                $row->column(6, function (Column $column) {
                    $form = new \Encore\Admin\Widgets\Form();
                    $form->action(admin_base_path('categories'));
                    $form->select('parent_id', trans('admin.parent_id'))->options(Category::selectOptions());
                    $form->text('title', '类名')->rules('required')->attribute(['autocomplete' => 'off']);
                    $states = [
                        'on'  => ['value' => 1, 'text' => '是', 'color' => 'success'],
                        'off' => ['value' => 0, 'text' => '否', 'color' => 'danger'],
                    ];
                    $form->switch('is_show',trans('admin.is_show'))->states($states)->default(1);
                    $form->hidden('_token')->default(csrf_token());
                    $column->append((new Box(trans('admin.new'), $form))->style('success'));
                });
            });
    }

    /**
     * @return \Encore\Admin\Tree
     */
    protected function treeView()
    {

        return Category::tree(function (Tree $tree) {
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
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
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
        $grid = new Grid(new Category);



        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Category::findOrFail($id));



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Category);
        $form->display('id', 'ID');
        $form->select('parent_id', trans('admin.parent_id'))->options(Category::selectOptions());
        $form->text('title', '类名')->rules('required');
        $states = [
            'on'  => ['value' => 1, 'text' => '是', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '否', 'color' => 'danger'],
        ];
        $form->switch('is_show',trans('admin.is_show'))->states($states)->default(1);
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));
        return $form;
    }
}
