<?php

namespace App\Http\Middleware;

use App\Hospital;
use App\User;
use Closure;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Session;

class RefreshSession
{
    /**
     * 如果后台修改了医院科室权限，通过刷新页面更新session;
     * 根据用户所属医院科室session与数据库结果比较，是否更新
     *
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if (!Admin::user() && $this->shouldPassThrough($request)) {
            return $next($request);
        }

        $uid = Admin::user()->id;

        $sess_hid =  Session::get('hos_id');
        $sess_did = Session::get('departments');
        //获取该用户所属所有医院
        $hids = User::findOrFail($uid)->hospitals()->where('is_show',1)->get()->pluck('parent_id')->toArray();

        //如果当前医院的sessionID不在查出的数据里面，获取第一个值
        //保证用户必须至少属于一家医院
        if (!in_array($sess_hid,$hids)) {
            //获取第一个科室ID
            $dep_id = User::findOrFail($uid)->hospitals()->where('is_show',1)->first()->id;
            //获取医院ID
            $hid = Hospital::findOrFail($dep_id)->parent_id;
            //获取医院名
            $hospital = Hospital::findOrFail($hid)->title;
            //获取该用户所属所有科室ID
            $allDepartments = User::findOrFail($uid)->hospitals()->where('is_show',1)->get()->pluck('id')->toArray();
            //获取该用户所属$hid医院的所有科室ID
            $departments = Hospital::all()->where('parent_id',$hid)->pluck('id')->toArray();
            //获取上面两数组交集，就是该用户所拥有的医院科室权限
            $curDepartments = array_values(array_intersect($allDepartments,$departments));
            $curDepartmentLists = Hospital::findOrFail($curDepartments)->where('is_show',1)->pluck('title','id')->toArray();
            //设置session
            Session::put('hos_id',$hid);
            Session::put('hos_name',$hospital);
            Session::put('departments',$curDepartmentLists);
        } else {
            //获取该用户所属$sess_hid医院的所有科室ID
            $departments = Hospital::all()->where('parent_id',$sess_hid)->pluck('id')->toArray();
            //获取该用户所属所有科室ID
            $allDepartments = User::findOrFail($uid)->hospitals()->where('is_show',1)->get()->pluck('id')->toArray();
            //获取上面两数组交集，就是该用户所拥有的医院科室权限
            $curDepartments = array_values(array_intersect($allDepartments,$departments));
            $curDepartmentLists = Hospital::findOrFail($curDepartments)->where('is_show',1)->pluck('title','id')->toArray();

            if (!array_diff($sess_did,$curDepartmentLists)) {
                //设置session
                Session::put('departments',$curDepartmentLists);
            }
        }

        return $next($request);
    }

    protected function shouldPassThrough($request)
    {
        $excepts = [
            admin_base_path('auth/login'),
            admin_base_path('auth/logout'),
        ];

        foreach ($excepts as $except) {
            if ($except !== '/') {
                $except = trim($except, '/');
            }

            if ($request->is($except)) {
                return true;
            }
        }

        return false;
    }
}
