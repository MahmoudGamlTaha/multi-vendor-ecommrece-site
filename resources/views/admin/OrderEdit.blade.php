<style type="text/css">
    .table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td,.table>thead:first-child>tr:first-child>th {
    border: 1px solid #d0bcbc;
}
      .history{
        max-height: 50px;
        max-width: 300px;
        overflow-y: auto;
      }
.margin10{
  margin: 10px auto;
}
.td-title{
  width: 35%;
  font-weight: bold;
}
.td-title-normal{
  width: 35%;
}
</style>
<div class="container box">
    <div class="box-header with-border">
        <h3 class="box-title"><span class="glyphicon glyphicon-list-alt"></span> {{ trans('language.order.order_detail') }} #{{ $order->id }}</h3>
        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 10px">
                <a href="{{ URL::previous() }}" class="btn btn-sm btn-default"><i class="fa fa-list"></i>&nbsp;{{ trans('admin.list') }}</a>
            </div>
            <div class="btn-group pull-right" style="margin-right: 10px">
                <a class="btn btn-sm btn-default form-history-back"><i class="fa fa-arrow-left"></i>&nbsp;{{ trans('admin.back') }}</a>
            </div>
        </div>
    </div>
    <div>
      <div class="row">
        <div class="col-sm-6">
             <table class="table box table-bordered">
                <tr>
                  <td class="td-title">{{ trans('language.order.shipping_name') }}:</td><td><a href="#" class="updateInfoRequired" data-name="toname" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.shipping_name') }}" >{{ $order->toname }}</a></td>
                </tr>
                <tr>
                  <td class="td-title">{{ trans('language.order.shipping_phone') }}:</td><td><a href="#" class="updateInfoRequired" data-name="phone" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.shipping_phone') }}" >{{ $order->phone }}</a></td>
                </tr>
                <tr>
                  <td class="td-title">Email:</td><td>{{ empty($order->email)?'N/A':$order->email}}</td>
                </tr>
                <tr>
                  <td class="td-title">{{ trans('language.order.shipping_address1') }}:</td><td><a href="#" class="updateInfoRequired" data-name="address1" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("order_update") }}" data-title="Địa chỉ 1" >{{ $order->address1 }}</a></td>
                </tr>
                        <tr>
                  <td class="td-title">{{ trans('language.order.shipping_address2') }}:</td><td><a href="#" class="updateInfoRequired" data-name="address2" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("order_update") }}" data-title="Địa chỉ 2" >{{ $order->address2 }}</a></td>
                </tr>
            </table>
        </div>
        <div class="col-sm-6">
            <table  class="table table-bordered">
                <tr><td  class="td-title">{{ trans('language.order.order_status') }}:</td><td><a href="#" class="updateStatus" data-name="status" data-type="select" data-source ="{{ json_encode($statusOrder2) }}"  data-pk="{{ $order->id }}" data-value="{{ $order->status }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.order_status') }}">{{ $statusOrder[$order->status] }}</a></td></tr>
                <tr><td>{{ trans('language.order.order_shipping_status') }}:</td><td><a href="#" class="updateStatus" data-name="shipping_status" data-type="select" data-source ="{{ json_encode($statusShipping2) }}"  data-pk="{{ $order->id }}" data-value="{{ $order->shipping_status }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.order_shipping_status') }}">{{ $statusShipping[$order->shipping_status] }}</a></td></tr>
                <tr><td>{{ trans('language.order.payment_method') }}:</td><td><a href="#" class="updateStatus" data-name="payment_method" data-type="select" data-source ="{{ json_encode($paymentMethod) }}"  data-pk="{{ $order->id }}" data-value="{{ $order->payment_method }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.payment_method') }}">{{ $order->payment_method }}</a></td></tr>
              </table>
             <table class="table box table-bordered">
                <tr>
                  <td class="td-title">{{ trans('language.order.currency') }}:</td><td>{{ $order->currency }}</td>
                </tr>
                <tr>
                  <td class="td-title">{{ trans('language.order.exchange_rate') }}:</td><td>{{ ($order->exchange_rate)??1 }}</td>
                </tr>
            </table>
        </div>

      </div>

    </div>
