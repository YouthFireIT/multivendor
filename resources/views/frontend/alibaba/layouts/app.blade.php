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
    <link type="text/css" href="{{ my_asset('frontend/css/sweetalert2.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
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
    <style>

    </style>
<link type="text/css" href="{{ my_asset('frontend/css/main.css') }}" rel="stylesheet" media="all">
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
        <script src="{{ my_asset('frontend/js/sweetalert2.min.js') }}"></script>
         
        <script src="{{ asset('alibaba') }}/js/jquery.simple.timer.js"></script>
        <script src="{{ asset('alibaba') }}/js/main.js"></script>
        

        <script>
            function showFrontendAlert(type, message){
                if(type == 'danger'){
                    type = 'error';
                }
                swal({
                    position: 'top-end',
                    type: type,
                    title: message,
                    showConfirmButton: false,
                    timer: 3000
                });
            }
        </script>
        
        @foreach (session('flash_notification', collect())->toArray() as $message)
            <script>
                showFrontendAlert('{{ $message['level'] }}', '{{ $message['message'] }}');
            </script>
        @endforeach
     
        <script>
            $('#search').on('keyup', function(){
                search();
            });

            $('#search').on('focus', function(){
                search();
            });

            function search(){
                var search = $('#search').val();
                if(search.length > 0){
                    $('body').addClass("typed-search-box-shown");

                    $('.typed-search-box').removeClass('d-none');
                    $('.search-preloader').removeClass('d-none');
                    $.post('{{ route('search.ajax') }}', { _token: '{{ @csrf_token() }}', search:search}, function(data){
                        if(data == '0'){
                            // $('.typed-search-box').addClass('d-none');
                            $('#search-content').html(null);
                            $('.typed-search-box .search-nothing').removeClass('d-none').html('Sorry, nothing found for <strong>"'+search+'"</strong>');
                            $('.search-preloader').addClass('d-none');

                        }
                        else{
                            $('.typed-search-box .search-nothing').addClass('d-none').html(null);
                            $('#search-content').html(data);
                            $('.search-preloader').addClass('d-none');
                        }
                    });
                }
                else {
                    $('.typed-search-box').addClass('d-none');
                    $('body').removeClass("typed-search-box-shown");
                }
            }
        </script>

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
