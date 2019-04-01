<?php

namespace App\Admin\Controllers;

use App\Application;
use App\Hospital;
use App\Reback;
use App\Goods;
use App\Http\Controllers\Controller;
use App\StockLog;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\MessageBag;
use Illuminate\Support\Str;

class RebackController extends Controller
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
            ->header('退还列表')
            ->body($this->grid());
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
            ->header('编辑')
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
            ->header('退还')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Reback);

        $department_id = array_keys(session('departments'));

        $grid->model()->whereIn('department_id', $department_id);
        $grid->id('ID')->sortable();
        $grid->column('department_id','部门')->display(function ($id){
            return Hospital::findOrFail($id)->title;
        });
        $grid->column('goods_id','商品')->display(function ($id){
            return Goods::findOrFail($id)->name;
        });
        $grid->column('applicant','申领人');
        $grid->column('quantity','退还数量');
        $grid->column('remark','备注');

        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableEdit(false);
            $actions->disableView();
        });

        $grid->filter(function($filter) {

            // 去掉默认的id过滤器
            $filter->disableIdFilter();


        });

        return $grid;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Reback);

        $goods = Goods::all()->where('hos_id',session('hos_id'))->pluck('name','id')->toArray();

        $form->display('id', 'ID');
        $form->select('department_id', '部门')->rules('required')->options(session('departments'));
        $form->select('goods_id', '商品')->rules('required')->options($goods);
        $form->text('applicant', '退还人')->rules('required')->attribute(['autocomplete' => 'off']);
        $form->number('quantity', '数量')->rules('required')->min(1)->default(1);
        $form->textarea('remark', '备注');
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));

        $form->tools(function (Form\Tools $tools) {
            // 去掉`删除`按钮
            $tools->disableDelete();
            // 去掉`查看`按钮
            $tools->disableView();
        });

        $form->saved(function (Form $form)  {

            $request = Request::capture();
            $url = $request->server('HTTP_REFERER');
            $isAction = Str::contains($url,'create');

            if ($isAction) {
                try {
                    $id = $form->model()->id;
                    $goods_id = $form->model()->goods_id;
                    $quantity = $form->model()->quantity;
                    $applicant = $form->model()->applicant;
                    $department_id = $form->model()->department_id;

                    $goods_name = Goods::findOrFail($goods_id)->name;
                    $department = Hospital::findOrFail($department_id)->title;

                    $goods_name = Goods::findOrFail($goods_id)->name;
                    //该部门所有申领数量
                    $apply = Application::all()->where('goods_id',$goods_id)->where('department_id',$department_id)->toArray();
                    $applyQuantity = 0;
                    foreach ($apply as $key => $value) {
                        $applyQuantity += $value['quantity'];
                    }

                    //该部门所有退还数量
                    $reback = Reback::all()->where('goods_id',$goods_id)->where('department_id',$department_id)->toArray();
                    $rebackQuantity = 0;
                    foreach ($reback as $key => $value) {
                        //本次退还数量会被加进去所有要扣除本次退还数量
                        if ($id == $value['id']) {
                            continue;
                        }
                        $rebackQuantity += $value['quantity'];
                    }

                    //剩余申领数量
                    $allQuantity = $applyQuantity - $rebackQuantity;

                    if ($allQuantity < $quantity) {
                        $error = new MessageBag([
                            'title' => '退还数超出部门申领数',
                            'message' => '原因：'.$department.$goods_name.'总共才剩下：'.$allQuantity.'个',
                        ]);
                        DB::rollBack();
                        return back()->with(compact('error'));
                    }

                    $uid = Admin::user()->id;
                    $StockLog = new StockLog();

                    $StockLog->uid = $uid;
                    $StockLog->goods_id = $goods_id;

                    $StockLog->content = $applicant.'退还了'.$quantity.'个';

                    $StockLog->add_time = date('Y-m-d H:i:s');
                    $StockLog->save();

                } catch (\Exception $exception) {
                    $error = new MessageBag([
                        'title' => '退还失败',
                        'message' => '原因：程序内部错误！',
                    ]);
                    DB::rollBack();
                    return back()->with(compact('error'));
                }

                DB::commit();
            }

        });

        return $form;
    }

    public function store()
    {
        //开启事物
        DB::beginTransaction();
        return $this->form()->store();
    }

    public function update(Request $request,$id)
    {
        $quantity = Reback::findOrFail($id)->quantity;
        $postQuantity = intval($request->input('quantity'));

        if ($quantity != $postQuantity) {
            $error = new MessageBag([
                'title' => '错误',
                'message' => '禁止修改退还数量！',
            ]);

            return back()->with(compact('error'));
        }


        return $this->form()->update($id);
    }
}