@php
    if($order->balance == 0){
        $style = 'style="color:#0e9e33;font-weight:bold;"';
    }else
        if($order->balance < 0){
        $style = 'style="color:#ff2f00;font-weight:bold;"';
    }else{
        $style = 'style="font-weight:bold;"';
    }
@endphp
  <div class="row">
    <div class="col-sm-6">
      <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
              <tr>
                <th style="width: 100px;">{{ trans('language.product.sku') }}</th>
                <th>{{ trans('language.product.name') }}</th>
                <th>{{ trans('language.product.price') }}</th>
                <th style="width: 100px;">{{ trans('language.product.quantity') }}</th>
                <th>{{ trans('language.product.total_price') }}</th>
                <th>{{ trans('admin.action') }}</th>
              </tr>
            </thead>
            <tbody>
                @foreach ($order->details as $item)
                      <tr>
                        <span style="display: none;"  class="item_{{ $item->id }}_id">{{ $item->id }}</span>
                        <td><span class="item_{{ $item->id }}_sku">{{ $item->sku }}</span></td>
                        <td><span class="item_{{ $item->id }}_name">{{ $item->name }}
                          @php
                          $html = '';
                            if($item->attribute && is_array(json_decode($item->attribute,true))){
                              $array = json_decode($item->attribute,true);
                                  foreach ($array as $key => $element){
                                    $html .= '<br><b>'.$attributesGroup[$key].'</b> : <i>'.$element.'</i>';
                                  }
                            }
                          @endphp
                        {!! $html !!}
                        </span></td>
                        <td align="right"><span>{{ \Helper::currencyOnlyRender($item->price,$order->currency) }}</span></td>
                        <td>x <span class="item_{{ $item->id }}_qty">{{ number_format($item->qty) }}</span></td>
                        <td align="right"><span >{{ \Helper::currencyOnlyRender($item->total_price,$order->currency)}}</span></td>
                        <td>
                          <span style="display: none"  class="item_{{ $item->id }}_price">{{ $item->price }}</span>
                          <span style="display: none"  class="item_{{ $item->id }}_total_price">{{ $item->total_price}}</span>
                            <button onclick="dataEdit({{ $item->id }});" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#editItem" data-placement="top" rel="tooltip" data-original-title="" title="Edit item"><span class="glyphicon glyphicon-pencil"></span></button>
                             &nbsp;
                            <button  onclick="dataRemove({{ $item->id }});" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#removeItem" data-placement="top" rel="tooltip" data-original-title="" title="Remove item"><span class="glyphicon glyphicon-remove"></span></button>
                        </td>
                      </tr>
                @endforeach
            </tbody>
          </table>
        </div>

    <div class="margin10" id="add-item">
        <button  type="button" class="btn btn-sm btn-success" id="add-item-button"  title="{{trans('language.product.add_product') }}"><i class="fa fa-plus"></i> {{ trans('language.product.add_product') }}</button>
    </div>


      <table class="table box table-bordered">
        <tr>
          <td  class="td-title">{{ trans('language.order.order_note') }}:</td>
          <td>
            <a href="#" class="updateInfo" data-name="comment" data-type="textarea" data-pk="{{ $order->id }}" data-url="{{ route("order_update") }}" data-title="" >{{ $order->comment }}
            </a>
        </td>
        </tr>
      </table>

      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                          {{ trans('language.order.order_history') }}
                      <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          <i class="more-less glyphicon glyphicon-plus"></i>
                          </a>
                  </h4>
              </div>
              <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                      @if (count($order->history))
                        <table  class="table table-bordered" id="history">
                          <tr>
                            <th>{{ trans('language.order.history_staff') }}</th>
                            <th>{{ trans('language.order.history_content') }}</th>
                            <th>{{ trans('language.order.history_time') }}</th>
                          </tr>
                        @foreach ($order->history->sortKeysDesc()->all() as $history)
                          <tr>
                            <td>{{ \Encore\Admin\Auth\Database\Administrator::find($history['admin_id'])->name??'' }}</td>
                            <td><div class="history">{!! $history['content'] !!}</div></td>
                            <td>{{ $history['add_date'] }}</td>
                          </tr>
                        @endforeach
                        </table>
                      @endif
              </div>
          </div>
      </div>

    </div>

    <div class="col-sm-6">
          <table   class="table table-bordered">
