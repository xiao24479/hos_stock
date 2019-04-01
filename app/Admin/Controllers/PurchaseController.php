<?php

namespace App\Admin\Controllers;

use App\Category;
use App\Goods;
use App\Purchase;
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

class PurchaseController extends Controller
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
            ->header('采购列表')
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
            ->header('采购商品详情')
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
        $hos_id = Purchase::findOrFail($id)->goods->hos_id;
        if ($hos_id != session('hos_id')) {
            return redirect(route('goods'));
        }
        return $content
            ->header('编辑采购商品')
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
            ->header('采购商品')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Purchase());


        $goods = Goods::all()->where('hos_id', session('hos_id'))->pluck('name','id')->toArray();
        $grid->model()->whereIn('goods_id', array_keys($goods));

        $grid->id('ID')->sortable();
        $grid->column('goods_id','商品名称')->display(function ($id){
            return Goods::findOrFail($id)->name;
        });
        $grid->column('quantity','数量');
        $grid->column('price','单价');
        $grid->column('remark','备注');

        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

        $grid->actions(function ($actions) {
            $actions->disableDelete(false);
            $actions->disableEdit(false);
            $actions->disableView(false);
        });

        $grid->filter(function($filter) use ($goods){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            //$filter->equal('department_id','部门')->select($departments);
            $filter->equal('goods_id','商品')->select($goods);

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
        $show = new Show(Purchase::findOrFail($id));

        $show->id('ID');
        $show->goods_id('商品')->as(function ($id) {
            return Goods::findOrFail($id)->name;
        })->label();
        $show->price('价格');
        $show->quantity('数量');
        $show->specification('备注');

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

        $form = new Form(new Purchase);

        $goods = Goods::all()->where('hos_id', session('hos_id'))->pluck('name','id')->toArray();

        $form->display('id', 'ID');
        $form->select('goods_id', '商品')->rules('required')->options($goods);
        $form->currency('price', '单价')->rules('required')->symbol('￥');
        $form->number('quantity', '数量')->rules('required')->min(1)->default(1);
        $form->textarea('remark', '备注');

        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));
        $form->hidden('operated_admin_id')->value(Admin::user()->id);

        $form->tools(function (Form\Tools $tools) {
            // 去掉`删除`按钮
            $tools->disableDelete();
            // 去掉`查看`按钮
            $tools->disableView();
        });

        $form->saved(function (Form $form)  {

            $uid = Admin::user()->id;
            $StockLog = new StockLog();
            $gid = $form->model()->goods_id;
            $price = $form->model()->price;
            $quantity = $form->model()->quantity;
            $goods_name = Goods::findOrFail($gid)->name;
            $StockLog->uid = $uid;
            $StockLog->goods_id = $gid;
            $request = Request::capture();
            $url = $request->server('HTTP_REFERER');
            $isAction = Str::contains($url,'create');

            if ($isAction) {
                $StockLog->content = '采购了商品：'.$goods_name.'(ID: '.$gid.')；价格为：'.$price.'；数量为：'.$quantity.'；';
                $StockLog->add_time = date('Y-m-d H:i:s');
                $StockLog->save();
            }

        });
        return $form;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $info = Purchase::findOrFail($id)->toArray();


        $uid = Admin::user()->id;
        $StockLog = new StockLog();

        $goods_id = $request->input('goods_id');
        $goods_name = Goods::findOrFail($goods_id)->name;

        $price = $request->input('price');
        $quantity = $request->input('quantity');
        $StockLog->uid = $uid;
        $StockLog->goods_id = $id;

        $StockLog->content = '';

        if ($goods_id != $info['goods_id']) {
            $StockLog->content .= '修改商品名称为：'.$goods_name.'(ID: '.$goods_id.')；';
        }
        if (strcmp($info['price'],$price) != 0 ) {
            $StockLog->content .= '修改商品价格为：'.$price.'；';
        }
        if (strcmp($info['quantity'],$quantity) != 0) {
            $StockLog->content .= '修改商品库存为：'.$quantity.'；';
        }

        if (!$StockLog->content) {
            $StockLog->content = '无重要修改记录';
        }

        $StockLog->add_time = date('Y-m-d H:i:s');
        $StockLog->save();
        return $this->form()->update($id);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return mixed
     */
    public function store()
    {
        return $this->form()->store();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if ($this->form()->destroy($id)) {
            $data = [
                'status'  => true,
                'message' => trans('admin.delete_succeeded'),
            ];
            StockLog::where('goods_id',$id)->delete();
        } else {
            $data = [
                'status'  => false,
                'message' => trans('admin.delete_failed'),
            ];
        }

        return response()->json($data);
    }
}
