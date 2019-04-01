<?php

namespace App\Admin\Controllers;

use App\Category;
use App\Goods;
use App\Http\Controllers\Controller;
use App\StockLog;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class GoodsController extends Controller
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
            ->header('商品管理')
            ->body($this->grid());
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
            ->header('详情')
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
        //防止在切换医院时，把商品信息改成其他医院
        $hos_id = intval(Goods::findOrFail($id)->hos_id);
        if ($hos_id !== intval(session('hos_id'))) {
            return redirect(route('goods'));
        }
        return $content
            ->header('编辑商品')
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
            ->header('添加商品')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Goods);

        $cateList = Category::all()->where('is_show',1)->toArray();

        $grid->model()->where('hos_id', session('hos_id'));
        $grid->id('ID')->sortable();
        $grid->column('name','商品名称');
        $grid->column('is_valid','是否显示')->display(function ($is){
           return $is ? '<span class="label label-success">是</span>' : '<span class="label label-warning">否</span>';
        });

        $grid->column('cate_id','分类')->display(function ($id) use ( $cateList ) {
            foreach ($cateList as $key => $value) {
                if ($id == $value['id']){
                    return '<span class="label label-success">'.$value['title'].'</span>';
                }
            }
        });

        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

        //分类树形
        $cateTree = getTree(Category::all()->where('is_show',1)->toArray());
        $cate_map = [];
        foreach ($cateTree as $key => $value) {
            $cate_map[$value['id']] = str_repeat('&#12288;&#12288;',$value['level']).$value['title'];
        }

        $grid->actions(function ($actions) {
            $actions->disableDelete(false);
            $actions->disableEdit(false);
            $actions->disableView(false);
        });

        $grid->filter(function($filter) use ($cate_map){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            //$filter->equal('department_id','部门')->select($departments);
            $filter->equal('cate_id','分类')->select($cate_map);
            $filter->like('name', '商品');

        });


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
        $show = new Show(Goods::findOrFail($id));

        $show->id('ID');
        $show->name('商品');

        $show->cate_id('分类')->as(function ($id) {
            return Category::findOrFail($id)->title;
        })->label();

        $show->is_valid('是否显示')->as(function ($is) {
            return $is ? '是' : '否';
        })->label();
        $show->remark('备注');

        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {

        $form = new Form(new Goods);

        //分类树形
        $cateTree = getTree(Category::all()->where('is_show',1)->toArray());
        $cate_map = [];
        foreach ($cateTree as $key => $value) {
            $cate_map[$value['id']] = str_repeat('&#12288;&#12288;',$value['level']).$value['title'];
        }

        $form->display('id', 'ID');
        $form->select('cate_id', '分类')->rules('required')->options($cate_map);
        $form->text('name', '商品')->rules('required')->attribute(['autocomplete' => 'off']);
        $form->textarea('remark', '备注');
        $states = [
            'on'  => ['value' => 1, 'text' => '是', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '否', 'color' => 'danger'],
        ];
        $form->switch('is_valid',trans('admin.is_show'))->states($states)->default(1);
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));
        $form->hidden('operated_admin_id')->value(Admin::user()->id);
        $form->hidden('hos_id')->value(session('hos_id'));


        $form->tools(function (Form\Tools $tools) {
            // 去掉`删除`按钮
            $tools->disableDelete();
            // 去掉`查看`按钮
            $tools->disableView();
        });

        return $form;
    }

}
