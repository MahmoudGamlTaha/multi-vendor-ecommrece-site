
       <table class="table box table-bordered">
         <tr>
           <td>code</td>
           <td>name</td>
           <td>amount_in_base</td>
         </tr>
        @foreach ($datas as $data)
        <tr>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['codeField'] }}" data-type="{{ $data['type'] }}" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['codeValue'] }}"></a>
          </td>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['nameField'] }}" data-type="{{ $data['type'] }}" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['value'] }}"></a>
          </td>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['amountField'] }}" data-type="number" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['amount'] }}"></a>
          </td>
        </tr>
        @endforeach
        <tr id="addnew-' .code. '">
          <td>  <button type="button" class="btn btn-sm btn-success"  onclick="morItem(' . $key . ');" rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> ' . trans('language.attribute.add_more') . '</button>
          </td>
          <td>  <button type="button" class="btn btn-sm btn-success"  onclick="morItem(' . $key . ');" rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> ' . trans('language.attribute.add_more') . '</button>
          </td>
          <td>  <button type="button" class="btn btn-sm btn-success"  onclick="morItem(' . $key . ');" rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> ' . trans('language.attribute.add_more') . '</button>
          </td>

        </tr>
      </table>


<script type="text/javascript">
$(document).ready(function() {
        $('.no-required').editable({});
        $('.fied-required').editable({
        validate: function(value) {
            if (value == '') {
                return '{{  trans('language.admin.not_empty') }}';
            }
        }
    });
});
</script>
<script>
                function morItem(id){
                        $("#no-item-"+id).remove();
                    $("tr#addnew-"+id).before("<tr><td><span><span class=\"input-group\"><input  type=\"text\" name=\"group["+id+"][name][]\" value=\"\" class=\"form-control\" placeholder=\"$detail_name\"></span></span></td><td><button onclick=\"removeItemForm(this);\" class=\"btn btn-danger btn-xs\" data-title=\"Delete\" data-toggle=\"modal\"  data-placement=\"top\" rel=\"tooltip\" data-original-title=\"\" title=\"Remove item\"><span class=\"glyphicon glyphicon-remove\"></span> $remove</button></td></tr>");
                    }

                    function removeItemForm(elmnt){
                      elmnt.closest("tr").remove();
                    }

</script>
