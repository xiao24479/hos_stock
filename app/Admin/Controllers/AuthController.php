<?php

namespace App\Admin\Controllers;

use App\Hospital;
use App\User;
use Encore\Admin\Controllers\AuthController as BaseAuthController;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;


class AuthController extends BaseAuthController
{

    /**
     * 处理登录请求.
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function postLogin(Request $request)
    {
        $validateData = $request->only([$this->username(), 'password','captcha']);
        $credentials = $request->only([$this->username(), 'password']);

        /** @var \Illuminate\Validation\Validator $validator */
        $validator = Validator::make($validateData, [
            $this->username()   => 'required',
            'password'          => 'required',
            'captcha'          => 'required|captcha',
        ]);

        if ($validator->fails()) {
            return back()->withInput()->withErrors($validator);
        }

        if ($this->guard()->attempt($credentials)) {
            return $this->sendLoginResponse($request);
        }

        return back()->withInput()->withErrors([
            $this->username() => $this->getFailedLoginMessage(),
        ]);
    }

    /**
     * 登录成功后设置
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    protected function sendLoginResponse(Request $request)
    {
        admin_toastr(trans('admin.login_successful'));
        $request->session()->regenerate();

        //取第一家医院和所属科室
        $uid = Admin::user()->id;
        $hospital = User::findOrFail($uid)->hospitals()->where('is_show',1)->first();
        $parent_hos = Hospital::findOrFail($hospital['parent_id']);
        $allDepartments = User::findOrFail($uid)->hospitals()->where('is_show',1)->get()->pluck('id')->toArray();
        $departments = Hospital::where('parent_id',$parent_hos['id'])->get()->pluck('id')->toArray();
        $curDepartments = array_values(array_intersect($allDepartments,$departments));

        $curDepartmentLists = Hospital::findOrFail($curDepartments)->where('is_show',1)->pluck('title','id')->toArray();
        //设置session
        Session::put('hos_id',$parent_hos['id']);
        Session::put('hos_name',$parent_hos['title']);
        Session::put('departments',$curDepartmentLists);

        //dd(\Session::all());
        return redirect()->intended($this->redirectPath());
    }



}
