<section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">{{ $title }}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <table id="example2" class="table table-bordered table-hover">
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_mode') }}</th>
                <td><a href="#" class="updateData" data-name="paypal_mode" data-type="select" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_mode') }}" data-value="{{ $data['paypal_mode'] }}" data-source ='[{"value":"sandbox","text":"Sandbox"},{"value":"live","text":"Live"}]'</a></td>
              </tr>

              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_log') }}</th>
                <td><a href="#" class="updateData_num" data-name="paypal_log" data-type="select" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_log') }}" data-value="{{ $data['paypal_log'] }}" data-source ='[{"value":0,"text":"OFF"},{"value":1,"text":"ON"}]'</a></td>
              </tr>

              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_client_id') }}</th>
                <td><a href="#" class="updateData_can_empty" data-name="paypal_client_id" data-type="text" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-value="{{ $data['paypal_client_id'] }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_client_id') }}"></a></td>
              </tr>
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_secrect') }}</th>
                <td><a href="#" class="updateData_can_empty" data-name="paypal_secrect" data-type="password" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-value="{{ $data['paypal_secrect'] }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_secrect') }}"></a></td>
              </tr>
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_path_log') }}</th>
                <td><a href="#" class="updateData" data-name="paypal_path_log" data-type="text" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_path_log') }}">{{ $data['paypal_path_log'] }}</a></td>
              </tr>
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_currency') }}</th>
                <td><a href="#" class="updateData" data-name="paypal_currency" data-type="text" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_currency') }}">{{ $data['paypal_currency'] }}</a></td>
              </tr>
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_order_status_success') }}</th>
                <td><a href="#" class="updateData_num" data-name="paypal_order_status_success" data-type="select" data-pk="{{ $data['id'] }}" data-source="{{ $jsonStatusOrder }}" data-value="{{ $data['paypal_order_status_success'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_order_status_success') }}"></a></td>
              </tr>
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_order_status_faild') }}</th>
                <td><a href="#" class="updateData_num" data-name="paypal_order_status_faild" data-type="select" data-pk="{{ $data['id'] }}" data-source="{{ $jsonStatusOrder }}" data-value="{{ $data['paypal_order_status_faild'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_order_status_faild') }}"></a></td>
              </tr>
              <tr>
                <th width="40%">{{ trans('Extensions/Payment/Paypal.paypal_logLevel') }}</th>
                <td><a href="#" class="updateData" data-name="paypal_logLevel" data-type="select" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Payment/Paypal.paypal_logLevel') }}" data-value="{{ $data['paypal_logLevel'] }}" data-source ='[{"value":"DEBUG","text":"DEBUG (not allow live)"},{"value":"INFO","text":"INFO"},{"value":"ERROR","text":"ERROR"},{"value":"WARNING","text":"WARNING"}]'</a></td>
              </tr>

              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    <div>
</div>
</section>
<script type="text/javascript">
$(document).ready(function() {
    $('.updateData_num').editable({
    ajaxOptions: {
    type: 'put',
    dataType: 'json'
    },
    validate: function(value) {
        if (value == '') {
            return '{{  trans('language.admin.not_empty') }}';
        }
        if (!$.isNumeric(value)) {
            return '{{  trans('language.admin.only_numeric') }}';
        }
    }
    });

    $('.updateData').editable({
    ajaxOptions: {
    type: 'put',
    dataType: 'json'
    },
    validate: function(value) {
        if (value == '') {
            return '{{  trans('language.admin.not_empty') }}';
        }
    }
    });

    $('.updateData_can_empty').editable({
    ajaxOptions: {
    type: 'put',
    dataType: 'json'
    }
    });
});

</script>
