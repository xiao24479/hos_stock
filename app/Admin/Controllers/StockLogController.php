<?php

namespace App\Admin\Controllers;

use App\Goods;
use App\Hospital;
use App\StockLog;
use App\Http\Controllers\Controller;
use App\User;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;

class StockLogController extends Controller
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
            ->header('库存日志')
            ->body($this->grid());
    }



    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockLog);
        $ids = Goods::all()->where('hos_id',session('hos_id'))->pluck('id')->toArray();

        $grid->model()->whereIn('goods_id',$ids);


        $grid->id('ID')->sortable();
        $grid->uid('操作人')->display(function($id){
            return User::findOrFail($id)->name;
        });
        $grid->goods_id('商品')->display(function($id){
            return Goods::findOrFail($id)->name;
        });
        $grid->content('记录');
        $grid->add_time('操作时间');

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableEdit();
            $actions->disableView();
        });
        $grid->disableCreation();

        $grid->filter(function ($filter) {
            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            $filter->column(1/2, function ($filter) {
                $filter->between('add_time','操作时间')->datetime();
                $belong_ks_ids = array_keys(session('departments'));
                $user_info = [];
                foreach ( $belong_ks_ids as $index => $ks_id) {
                    $user_info[] = Hospital::findOrFail($ks_id)->users->pluck('name', 'id')->toArray();
                }
                $users = [];
                foreach ($user_info as $index => $item) {
                    foreach ($item as $key => $value) {
                        $users[$key] = $value;
                    }
                }

                $filter->equal('uid', '用户')->select($users);
            });
            $filter->column(1/2, function ($filter) {
                $filter->equal('goods_id', '商品')->select(Goods::all()->where('hos_id',session('hos_id'))->pluck('name', 'id'));
            });
        });

        return $grid;
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
        $ids = explode(',', $id);

        if (StockLog::destroy(array_filter($ids))) {
            $data = [
                'status'  => true,
                'message' => trans('admin.delete_succeeded'),
            ];
        } else {
            $data = [
                'status'  => false,
                'message' => trans('admin.delete_failed'),
            ];
        }

        return response()->json($data);
    }
}
