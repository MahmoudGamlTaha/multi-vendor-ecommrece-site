  <header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <div class="contactinfo">
              <ul class="nav nav-pills">
                <li><a href="#"><i class="fa fa-phone"></i> {{ $configsGlobal['phone'] }}</a></li>
                <li><a href="#"><i class="fa fa-envelope"></i> {{ $configsGlobal['email'] }}</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="btn-group pull-right">
              <div class="btn-group locale">
                @if (count($languages)>1)
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown"><img src="{{ asset($path_file.'/'.$languages[app()->getLocale()]['icon']) }}" style="height: 25px;">
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  @foreach ($languages as $key => $language)
                    <li><a href="{{ url('locale/'.$key) }}"><img src="{{ asset($path_file.'/'.$language['icon']) }}" style="height: 25px;"></a></li>
                  @endforeach
                </ul>
                @endif
              </div>
              @if (count($currencies)>1)
               <div class="btn-group locale">
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                  {{ \Helper::getCurrency()['name'] }}
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  @foreach ($currencies as $key => $currency)
                    <li><a href="{{ url('currency/'.$currency->code) }}">{{ $currency->name }}</a></li>
                  @endforeach
                </ul>
              </div>
              @endif
            </div>
          </div>
        </div>
      </div>
    </div><!--/header_top-->
    <div class="header-middle"><!--header-middle-->
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="logo pull-left">
              <a href="{{ route('home') }}"><img style="width: 150px;" src="{{ asset($logo) }}" alt="" /></a>
            </div>
          </div>
          <div class="col-sm-8">
            <div class="shop-menu pull-right">
			
              <ul class="nav navbar-nav">

                <li><a href="{{ route('wishlist') }}"><span  class="cart-qty  shopping-wishlist" id="shopping-wishlist">{{ Cart::instance('wishlist')->count() }}</span><i class="fa fa-star"></i> {{ trans('language.wishlist') }}</a></li>
                <li><a href="{{ route('compare') }}"><span  class="cart-qty shopping-compare" id="shopping-compare">{{ Cart::instance('compare')->count() }}</span><i class="fa fa-crosshairs"></i> {{ trans('language.compare') }}</a></li>
                <li><a href="{{ route('cart') }}"><span class="cart-qty shopping-cart" id="shopping-cart">{{ $carts['count'] }}</span><i class="fa fa-shopping-cart"></i> {{ trans('language.cart_title') }}</a>
                </li>
                @guest
                <li><a href="{{ route('login') }}"><i class="fa fa-lock"></i> {{ trans('language.login') }}</a></li>
                @else
                <li><a href="{{ route('profile') }}"><i class="fa fa-user"></i> {{ trans('language.account') }}</a></li>
                <li><a href="{{ route('logout') }}" rel="nofollow" onclick="event.preventDefault();
                   document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i> {{ trans('language.logout') }}</a></li>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
                </form>
                @endguest

              </ul>
            </div>
          </div>
        </div>
      </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
      <div class="container">
        <div class="row">
          <div class="col-sm-9">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div class="mainmenu pull-left">
			
			
              <ul class="nav navbar-nav collapse navbar-collapse">
                <li><a href="{{ route('home') }}" class="active">{{ trans('language.home') }}</a></li>
                <li class="dropdown"><a href="#">{{ trans('language.shop') }}<i class="fa fa-angle-down"></i></a>
                    <ul role="menu" class="sub-menu">
                        @foreach($Activities as $activity)
                        <li> <a href="#">{{$activity->type}}</a></li>
                        @endforeach
						@foreach($Companies as $company)
                        <li> <a href="#">{{$company->name}}</a></li>
                        @endforeach
                        <li><a href="{{ route('products') }}">{{ trans('language.all_product') }}</a></li> 
                 <!--       <li><a href="{{ route('cart') }}">{{ trans('language.cart_title') }}</a></li>-->
                        <li><a href="{{ route('brands') }}">{{ trans('language.brands') }}</a></li>
                        <li><a href="{{ route('vendors') }}">{{ trans('language.vendors') }}</a></li>
                    </ul>
                </li>
                <li><a href="{{ route('categories') }}">{{ trans('language.categories') }}</a></li>
                <li><a href="{{ route('compare') }}">{{ trans('language.compare') }}</a></li>   
                @if (!empty($configs['News']))
                <li><a href="{{ route('news') }}">{{ trans('language.blog') }}</a></li>
                @endif

                @if (!empty($configs['Content']))
                <li class="dropdown"><a href="#">{{ trans('language.cms_category') }}<i class="fa fa-angle-down"></i></a>
                    <ul role="menu" class="sub-menu">
                      @php
                        $cmsCategories = (new \App\Modules\Cms\Models\CmsCategory)->where('status',1)->get();
                      @endphp
                      @foreach ($cmsCategories as $cmsCategory)
                        <li><a href="{{ $cmsCategory->getUrl() }}">{{ $cmsCategory->title }}</a></li>
                      @endforeach
                    </ul>
                </li>
                @endif

                  @if (!empty($layoutsUrl['menu']))
                    @foreach ($layoutsUrl['menu'] as $url)
                      <li><a {{ ($url->target =='_blank')?'target=_blank':''  }} href="{{ url($url->url) }}">{{ trans($url->name) }}</a></li>
                    @endforeach
                  @endif
              </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="search_box pull-right">
              <form id="searchbox" method="get" action="{{ route('search') }}" >
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="{{ trans('language.search_form.keyword') }}..." name="keyword">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div><!--/header-bottom-->
  </header><!--/header-->