@foreach ($dataTotal as $element)
  @if ($element['code'] =='subtotal')
    <tr><td  class="td-title-normal">{!! $element['title'] !!}:</td><td align="right" class="data-{{ $element['code'] }}">{{ \Helper::currencyFormat($element['value']) }}</td></tr>
  @endif
  @if ($element['code'] =='shipping')
    <tr><td>{!! $element['title'] !!}:</td><td align="right"><a href="#" class="updatePrice data-{{ $element['code'] }}"  data-name="{{ $element['code'] }}" data-type="text" data-pk="{{ $element['id'] }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.shipping_price') }}">{{$element['value'] }}</a></td></tr>
  @endif
  @if ($element['code'] =='discount')
    <tr><td>{!! $element['title'] !!}(-):</td><td align="right"><a href="#" class="updatePrice data-{{ $element['code'] }}" data-name="{{ $element['code'] }}" data-type="text" data-pk="{{ $element['id'] }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.discount') }}">{{$element['value'] }}</a></td></tr>
  @endif

   @if ($element['code'] =='total')
    <tr style="background:#f5f3f3;font-weight: bold;"><td>{!! $element['title'] !!}:</td><td align="right" class="data-{{ $element['code'] }}">{{ \Helper::currencyFormat($element['value']) }}</td></tr>
  @endif

  @if ($element['code'] =='received')
    <tr><td>{!! $element['title'] !!}(-):</td><td align="right"><a href="#" class="updatePrice data-{{ $element['code'] }}" data-name="{{ $element['code'] }}" data-type="text" data-pk="{{ $element['id'] }}" data-url="{{ route("order_update") }}" data-title="{{ trans('language.order.received') }}">{{$element['value'] }}</a></td></tr>
  @endif

@endforeach

  <tr  {!! $style !!}  class="data-balance"><td>{{ trans('language.order.balance') }}:</td><td align="right">{{($order->balance === NULL)?\Helper::currencyFormat($order->total):\Helper::currencyFormat($order->balance) }}</td></tr>
  <tr id="update-status" style="display: none;"></tr>
        </table>

    </div>

  </div>
</div>



<div class="modal fade" id="removeItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel">{{ trans('admin.delete') }}</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
        <p class="text-danger"><span class="glyphicon glyphicon-warning-sign"></span> {{ trans('admin.delete_confirm') }}</p>
      </div>
      <form>
          <input  type="hidden" name="form_id" value="">
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ trans('admin.close') }}</button>
        <button id="removeItem-button" type="button" class="btn btn-primary">{{ trans('admin.delete') }}</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="editItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel">{{ trans('admin.edit') }}</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
            <input type="hidden" name="edit_order" value="">
          <table width="100%">
            <tr>
              <th style="width: 100px;">{{ trans('language.product.sku') }}</th>
              <th>{{ trans('language.product.name') }}</th>
              <th style="width: 70px;">{{ trans('language.product.quantity') }}</th>
              <th>{{ trans('language.product.price') }}</th>
              <th>{{ trans('language.product.total_price') }}</th>
              <th>{{ trans('language.product.attribute') }}</th>
            </tr>
            <tr>
              <input  type="hidden" class="edit_id" name="edit_id" value="">
              <td><input   type="text" disabled class="edit_sku form-control" name="edit_sku" value=""></td>
              <td><input  type="text" class="edit_name form-control" name="edit_name" value=""></td>
              <td><input type="number" class="edit_qty form-control" name="edit_qty" value=""></td>
              <td><input  type="number" class="edit_price form-control" name="edit_price" value=""></td>
              <td><input  type="number" disabled class="edit_total_price form-control" name="edit_total_price" value=""></td>
              <td><input  type="text" class="edit_attr form-control" name="edit_attr" value=""></td>
            </tr>
          </table>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ trans('admin.close') }}</button>
        <button type="button" class="btn btn-primary" id="editItem-button" >{{ trans('admin.save') }}</button>
      </div>
    </div>
  </div>
