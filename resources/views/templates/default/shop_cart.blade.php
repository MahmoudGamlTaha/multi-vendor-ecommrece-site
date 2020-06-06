@extends($theme.'.shop_layout')

@section('main')
<section>
    <div class="container">
      <div class="row">
<h2 class="title text-center">{{ $title }}</h2>
@if (count($cart) ==0)
    <div class="col-md-12 text-danger">
        Cart empty!
    </div>
@else
    <style>
    .shipping_address td{
        padding: 3px !important;
    }
    .shipping_address textarea,.shipping_address input[type="text"]{
        width: 100%;
        padding: 7px !important;
    }
    .row_cart>td{
        vertical-align: middle !important;
    }
    input[type="number"]{
        text-align: center;
        padding:2px;
    }
</style>
<div class="table-responsive">
<table class="table box table-bordered">
    <thead>
      <tr  style="background: #eaebec">
        <th style="width: 50px;">No.</th>
        <th style="width: 100px;">{{ trans('language.product.sku') }}</th>
        <th>{{ trans('language.product.name') }}</th>
        <th>{{ trans('language.product.price') }}</th>
        <th >{{ trans('language.product.quantity') }}</th>
        <th>{{ trans('language.product.total_price') }}</th>
        <th>{{ trans('language.cart.delete') }}</th>
      </tr>
    </thead>
    <tbody>

    @foreach($cart as $item)
        @php
            $n = (isset($n)?$n:0);
            $n++;
            $product = App\Models\ShopProduct::find($item->id);
        @endphp
    <tr class="row_cart">
        <td >{{ $n }}</td>
        <td>{{ $product->sku }}</td>
        <td>
            {{ $product->getName() }}<br>
{{-- Process attributes --}}
            @if ($item->options->att)
            (
                @foreach ($item->options->att as $keyAtt => $att)
                    <b>{{ $attributesGroup[$keyAtt]['name'] }}</b>: <i>{{ $att }}</i> ;
                @endforeach
            )<br>
            @endif
{{-- //end Process attributes --}}
            <a href="{{$product->getUrl() }}"><img width="100" src="{{asset($product->getImage())}}" alt=""></a>
        </td>
        <td>{!! $product->showPrice() !!}</td>
        <td><input style="width: 70px;" type="number" onChange="updateCart('{{$item->rowId}}',{{ $item->id }});" class="item-qty" id="item-{{$item->id}}" name="qty-{{$item->id}}" value="{{$item->qty}}"><span class="text-danger item-qty-{{$item->id}}" style="display: none;"></span></td>
        <td align="right">{{\Helper::currencyRender($item->subtotal)}}</td>
        <td>
            <a onClick="return confirm('Confirm?')" title="Remove Item" alt="Remove Item" class="cart_quantity_delete" href="{{route("removeItem",['id'=>$item->rowId])}}"><i class="fa fa-times"></i></a>
        </td>
    </tr>
    @endforeach
    </tbody>
    <tfoot>
        <tr  style="background: #eaebec">
            <td colspan="7">
                 <div class="pull-left">
                <button class="btn btn-default" type="button" style="cursor: pointer;padding:10px 30px" onClick="location.href='{{ route('home') }}'"><i class="fa fa-arrow-left"></i>{{ trans('language.cart.back_to_shop') }}</button>
                </div>
                 <div class="pull-right">
                <a onClick="return confirm('Confirm ?')" href="{{route('clearCart')}}"><button class="btn" type="button" style="cursor: pointer;padding:10px 30px">{{ trans('language.cart.remove_all') }}</button></a>
                </div>
            </td>
        </tr>
    </tfoot>
  </table>
  </div>
<form class="shipping_address" id="form-order" role="form" method="POST" action="{{ route('processCart') }}">
<div class="row">
    <div class="col-md-6">
            {{ csrf_field() }}
            <table class="table  table-bordered table-responsive">
                <tr>
                    <td class="form-group{{ $errors->has('toname') ? ' has-error' : '' }}">
                        <label for="phone" class="control-label"><i class="fa fa-user"></i> {{ trans('language.cart.to_name') }}:</label> <input name="toname" type="text" placeholder="{{ trans('language.cart.to_name') }}" value="{{(old('toname'))?old('toname'):$shippingAddress['toname']}}">
                            @if($errors->has('toname'))
                                <span class="help-block">{{ $errors->first('toname') }}</span>
                            @endif
                        </td>
                    <td class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                        <label for="phone" class="control-label"><i class="fa fa-volume-control-phone"></i> {{ trans('language.cart.phone') }}:</label> <input name="phone" type="text" placeholder="{{ trans('language.cart.phone') }}" value="{{(old('phone'))?old('phone'):$shippingAddress['phone']}}">
                            @if($errors->has('phone'))
                                <span class="help-block">{{ $errors->first('phone') }}</span>
                            @endif
                        </td>
                </tr>
                <tr>
                    <td colspan="2" class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                        <label for="email" class="control-label"><i class="fa fa-user"></i> {{ trans('language.cart.email') }}:</label> <input name="email" type="text" placeholder="{{ trans('language.cart.email') }}" value="{{(old('email'))?old('email'):$shippingAddress['email']}}">
                            @if($errors->has('email'))
                                <span class="help-block">{{ $errors->first('email') }}</span>
                            @endif
                    </td>

                </tr>

                <tr>
                    <td class="form-group{{ $errors->has('address1') ? ' has-error' : '' }}"><label for="address1" class="control-label"><i class="fa fa-home"></i> {{ trans('language.cart.address1') }}:</label> <input name="address1" type="text" placeholder="{{ trans('language.cart.address1') }}" value="{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}">
                            @if($errors->has('address1'))
                                <span class="help-block">{{ $errors->first('address1') }}</span>
                            @endif</td>
                    <td class="form-group{{ $errors->has('address2') ? ' has-error' : '' }}"><label for="address2" class="control-label"><i class="fa fa-university"></i> {{ trans('language.cart.address2') }}</label><input name="address2" type="text" placeholder="{{ trans('language.cart.address2') }}" value="{{ (old('address2'))?old('address2'):$shippingAddress['address2']}}">
                            @if($errors->has('address2'))
                                <span class="help-block">{{ $errors->first('address2') }}</span>
                            @endif</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label  class="control-label"><i class="fa fa-file-image-o"></i> {{ trans('language.cart.note') }}:</label>
                        <textarea rows="5" name="comment" placeholder="{{ trans('language.cart.note') }}....">{{ (old('comment'))?old('comment'):$shippingAddress['comment'] }}</textarea>
                    </td>

                </tr>
            </table>

    </div>
    <div class="col-md-6">



{{-- Total --}}
        <div class="row">
            <div class="col-md-12">
                <table class="table box table-bordered" id="showTotal">
                    @foreach ($dataTotal as $key => $element)
                    @if ($element['value'] !=0)

                     @if ($element['code']=='total')
                         <tr class="showTotal" style="background:#f5f3f3;font-weight: bold;">
                     @else
                        <tr class="showTotal">
                     @endif
                             <th>{!! $element['title'] !!}</th>
                            <td style="text-align: right" id="{{ $element['code'] }}">{{$element['text'] }}</td>
                        </tr>
                    @endif

                    @endforeach
                </table>

{{-- Coupon --}}
        @if ($extensionDiscount)
                <div class="row">
                  <div class="form-group col-md-6">
                    <label class="control-label" for="inputGroupSuccess3"><i class="fa fa-exchange" aria-hidden="true"></i> {{ trans('language.cart.coupon') }}
                        <span style="display:inline; cursor: pointer; display: {{ ($hasCoupon)?'inline':'none' }}" class="text-danger" id="removeCoupon">({{ trans('language.cart.remove_coupon') }} <i class="fa fa fa-times"></i>)</span>
                    </label>
                    <div id="coupon-group" class="input-group {{ Session::has('error_discount')?'has-error':'' }}">
                      <input type="text" {{ ($extensionDiscount['permission'])?'':'disabled' }} placeholder="Your coupon" class="form-control" id="coupon-value" aria-describedby="inputGroupSuccess3Status">
                      <span class="input-group-addon {{ ($extensionDiscount['permission'])?'':'disabled' }}"  {!! ($extensionDiscount['permission'])?'id="coupon-button"':'' !!} style="cursor: pointer;" data-loading-text="<i class='fa fa-spinner fa-spin'></i> checking">{{ trans('language.cart.apply') }}</span>
                    </div>
                    <span class="status-coupon" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    <div class="coupon-msg  {{ Session::has('error_discount')?'text-danger':'' }}" style="text-align: left;padding-left: 10px;">{{ Session::has('error_discount')?Session::get('error_discount'):'' }}</div>
                  </div>
              </div>
        @endif
{{-- //End coupon --}}


{{-- Shipping method --}}

        <div class="row">
            <div class="col-md-12">
                    <div class="form-group {{ $errors->has('shippingMethod') ? ' has-error' : '' }}">
                        <h3 class="control-label"><i class="fa fa-credit-card-alt"></i> {{ trans('language.cart.shipping_method') }}:<br></h3>
                        @if($errors->has('shippingMethod'))
                            <span class="help-block">{{ $errors->first('shippingMethod') }}</span>
                        @endif
                    </div>

                    <div class="form-group">
                        @foreach ($shippingMethod as $key => $shipping)
                            <div>
                                <label class="radio-inline">
                                 <input type="radio" name="shippingMethod" value="{{ $shipping['code'] }}"  {{ (old('shippingMethod') == $key)?'checked':'' }} style="position: relative;" {{ ($shipping['permission'])?'':'disabled' }}>
                                 {{ $shipping['title'] }} ({{ \Helper::currencyRender($shipping['value']) }})
                                </label>
                            </div>
                        @endforeach
                    </div>
            </div>
        </div>
{{-- //Shipping method --}}


{{-- Payment method --}}
        <div class="row">
            <div class="col-md-12">
                    <div class="form-group {{ $errors->has('paymentMethod') ? ' has-error' : '' }}">
                        <h3 class="control-label"><i class="fa fa-credit-card-alt"></i> {{ trans('language.cart.payment_method') }}:<br></h3>
                        @if($errors->has('paymentMethod'))
                            <span class="help-block">{{ $errors->first('paymentMethod') }}</span>
                        @endif
                    </div>
                    <div class="form-group">
                        @foreach ($paymentMethod as $key => $payment)
                            <div>
                                <label class="radio-inline">
                                 <input type="radio" name="paymentMethod" value="{{ $payment['code'] }}"  {{ (old('paymentMethod') == $key)?'checked':'' }} style="position: relative;" {{ ($payment['permission'])?'':'disabled' }}>
                                 <img title="{{ $payment['title'] }}" alt="{{ $payment['title'] }}" src="{{ asset($payment['image']) }}" style="width: 120px;">
                                </label>
                            </div>
                        @endforeach
                    </div>
            </div>
        </div>
{{-- //Payment method --}}
            </div>
        </div>
{{-- End total --}}


        <div class="row" style="padding-bottom: 20px;">
            <div class="col-md-12 text-center">
                    <div class="pull-right">
                        <button class="btn btn-success" id="submit-order" type="button" style="cursor: pointer;padding:10px 30px"><i class="fa fa-check"></i> {{ trans('language.cart.checkout') }}</button>
                    </div>
            </div>
        </div>



    </div>
</div>
</form>
@endif
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('scripts')
<script type="text/javascript">
    function updateCart(rowId,id){
        var new_qty = $('#item-'+id).val();
            $.ajax({
            url: '{{ route('updateToCart') }}',
            type: 'POST',
            dataType: 'json',
            async: true,
            cache: false,
            data: {
                id: id,
                rowId: rowId,
                new_qty: new_qty,
                _token:'{{ csrf_token() }}'},
            success: function(data){
                error= parseInt(data.error);
                if(error ===0)
                {
                        window.location.replace(location.href);
                }else{
                    $('.item-qty-'+id).css('display','block').html(data.msg);
                }

                }
        });
    }

$('#submit-order').click(function(){
    $('#form-order').submit();
    $(this).prop('disabled',true);
});

@if ($extensionDiscount)
    $('#coupon-button').click(function() {
     var coupon = $('#coupon-value').val();
        if(coupon==''){
            $('#coupon-group').addClass('has-error');
            $('.coupon-msg').html('{{ trans('language.cart.coupon_empty') }}').addClass('text-danger').show();
        }else{
        $('#coupon-button').button('loading');
        setTimeout(function() {
            $.ajax({
                url: '{{ route('useDiscount') }}',
                type: 'POST',
                dataType: 'json',
                data: {
                    code: coupon,
                    uID: {{ $uID }},
                    _token: "{{ csrf_token() }}",
                },
            })
            .done(function(result) {
                    $('#coupon-value').val('');
                    $('.coupon-msg').removeClass('text-danger');
                    $('.coupon-msg').removeClass('text-success');
                    $('#coupon-group').removeClass('has-error');
                    $('.coupon-msg').hide();
                if(result.error ==1){
                    $('#coupon-group').addClass('has-error');
                    $('.coupon-msg').html(result.msg).addClass('text-danger').show();
                }else{
                    $('#removeCoupon').show();
                    $('.coupon-msg').html(result.msg).addClass('text-success').show();
                    $('.showTotal').remove();
                    $('#showTotal').prepend(result.html);
                }
            })
            .fail(function() {
                console.log("error");
            })
           $('#coupon-button').button('reset');
       }, 2000);
        }

    });
    $('#removeCoupon').click(function() {
            $.ajax({
                url: '{{ route('removeDiscount') }}',
                type: 'POST',
                dataType: 'json',
                data: {
                    _token: "{{ csrf_token() }}",
                },
            })
            .done(function(result) {
                    $('#removeCoupon').hide();
                    $('#coupon-value').val('');
                    $('.coupon-msg').removeClass('text-danger');
                    $('.coupon-msg').removeClass('text-success');
                    $('.coupon-msg').hide();
                    $('.showTotal').remove();
                    $('#showTotal').prepend(result.html);
            })
            .fail(function() {
                console.log("error");
            })
            // .always(function() {
            //     console.log("complete");
            // });
    });
@endif

</script>
@endpush
