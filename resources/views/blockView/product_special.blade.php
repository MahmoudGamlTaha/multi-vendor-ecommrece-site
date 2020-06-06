  @php
    $products_special = (new \App\Models\ShopProduct)->getProductsSpecial($limit = 1, $random = true)
  @endphp
  @if (!empty($products_special))
              <div class="brands_products"><!--product special-->
                <h2>{{ trans('language.products_special') }}</h2>
                <div class="products-name">
                  <ul class="nav nav-pills nav-stacked">
                    @foreach ($products_special as $key => $product_special)
                      <li>
                        <div class="product-image-wrapper product-single">
                          <div class="single-products product-box-{{ $key }}">
                              <div class="productinfo text-center">
                                <a href="{{ $product_special->product->getUrl() }}"><img src="{{ asset($product_special->product->getThumb()) }}" alt="{{ $product_special->product->name }}" /></a>
                                {!! $product_special->product->showPrice() !!}
                                <a href="{{ $product_special->product->getUrl() }}"><p>{{ $product_special->product->name }}</p></a>
                              </div>
                          @if ($product_special->product->price != $product_special->product->getPrice())
                          <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                          @elseif($product_special->product->type == 1)
                          <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                          @endif
                          </div>
                        </div>
                      </li>
                    @endforeach
                  </ul>
                </div>
              </div><!--/product special-->
  @endif
