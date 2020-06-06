
       <table class="table box table-bordered">
        @foreach ($datas as $data)
        <tr>
          <td style="width: 200px;">{!! trans(htmlentities($data['title'])) !!}:</td>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['field'] }}" data-type="{{ $data['type'] }}" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['value'] }}"></a>
          </td>
        </tr>
        @endforeach
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
