<?php

namespace App\Admin\Extensions;

use App\Application;
use App\Goods;
use App\Hospital;
use App\Purchase;
use App\Reback;
use App\StockLog;

class Dashboard
{
    public static function generalData()
    {
        $data = [];
        $goods_info = Goods::all()->where('hos_id',session('hos_id'))->toArray();

        //采购成本
        $purchases = Purchase::all()->whereIn('goods_id',array_column($goods_info,'id'))->toArray();
        $sumPurchases = 0;
        $purchaseQuantity = 0;
        foreach ($purchases as $key => $purchase) {
            $sumPurchases += $purchase['quantity']*$purchase['price'];
        }
        $data['sumPurchaseAmount'] = number_format($sumPurchases,'2','.',',');

        //各商品采购申领退还明库存细表
        $goods_num = count($goods_info);
        $goodsTitles = [];
        $chartData = [];
        if ($goods_num) {
            //各商品采购数量
            $purchaseInfo = Purchase::groupBy('goods_id')->selectRaw('goods_id, sum(quantity) as sum_quantity')->whereIn('goods_id',array_column($goods_info,'id'))->get()->toArray();

            $purchaseData = [];
            if (!empty($purchaseInfo)) {
                foreach ($goods_info as $index => $item) {
                    foreach ($purchaseInfo as $key => $value) {
                        if ($item['id'] == $value['goods_id']) {
                            $purchaseData[$item['id']] = intval($value['sum_quantity']);
                            $goodsTitles[$item['id']] = $item['name'];
                            break;
                        } else {
                            $purchaseData[$item['id']] = 0;
                            $goodsTitles[$item['id']] = $item['name'];
                        }
                    }
                }
            } else {
                foreach ($goods_info as $index => $item) {
                    $goodsTitles[$item['id']] = $item['name'];
                }
            }

            $cgData = ['name' => '采购数量','data' => $purchaseData];

            //各商品申领数量
            $applyInfo = Application::groupBy('goods_id')->selectRaw('goods_id, sum(quantity) as sum_quantity')->whereIn('goods_id',array_column($goods_info,'id'))->get()->toArray();
            $applyData = [];
            foreach ($goods_info as $index => $item) {
                foreach ($applyInfo as $key => $value) {
                    if ($item['id'] == $value['goods_id']) {
                        $applyData[$item['id']] = intval($value['sum_quantity']);
                        break;
                    } else {
                        $applyData[$item['id']] = 0;
                    }
                }
            }

            $slData = ['name' => '申领数量','data' => $applyData];

            //各商品退还数量
            $rebackInfo = Reback::groupBy('goods_id')->selectRaw('goods_id, sum(quantity) as sum_quantity')->whereIn('goods_id',array_column($goods_info,'id'))->get()->toArray();
            $rebackData = [];
            foreach ($goods_info as $index => $item) {
                foreach ($rebackInfo as $key => $value) {
                    if ($item['id'] == $value['goods_id']) {
                        $rebackData[$item['id']] = intval($value['sum_quantity']);
                        break;
                    } else {
                        $rebackData[$item['id']] = 0;
                    }
                }
            }
            $thData = ['name' => '退还数量','data' => $rebackData];

            array_push($chartData,$cgData,$slData,$thData);

            foreach ($chartData as $key => $value) {
                $chartData[$key]['data'] = array_values(array_pad($chartData[$key]['data'],$goods_num,0));
            }

            //各商品库存
            $getStockData = [];
            foreach ($chartData as $key => $value) {
                $getStockData[] = $chartData[$key]['data'];
            }

            $arr = [];
            for ($i = 0; $i < $goods_num; $i++ ) {
                $arr[] = array_column($getStockData,$i);
            }

            $stockData = [];
            foreach ($arr as $item) {
                $stockData[] = $item[0] - $item[1] + $item[2];
            }

            $kcData = ['name' => '库存数量','data' => $stockData];

            array_push($chartData,$kcData);

            $data['goodsTitles'] = json_encode(array_values($goodsTitles),JSON_UNESCAPED_UNICODE);
            $data['chartData'] = json_encode($chartData,JSON_UNESCAPED_UNICODE);

        }

        //科室商品库存表
        //申领
        $aInfo = Application::groupBy('goods_id','department_id')->selectRaw('goods_id,department_id,sum(quantity) as apply_quantity')->whereIn('goods_id',array_column($goods_info,'id'))->get()->toArray();

        //退还
        $rInfo = Reback::groupBy('goods_id','department_id')->selectRaw('goods_id,department_id,sum(quantity) as reback_quantity')->whereIn('goods_id',array_column($goods_info,'id'))->get()->toArray();

        $ksGoodsStock = [];
        if ($aInfo) {
            $ks_stock = [];
            foreach ($aInfo as $key => $value) {
                foreach ($rInfo as $k => $val) {
                    if ($value['goods_id'] == $val['goods_id'] && $value['department_id'] == $val['department_id']) {
                        $ks_stock[$key]['goods_id'] = $value['goods_id'];
                        $ks_stock[$key]['department'] = $value['department_id'];
                        $ks_stock[$key]['stock'] = $value['apply_quantity'] - $val['reback_quantity'];
                        break;
                    } else {
                        $ks_stock[$key]['goods_id'] = $value['goods_id'];
                        $ks_stock[$key]['department'] = $value['department_id'];
                        $ks_stock[$key]['stock'] = $value['apply_quantity'];
                    }
                }
            }

            $department = Hospital::all()->where('parent_id',session('hos_id'))->toArray();
            foreach ($department as $key => $value) {
                foreach ($ks_stock as $k => $val) {
                    if ($value['id'] == $val['department']) {
                        $ks_stock[$k]['department_name'] = $value['title'];
                    }
                }
            }
            foreach ($goods_info as $key => $value) {
                foreach ($ks_stock as $k => $val) {
                    if ($value['id'] == $val['goods_id']) {
                        $ks_stock[$k]['goods_name'] = $value['name'];
                    }
                }
            }

            $ksGoodsTitles = [];
            foreach ($ks_stock as $key => $value) {
                $ksGoodsTitles[$value['goods_id']] = $value['goods_name'];
            }

            foreach ($ks_stock as $key => $value) {
                $ksGoodsStock[$value['department']]['name'] = $value['department_name'];
                $ksGoodsStock[$value['department']]['data'][$value['goods_id']] = intval($value['stock']);
            }

            $goods_id_arr = array_keys($ksGoodsTitles);
            foreach ($ksGoodsStock as $key => $value) {
                $diff_arr = array_diff($goods_id_arr,array_keys($value['data']));
                if ($diff_arr) {
                    foreach ($diff_arr as $index) {
                        $ksGoodsStock[$key]['data'][$index] = 0;
                    }
                }
                ksort($ksGoodsStock[$key]['data']);
            }

            foreach ($ksGoodsStock as $key => $value) {
                $ksGoodsStock[$key]['data'] = array_values($value['data']);
            }

            $data['ksGoodsTitles']  = json_encode(array_values($ksGoodsTitles),JSON_UNESCAPED_UNICODE);
            $data['ksGoodsStock'] = json_encode(array_values($ksGoodsStock),JSON_UNESCAPED_UNICODE);
        }

        //库存日志
        $logInfo = StockLog::all()->whereIn('goods_id',array_column($goods_info,'id'))->sortByDesc('add_time')->take(10)->toArray();

        //添加商品名
        foreach ($logInfo as $key => $value) {
            foreach ($goods_info as $k => $val) {
                if ($value['goods_id'] == $val['id']) {
                    $logInfo[$key]['goods_name'] = $val['name'];
                }
            }
        }

        //添加用操作用户
        $uids = [];
        $userInfo = [];
        foreach (array_keys(session('departments')) as $value) {
            $uids[] = Hospital::findOrFail($value)->users->pluck('name','id')->toArray();
        }
        foreach ($uids as $key => $value) {
            foreach ($value as $k => $val) {
                $userInfo[$k] = $val;
            }
        }
        foreach ($logInfo as $key => $value) {
            foreach ($userInfo as $k => $val) {
                if ($value['uid'] == $k) {
                    $logInfo[$key]['admin_name'] = $val;
                }
            }
        }
        $data['logInfo'] = $logInfo;

        return view('admin::dashboard.general',$data);
    }
}
