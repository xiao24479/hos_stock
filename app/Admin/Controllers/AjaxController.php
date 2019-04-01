<?php

namespace App\Admin\Controllers;

use App\Hospital;
use App\Http\Controllers\Controller;
use App\User;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AjaxController extends Controller
{
    public function switchHos(Request $request)
    {
        if (!$request->ajax()){
            $responseAjax = [
                'ret' => 400,
                'data' => '',
                'msg'  => 'invalid request'
            ];
            return response()->json($responseAjax);
        }

        $hid = intval($request->input('hid'));
        $uid = Admin::user()->id;
        $parent_hos = Hospital::findOrFail($hid);
        $allDepartments = User::findOrFail($uid)->hospitals()->where('is_show',1)->get()->pluck('id')->toArray();
        $departments = Hospital::where('parent_id',$hid)->get()->pluck('id')->toArray();
        $curDepartments = array_values(array_intersect($allDepartments,$departments));

        $curDepartmentLists = Hospital::findOrFail($curDepartments)->where('is_show',1)->pluck('title','id')->toArray();

        //设置session
        Session::put('hos_id',$hid);
        Session::put('hos_name',$parent_hos['title']);
        Session::put('departments',$curDepartmentLists);

        $responseAjax = [
            'ret' => 200,
            'data' => $parent_hos,
            'msg'  => 'success!'
        ];
        return response()->json($responseAjax);


    }
}
