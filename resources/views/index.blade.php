<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>{{ Admin::title() }} @if($header) | {{ $header }}@endif</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    {!! Admin::css() !!}
    <style>
        @media (max-width: 767px){
            .skin-blue-light .main-header .navbar .dropdown-menu li a {
                color: #777;
            }

            .skin-blue-light .main-header .navbar .dropdown-menu>.active>a, .skin-blue-light .main-header .navbar .dropdown-menu>.active>a:focus, .skin-blue-light .main-header .navbar .dropdown-menu>.active>a:hover {
                color: #fff;
            }

        }
        .dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover {
            color: #fff;
            text-decoration: none;
            background-color: #337ab7;
            outline: 0;
        }
        .dropdown-menu>li>a {
            display: block;
            padding: 3px 20px;
            clear: both;
            font-weight: 400;
            line-height: 1.42857143;
            color: #777;
            white-space: nowrap;
        }

    </style>

    <script src="{{ Admin::jQuery() }}"></script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="hold-transition {{config('admin.skin')}} {{join(' ', config('admin.layout'))}}">
<div class="wrapper">

    @include('admin::partials.header')

    @include('admin::partials.sidebar')

    <div class="content-wrapper" id="pjax-container">
        <div id="app">
        @yield('content')
        </div>
        {!! Admin::script() !!}
    </div>

    @include('admin::partials.footer')

</div>

<script>
    function LA() {}
    LA.token = "{{ csrf_token() }}";
    LA.switchHosAjaxUrl = "{{route('switchHos')}}";
</script>

<!-- REQUIRED JS SCRIPTS -->
{!! Admin::js() !!}

<script src="{{asset('js/global.js')}}"></script>
</body>
</html>
