<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>@yield('title')</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/style.css" type="text/css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/style.sproducts_page.css" type="text/css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/responsive.css" type="text/css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/flags.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/flaticons/flaticon.css">
    <!-- mega menu and banner -->
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/nicemenu.css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/theme-001.css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/style.menu.banner.css">
    <!-- mega menu and banner end -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="icon" href="{{ asset('alibaba') }}/images/icon.png" sizes="16x16">
    <!-- ======font awesome kit====== -->
    <!-- <link rel="stylesheet" href="css/fontawesome-free/css/all.css" /> -->
    <script src="https://kit.fontawesome.com/aca266facc.js" crossorigin="anonymous"></script>
    {{-- seller css --}}
    <link type="text/css" href="{{ my_asset('frontend/css/active-shop.css') }}" rel="stylesheet" media="all">


<link type="text/css" href="{{ my_asset('frontend/css/main.css') }}" rel="stylesheet" media="all">

@if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
     <!-- RTL -->
    <link type="text/css" href="{{ my_asset('frontend/css/active.rtl.css') }}" rel="stylesheet" media="all">
@endif

<!-- color theme -->
<link href="{{ my_asset('frontend/css/colors/'.\App\GeneralSetting::first()->frontend_color.'.css')}}" rel="stylesheet" media="all">

<!-- Custom style -->
<link type="text/css" href="{{ my_asset('frontend/css/custom-style.css') }}" rel="stylesheet" media="all">



<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet" media="none" onload="if(media!='all')media='all'">


<!-- Icons -->
<link rel="stylesheet" href="{{ my_asset('frontend/css/line-awesome.min.css') }}" type="text/css" media="none" onload="if(media!='all')media='all'">


<link type="text/css" href="{{ my_asset('frontend/css/jodit.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">




    <style>

    </style>

    @yield('custom_css')
</head>

<body>


     <!-- top banner img -->
     <div class="row">
        <div class="img_wrapper">
            <a href="#" class="">
                &nbsp;
            </a>
        </div>
    </div>

    <!-- top navigation bar -->
    @include('frontend.alibaba.inc.top_navbar')
    <!-- nav, megamenu & banner -->
    @include('frontend.alibaba.inc.sidemenu')

    @yield('content')

    @include('frontend.alibaba.inc.footer')

        <!-- =========bootstrap js framework========  -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="{{ asset('alibaba') }}/js/bootstrap.min.js"></script>
        <script src="{{ asset('alibaba') }}/js/jquery.flagstrap.js"></script>
        <script src="{{ asset('alibaba') }}/js/jquery.nicemenu.js"></script>
        <script src="{{ asset('alibaba') }}/js/owl.carousel.min.js"></script>
        <script src="{{ my_asset('frontend/js/jquery.countdown.min.js') }}"></script>
        <script src="{{ my_asset('frontend/js/active-shop.js') }}"></script>

        <script src="{{ asset('alibaba') }}/js/jquery.simple.timer.js"></script>
        <script src="{{ asset('alibaba') }}/js/main.js"></script>


        {{-- seller js --}}


<script src="{{ my_asset('frontend/js/select2.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/nouislider.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/sweetalert2.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/slick.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/jssocials.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/bootstrap-tagsinput.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/jodit.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/xzoom.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/fb-script.js') }}"></script>
<script src="{{ my_asset('frontend/js/lazysizes.min.js') }}"></script>
<script src="{{ my_asset('frontend/js/intlTelInput.min.js') }}"></script>

<!-- App JS -->
<script src="{{ my_asset('frontend/js/active-shop.js') }}"></script>
<script src="{{ my_asset('frontend/js/main.js') }}"></script>
        <script>
            $('.timer').startTimer({
                loop: true,
                loopInterval: 3,
                classNames: {
                    hours: 'myClass-hours',
                    minutes: 'myClass-minutes',
                    seconds: 'myClass-seconds',
                    clearDiv: 'myClass-clearDiv',
                    timeout: 'myClass-timeout'
                }
            });
        </script>

    @yield('customjs')

    </body>


    </html>