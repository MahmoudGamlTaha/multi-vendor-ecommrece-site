<section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">{{ $title }}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div><button id="generate" class="btn btn-success" data-loading-text="{{ trans('language.backup.processing') }}"><span class="glyphicon glyphicon-plus"></span>{{ trans('language.backup.generate_now') }}</button></div>
             <table id="main-table" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>{{ trans('language.backup.sort') }}</th>
                  <th>{{ trans('language.backup.date') }}</th>
                  <th>{{ trans('language.backup.name') }}</th>
                  <th>{{ trans('language.backup.size') }}</th>
                  <th>{{ trans('language.backup.download') }}</th>
                  <th>{{ trans('language.backup.remove') }}</th>
                  <th>{{ trans('language.backup.restore') }}</th>
                </tr>
                </thead>
                <tbody>
                  @foreach ($arrFiles as $key => $file)
                    <tr>
                     <td>{{ $key+1 }}</td>
                     <td>{{ $file['time']}}</td>
                     <td>{{ $file['name']}}</td>
                     <td>{{ $file['size']}}</td>
                      <td>{!! '<a href="?download='.$file['name'].'"><button title="'.trans('language.backup.download').'" data-loading-text="'.trans('language.backup.processing').'" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> '.trans('language.backup.download').'</button ></a>' !!}</td>
                      <td>{!! '<button  onClick="processBackup($(this),\''.$file['name'].'\',\'remove\');" title="'.trans('language.backup.remove').'" data-loading-text="'.trans('language.backup.processing').'" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> '.trans('language.backup.remove').'</button >' !!}</td>
                      <td>{!! '<button  onClick="processBackup($(this),\''.$file['name'].'\',\'restore\');" title="'.trans('language.backup.restore').'" data-loading-text="'.trans('language.backup.processing').'" class="btn btn-warning"><span class="glyphicon glyphicon-retweet"></span> '.trans('language.backup.restore').'</button >' !!}</td>
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
  function processBackup(obj,file,action) {
      var checkstr =  confirm('are you sure you want to do this?');
      if(checkstr == true){
      obj.button('loading');
      $.ajax({
        type: 'POST',
        dataType:'json',
        url: '{{ route('processBackupFile') }}',
        data: {
          "_token": "{{ csrf_token() }}",
          "file":file,
          "action":action,
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
    }else{
      return false;
    }
  }

  function generateBackup(obj) {
      obj.button('loading');
      $.ajax({
        type: 'POST',
        dataType:'json',
        url: '{{ route('generateBackup') }}',
        data: {
          "_token": "{{ csrf_token() }}",
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

$('#generate').click(function(){
  generateBackup($(this));
});
</script>
