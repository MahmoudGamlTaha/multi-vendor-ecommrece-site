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
                <thead>
                <tr>
                  <th width="40%">{{ trans('Extensions/Shipping/ShippingStandard.fee') }}</th>
                  <th width="40%">{{ trans('Extensions/Shipping/ShippingStandard.shipping_free') }}</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                      <td><a href="#" class="updateData_num" data-name="fee" data-type="text" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>'shipping','key'=>'ShippingStandard']) }}" data-title="{{ trans('Extensions/Shipping/ShippingStandard.fee') }}">{{ $data['fee'] }}</a></td>
                      <td><a href="#" class="updateData_num" data-name="shipping_free" data-type="text" data-pk="{{ $data['id'] }}" data-url="{{ route('processExtension',['group'=>$group,'key'=>$key]) }}" data-title="{{ trans('Extensions/Shipping/ShippingStandard.shipping_free') }}">{{ $data['shipping_free'] }}</a></td>
                    </tr>
                </tbody>
                <tfoot>
                </tfoot>
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
    $(".updateData_num").on("shown", function(e, editable) {
      var value = $(this).text().replace(/,/g, "");
      editable.input.$input.val(parseInt(value));
    });
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

});

</script>
