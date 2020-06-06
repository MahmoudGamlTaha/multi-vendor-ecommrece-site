@php
  $carts = \Helper::getListCart();
@endphp
<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{{ $description??'' }}">
    <meta name="keyword" content="{{ $keyword??'' }}">
  <!--  <meta property="fb:app_id" content="{{ $configsGlobal['site_fb_appID'] }}" /> sprint 1 --> 
    <title>{{$title??''}}</title>
    <meta property="og:image" content="{{ !empty($og_image)?$og_image:asset('images/org.jpg') }}" />
    <meta property="og:url" content="{{ \Request::fullUrl() }}" />
    <meta property="og:type" content="Website" />
    <meta property="og:title" content="{{ $title??'' }}" />
    <meta property="og:description" content="{{ $description??'' }}" />
<!--Module meta -->
  @isset ($layouts['meta'])
      @foreach ( $layouts['meta']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
          @if ($layout->page =='html')
            {{$layout->text }}
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module meta -->
    <link href="{{ asset($theme_asset.'/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{ asset($theme_asset.'/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{ asset($theme_asset.'/css/prettyPhoto.css')}}" rel="stylesheet">
    <link href="{{ asset($theme_asset.'/css/animate.css')}}" rel="stylesheet">
    <link href="{{ asset($theme_asset.'/css/main.css')}}" rel="stylesheet">
    <link href="{{ asset($theme_asset.'/css/responsive.css')}}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{ asset($theme_asset.'/js/html5shiv.js')}}"></script>
    <script src="{{ asset($theme_asset.'/js/respond.min.js')}}"></script>
    <![endif]-->
    <link rel="shortcut icon" href="{{ asset($theme_asset.'/images/ico/favicon.ico')}}">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{ asset($theme_asset.'/images/ico/apple-touch-icon-144-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{ asset($theme_asset.'/images/ico/apple-touch-icon-114-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{ asset($theme_asset.'/images/ico/apple-touch-icon-72-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" href="{{ asset($theme_asset.'/images/ico/apple-touch-icon-57-precomposed.png')}}">
<!--Module header -->
  @isset ($layouts['header'])
      @foreach ( $layouts['header']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
          @if ($layout->page =='html')
            {{$layout->text }}
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module header -->

</head><!--/head-->
<body>

@include($theme.'.header')

<!--Module banner -->
@isset ($layouts['banner_top'])
      @foreach ( $layouts['banner_top']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
          @if ($layout->type =='html')
            {!! $layout->text !!}
          @elseif($layout->type =='view')
            @if (view()->exists('blockView.'.$layout->text))
             @include('blockView.'.$layout->text)
            @endif
          @elseif($layout->type =='module')
            {!! (new $layout->text)->render() !!}
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module banner -->


@if ($configs['site_status'])

<!--Module top -->
  @isset ($layouts['top'])
      @foreach ( $layouts['top']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
          @if ($layout->type =='html')
            {!! $layout->text !!}
          @elseif($layout->type =='view')
            @if (view()->exists('blockView.'.$layout->text))
             @include('blockView.'.$layout->text)
            @endif
          @elseif($layout->type =='module')
            {!! (new $layout->text)->render() !!}
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module top -->


  <section>
    <div class="container">
      <div class="row">
        <div class="col-sm-12" id="breadcrumb">
          <!--breadcrumb-->
          @yield('breadcrumb')
          <!--//breadcrumb-->

          <!--//fillter-->
          @yield('filter')
          <!--//fillter-->
        </div>

        <!--body sprint 3-->
        @section('main')
          @include($theme.'.center')
          @include($theme.'.right')
        @show
        <!--//body-->

      </div>
    </div>
  </section>

@else
  <section>
    <div class="container">
      <div class="row">
        <div id="columns" class="container"  style="color:red;text-align: center;">
          <img src="{{ asset('images/maintenance.png') }}"><br>
          <h3><i class="fas fa-exclamation"></i>{{ trans('language.maintenance') }}</h3>
            <!-- /.col -->
        </div>
      </div>
    </div>
  </section>
@endif

@include($theme.'.footer')

<script src="{{ asset($theme_asset.'/js/jquery.js')}}"></script>
<script src="{{ asset($theme_asset.'/js/jquery-ui.min.js')}}"></script>
<script src="{{ asset($theme_asset.'/js/bootstrap.min.js')}}"></script>
<script src="{{ asset($theme_asset.'/js/jquery.scrollUp.min.js')}}"></script>
<script src="{{ asset($theme_asset.'/js/jquery.prettyPhoto.js')}}"></script>
<script src="{{ asset($theme_asset.'/js/main.js')}}"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js"></script>


@stack('scripts')

    <script type="text/javascript">
      function formatNumber (num) {
          return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
      }
      $('#shipping').change(function(){
          $('#total').html(formatNumber(parseInt({{ Cart::subtotal() }})+ parseInt($('#shipping').val())));
      });
    </script>

    <script type="text/javascript">
        function addToCart(id,instance = null,element = null){
        $.ajax({
            url: '{{ route('addToCart') }}',
            type: 'POST',
            dataType: 'json',
            data: {id: id,instance:instance, _token:'{{ csrf_token() }}'},
            async: false,
            success: function(data){
              // console.log(data);
                error= parseInt(data.error);
                if(error ==0)
                {
                //animate
                if(instance == null || instance =='' || instance =='default'){
                  var cart = $('#shopping-cart');
                }else{
                  var cart = $('#shopping-'+instance);
                }
                var imgtodrag = element.closest('.product-single').find("img").eq(0);
                if (imgtodrag) {
                    var imgclone = imgtodrag.clone()
                        .offset({
                        top: imgtodrag.offset().top,
                        left: imgtodrag.offset().left
                    })
                        .css({
                        'opacity': '0.5',
                            'position': 'absolute',
                            'width': '150px',
                            'z-index': '9999'
                    })
                        .appendTo($('body'))
                        .animate({
                        'top': cart.offset().top,
                            'left': cart.offset().left,
                            'width': 75,
                            'height': 75
                    });
                    imgclone.animate({
                        'width': 0,
                            'height': 0
                    }, function () {
                        $(this).detach()
                    });
                }
                //End animate
                  setTimeout(function () {
                    if(data.instance =='default'){
                      $('.shopping-cart').html(data.count_cart);
                      // $('.shopping-cart-subtotal').html(data.subtotal);
                      // $('#shopping-cart-show').html(data.html);
                    }else{
                      $('.shopping-'+data.instance).html(data.count_cart);
                    }
                  }, 1000);

                    $.notify({
                      icon: 'glyphicon glyphicon-star',
                      message: data.msg
                    },{
                      type: 'success'
                    });
                // $('#cart-alert').html('<div class="cart-alert alert alert-success">'+data.msg+'</div>').fadeIn(100).delay(2000).fadeOut('slow');
                }else{
                  $.notify({
                  icon: 'glyphicon glyphicon-warning-sign',
                    message: data.msg
                  },{
                    type: 'danger'
                  });
                  // $('#cart-alert').html('<div class="cart-alert alert alert-danger">'+data.msg+'</div>').fadeIn(100).delay(2000).fadeOut('slow');
                }

                }
        });
    }
</script>

<!--message-->
    @if(Session::has('message'))
    <script type="text/javascript">
        $.notify({
          icon: 'glyphicon glyphicon-star',
          message: "{!! Session::get('message') !!}"
        },{
          type: 'success'
        });
    </script>
    @endif
    @if(Session::has('error'))
    <script type="text/javascript">
        $.notify({
        icon: 'glyphicon glyphicon-warning-sign',
          message: "{!! Session::get('error') !!}"
        },{
          type: 'danger'
        });
    </script>
    @endif
    @if(Session::has('warning'))
    <script type="text/javascript">
        $.notify({
        icon: 'glyphicon glyphicon-warning-sign',
          message: "{!! Session::get('warning') !!}"
        },{
          type: 'warning'
        });
    </script>
    @endif
<!--//message-->


<!--Module bottom -->
  @isset ($layouts['bottom'])
      @foreach ( $layouts['bottom']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
          @if ($layout->type =='html')
            {!! $layout->text !!}
          @elseif($layout->type =='view')
            @if (view()->exists('blockView.'.$layout->text))
             @include('blockView.'.$layout->text)
            @endif
          @elseif($layout->type =='module')
            {!! (new $layout->text)->render() !!}
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module bottom -->

</body>
</html>