</div>


@php
  $selectProduct = '<form id="addItem-form">
      '.csrf_field().'
          <table width="100%">
          <input type="hidden" name="add_order" value="'.$order->id.'">
            <tr>
              <th>'.trans('language.product.name').'</th>
              <th style="width: 150px;">'.trans('language.product.sku').'</th>
              <th style="width: 70px;">'.trans('language.product.quantity').'</th>
              <th>'.trans('language.product.price').'</th>
            </tr>
            <tr>
              <td>
                <select required onChange="selectProduct($(this));" class="add_id form-control" name="add_id">
                <option value="0">'.trans('language.order.select_product').'</option>';
                foreach ($products as $key => $value){
  $selectProduct .='<option  value="'.$key.'" >'.$value.'</option>';
                }
  $selectProduct .='
              </select>
            </td>
              <td><input type="text" disabled class="add_sku form-control" name="add_sku" value=""></td>
              <td><input required type="number" class="add_qty form-control" name="add_qty" value=""></td>
              <td><input required type="text" class="add_price form-control" name="add_price" value=""></td>
              <td></td>
            </tr>
          <tr>
            <td colspan="4" class="add_attr"></td>
          </tr>
          </table></form>';
        $selectProduct = str_replace("\n", '', $selectProduct);
        $selectProduct = str_replace("\t", '', $selectProduct);
        $selectProduct = str_replace("\r", '', $selectProduct);
@endphp





<script type="text/javascript">


//Edit item
//
  function dataEdit(id){
        $.ajax({
            url:'{{ route("getInfoItem") }}',
            type:'get',
            dataType:'json',
            data:{
                'id':id,
            },
            success: function(data){
              $('#editItem [name="edit_order"]').val(data.order_id);
              $('#editItem [name="edit_id"]').val(data.id);
              $('#editItem [name="edit_sku"]').val(data.sku);
              $('#editItem [name="edit_name"]').val(data.name);
              $('#editItem [name="edit_qty"]').val(data.qty);
              $('#editItem [name="edit_price"]').val(data.price);
              $('#editItem [name="edit_attr"]').val(data.attribute);
              $('#editItem [name="edit_total_price"]').val(data.total_price);
            }
        });

    $('#editItem [name="edit_price"],#editItem [name="edit_qty"]').change(function(){
      $('#editItem [name="edit_total_price"]').val(
        parseInt($('#editItem [name="edit_qty"]').val()) * parseInt($('#editItem [name="edit_price"]').val())
        );
    });
  }

    $('#editItem-button').click(function(){
        $.ajax({
            url:'{{ route("order_edit_item") }}',
            type:'post',
            dataType:'json',
            data:{
                'pOrder':$('#editItem [name="edit_order"]').val(),
                'pId':$('#editItem [name="edit_id"]').val(),
                'pName':$('#editItem [name="edit_name"]').val(),
                'pQty':$('#editItem [name="edit_qty"]').val(),
                'pPrice':$('#editItem [name="edit_price"]').val(),
                'pAttr':$('#editItem [name="edit_attr"]').val(),
                '_token': "{{ csrf_token() }}",
            },
            success: function(result){
                if(parseInt(result.error) ==0){
                    location.reload();
                }else{
                    alert(result.msg);
                }
            }
        });
    });
