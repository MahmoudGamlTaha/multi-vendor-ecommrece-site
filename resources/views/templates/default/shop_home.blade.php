@extends($theme.'.shop_layout')

@section('center')
          <!-- sprint 3-->
          <div class="features_items"><!--features_items-->
            <h2 class="title text-center">{{ trans('language.features_items') }}</h2>
           
                @foreach ($products_new as  $key => $product_new)
                @if ($key % 4 == 0)
                  <div class="item {{($key == 0)?'active':''}}">
                @endif
          
                  <div class="col-sm-2">
                    <div class="product-image-wrapper product-single">
                      <div class="single-products product-box-{{ $product_new->id }}">
                          <div class="productinfo text-center">
                            <a href="{{ $product_new->getUrl() }}"><img src="{{ asset($product_new->getThumb()) }}" alt="{{ $product_new->name }}" /></a>
                            {!! $product_new->showPrice() !!}
                            <a href="{{ $product_new->getUrl() }}"><p>{{ $product_new->name }}</p></a>
                            <a class="btn btn-default add-to-cart" onClick="addToCart('{{ $product_new->id }}','default',$(this))"><i class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a>
                          </div>
                      @if ($product_new->price > $product_new->getPrice())
                      <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                      @elseif($product_new->type == 1)
                      <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                      @endif
                      </div>
                      <div class="choose">
                        <ul class="nav nav-pills nav-justified">
                          <li><a onClick="addToCart('{{ $product_new->id }}','wishlist',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_wishlist')}}</a></li>
                          <li><a onClick="addToCart('{{ $product_new->id }}','compare',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_compare')}}</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  @if($key % 4 == 1 && $key > 4)
                  <div class="col-sm">
                      <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" alt="{{$key}}"></img>
                   </div>
                  </div>
                  @php
                  continue;
                  @endphp
                  @endif
                  @if ($key % 4 == 3)
                  <div class="col-sm">
                      <img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt="{{$key}}"></img>
                   </div>
                  </div>
                @endif
              
               @endforeach
         
          </div><!--features_items-->

          <div class="recommended_items"><!--recommended_items-->
            <h2 class="title text-center">{{ trans('language.products_hot') }}</h2>

            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                @foreach ($products_hot as  $key => $product_hot)
                @if ($key % 3 == 0)
                  <div class="item {{  ($key ==0)?'active':'' }}">
                @endif
                  <div class="col-sm-2">
                    <div class="product-image-wrapper product-single">
                      <div class="single-products   product-box-{{ $product_hot->id }}">
                          <div class="productinfo text-center">
                            <a href="{{ $product_hot->getUrl() }}"><img src="{{ asset($product_hot->getThumb()) }}" alt="{{ $product_hot->name }}" /></a>
                            {!! $product_hot->showPrice() !!}
                            <a href="{{ $product_hot->getUrl() }}"><p>{{ $product_hot->name }}</p></a>
                            <a class="btn btn-default add-to-cart" onClick="addToCart('{{ $product_hot->id }}','default',$(this))"><i class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a>
                          </div>
                          @if ($product_hot->price != $product_hot->getPrice())
                          <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                          @elseif($product_hot->type == 1)
                          <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                          @endif
                      </div>
                      <div class="choose">
                        <ul class="nav nav-pills nav-justified">
                          <li><a onClick="addToCart('{{ $product_hot->id }}','wishlist',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_wishlist')}}</a></li>
                          <li><a onClick="addToCart('{{ $product_hot->id }}','compare',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_compare')}}</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                @if ($key % 3 == 2 || $key+1 == $products_hot->count())
                  </div>
                @endif
               @endforeach

              </div>
               <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                <i class="fa fa-angle-right"></i>
                </a>
                <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                <i class="fa fa-angle-left"></i>
                </a>
            </div>
          </div><!--/recommended_items-->

          <div class="category-tab"><!--category-tab-->
            <div class="col-sm-12">
              <ul class="nav nav-tabs">
                @foreach ($categories[0] as $key => $category)
                  <li {{ ($key ==0)?'class="active"':'' }}><a href="#cate{{ $key }}" data-toggle="tab">{{ $category->name }}</a></li>
                @endforeach
              </ul>
            </div>
            <div class="tab-content">
              @foreach ($categories[0] as $key => $category)
                <div class="tab-pane fade {{ ($key ==0)?'active in':'' }}" id="cate{{ $key }}" >
                  @foreach ($category->getProductsToCategory($category->id,4) as $product)
                    <div class="col-sm-2">
                      <div class="product-image-wrapper product-single">
                        <div class="single-products  product-box-{{ $product->id }}">
                          <div class="productinfo text-center">
                            <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}" alt="{{ $product->name }}" /></a>
                            {!! $product->showPrice() !!}
                            <a href="{{ $product->getUrl() }}"><p>{{ $product->name }}</p></a>
                            <a class="btn btn-default add-to-cart" onClick="addToCart('{{ $product->id }}','default',$(this))"><i class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a>
                          </div>
                          @if ($product->price != $product->getPrice())
                          <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                          @elseif($product->type == 1)
                          <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                          @endif

                        </div>
                      </div>
                    </div>
                  @endforeach
                </div>
              @endforeach
            </div>
          </div><!--/category-tab-->


@endsection



@push('styles')
@endpush

@push('scripts')

@endpush
