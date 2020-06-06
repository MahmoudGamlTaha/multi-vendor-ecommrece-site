<section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">{{ $title }}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <table id="main-table" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>{{ trans('language.templates.name') }}</th>
                  <th>{{ trans('language.templates.auth') }}</th>
                  <th>{{ trans('language.templates.email') }}</th>
                  <th>{{ trans('language.templates.website') }}</th>
                  <th>{{ trans('language.templates.status') }}</th>
                </tr>
                </thead>
                <tbody>
                  @foreach ($templates as $key => $template)
                    <tr>
                     <td>{{ $template['config']['name']??'' }}</td>
                     <td>{{ $template['config']['auth']??'' }}</td>
                     <td>{{ $template['config']['email']??'' }}</td>
                     <td>{{ $template['config']['website']??'' }}</td>
                      <td>{!! ($templateCurrent == $key)?'<button title="'.trans('language.templates.active').'"  class="btn">'.trans('language.templates.active').'</button >':'<button  onClick="enableTemplate($(this),\''.$key.'\');" title="'.trans('language.templates.inactive').'" data-loading-text="'.trans('language.templates.installing').'" class="btn btn-primary">'.trans('language.templates.inactive').'</button >' !!}</td>
                    </tr>
                  @endforeach
                </tbody>
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
  function enableTemplate(obj,key) {
      obj.button('loading');
      $.ajax({
        type: 'POST',
        dataType:'json',
        url: '{{ route('changeTemplate') }}',
        data: {
          "_token": "{{ csrf_token() }}",
          "key":key,
        },
        success: function (response) {
          console.log(response);
          if(parseInt(response.error) ==0){
              location.reload();
          }else{
              obj.button('reset');
              alert(response.msg);
          }
        }
      });

  }
</script>