//End edit item

//Remove item order
       function dataRemove(id){
        $('#removeItem [name="form_id"]').val(id);
      }

        $('#removeItem-button').click(function(){
        $.ajax({
            url:'{{ route("order_delete_item") }}',
            type:'post',
            dataType:'json',
            data:{
                'pId':$('#removeItem [name="form_id"]').val(),
                '_token': "{{ csrf_token() }}",
            },
            success: function(result){
                if(parseInt(result.error) ==0){
                    location.reload();
                }else{
                    alert('Error');
                }
            }
        });
    });
//End remove item order


//Add item
    function selectProduct(element){
        node = element.closest('tr');
        var id = parseInt(node.find('option:selected').eq(0).val());
        if(id == 0){
            node.find('[name="add_sku"]').val('');
            node.find('[name="add_qty"]').eq(0).val('');
            node.find('[name="add_price"]').eq(0).val('');
            node.next().find('.add_attr').html('');
        }else{
                $.ajax({
                url : '{{ route('getInfoProduct') }}',
                type : "get",
                dateType:"application/json; charset=utf-8",
                data : {
                     id : id
                },
                success: function(result){
                    var returnedData = JSON.parse(result);
                    node.find('[name="add_sku"]').val(returnedData.sku);
                    node.find('[name="add_qty"]').eq(0).val(1);
                    node.find('[name="add_price"]').eq(0).val(returnedData.price * {!! ($order->exchange_rate)??1 !!});
                    node.next().find('.add_attr').eq(0).html(returnedData.renderAttDetails);
                    }
                });
        }

    }

$('#add-item-button').click(function() {
  var checkForm = $('#addItem-form').length;
  if(checkForm){
              $.ajax({
                url:'{{ route("order_add_item") }}',
                type:'post',
                dataType:'json',
                data:$('form#addItem-form').serialize(),
                success: function(result){
                    if(parseInt(result.error) ==0){
                        location.reload();
                    }else{
                        alert(result.msg);
                    }
                }
            });
        }else{
          var html = '{!! $selectProduct !!}';
          $('#add-item').before(html);
        }

});
//End add item
//

$(document).ready(function() {
    $('.updateInfo').editable({});

    $(".updatePrice").on("shown", function(e, editable) {
      var value = $(this).text().replace(/,/g, "");
      editable.input.$input.val(parseInt(value));
    });
    $('.updateStatus').editable({
        validate: function(value) {
            if (value == '') {
                return '{{  trans('language.admin.not_empty') }}';
            }
        }
    });
        $('.updateInfoRequired').editable({
        validate: function(value) {
            if (value == '') {
                return '{{  trans('language.admin.not_empty') }}';
            }
        }
    });
    $('.updatePrice').editable({
    ajaxOptions: {
    type: 'post',
    dataType: 'json'
    },
    validate: function(value) {
        if (value == '') {
            return '{{  trans('language.admin.not_empty') }}';
        }
        if (!$.isNumeric(value)) {
            return '{{  trans('language.admin.only_numeric') }}';
        }
    },

        success: function(response, newValue) {
            // var rs = JSON.parse(response);
            console.log(response);
            var rs = response;
            if(rs.stt ==1){
                $('.data-shipping').html(rs.msg.shipping);
                $('.data-received').html(rs.msg.received);
                $('.data-total').html(rs.msg.total);
                $('.data-shipping').html(rs.msg.shipping);
                $('.data-discount').html(rs.msg.discount);
                $('.data-balance').remove();
                $('#update-status').before(rs.msg.balance);
                $('.payment_status').html(rs.msg.payment_status);
            }
    }
    });
});

</script>
