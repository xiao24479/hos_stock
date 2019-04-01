<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\Dashboard;
use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->header('仪表盘')
            ->description('控制面板')
            ->row(Dashboard::generalData())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                   // $column->append(Dashboard::environment());
                });

                $row->column(4, function (Column $column) {
                   // $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    //$column->append(Dashboard::dependencies());
                });
            });
    }
}
