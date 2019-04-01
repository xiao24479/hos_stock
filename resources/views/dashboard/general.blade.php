<style>
    .justify{
        margin-left: -15px;
        margin-right: -15px;
        overflow: hidden;
        margin-bottom: 20px;
    }
    .info-box-text{
        font-size: 18px;
    }
</style>

<div class="justify">
    <div class="col-md-3 col-sm-6 col-xs-12">
        <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-money"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">采购成本</span>
                <span class="info-box-number"><small><i class="fa fa-yen"></i></small> {{$sumPurchaseAmount}}</span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <!-- /.col -->
</div>
@if(!empty($chartData))
<div class="justify">
    <div class="col-md-12">
        <script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
        <div id="container" style="min-width:320px;height:400px"></div>
        <script>
            var chart = Highcharts.chart('container',{
                chart: {
                    type: 'column'
                },
                title: {
                    text: '医院各商品总库存明细'
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: {!! $goodsTitles !!},
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '数量 (个)'
                    }
                },
                tooltip: {
                    // head + 每个 point + footer 拼接成完整的 table
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} 个</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        borderWidth: 0
                    }
                },
                series: {!! $chartData !!},
            });
        </script>

    </div>
</div>
@endif

@if(!empty($ksGoodsStock))
    <div class="justify">
        <div class="col-md-12">
            <script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
            <div id="container-ks" style="min-width:320px;height:400px"></div>
            <script>
                var chart = Highcharts.chart('container-ks',{
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '科室商品库存表'
                    },
                    subtitle: {
                        text: ''
                    },
                    xAxis: {
                        categories: {!! $ksGoodsTitles !!},
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '数量 (个)'
                        }
                    },
                    tooltip: {
                        // head + 每个 point + footer 拼接成完整的 table
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y} 个</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            borderWidth: 0
                        }
                    },
                    series: {!! $ksGoodsStock !!},
                });
            </script>

        </div>
    </div>
@endif

@if(!empty($logInfo))
<div class="justify">
    <div class="col-md-6 col-sm-6 col-xs-12">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">库存日志</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table class="table table-condensed table-bordered">
                    <thead>
                        <tr>
                            <th>时间</th>
                            <th>商品</th>
                            <th>内容</th>
                            <th>操作人</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($logInfo as $info)
                        <tr>
                            <td>{{$info['add_time']}}</td>
                            <td>{{$info['goods_name']}}</td>
                            <td>{{$info['content']}}</td>
                            <td>{{$info['admin_name']}}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
                <a href="{{route('stocklog')}}" target="_blank" class="uppercase">更多</a>
            </div>
            <!-- /.box-footer -->
        </div>
    </div>
</div>
@endif