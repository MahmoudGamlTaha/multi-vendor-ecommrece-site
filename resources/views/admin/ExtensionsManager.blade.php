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
                  <th>{{ trans('language.extensions.code') }}</th>
                  <th>{{ trans('language.extensions.name') }}</th>
                  <th>{{ trans('language.extensions.sort') }}</th>
                  <th>{{ trans('language.extensions.status') }}</th>
                  <th>{{ trans('language.extensions.action') }}</th>
                </tr>
                </thead>
                <tbody>
                  @if (!$extensions)
                    <tr>
                      <td colspan="5" style="text-align: center;color: red;">Empty extension!</td>
                    </tr>
                  @else
                  @foreach ($extensions as $key => $extension)
                  @php
                    $extensionClass = $namespace.'\\'.$extension;
                    if(!array_key_exists($extension, $extensionsInstalled->toArray())){
                      $extensionStatus = null;
                      $extensionStatusTitle = trans('language.extensions.not_install');
                      $extensionAction = '<span onClick="installExtension($(this),\''.$extension.'\');" title="'.trans('language.extensions.install').'" type="button" class="btn btn-flat btn-success"><i class="fa fa-plus-circle"></i></span>';
                    }else{
                      if($extensionsInstalled[$extension]['value']){
                        $extensionStatus = 1;
                        $extensionStatusTitle = trans('language.extensions.actived');
                        $extensionAction ='<span onClick="disableExtension($(this),\''.$extension.'\');" title="'.trans('language.extensions.disable').'" type="button" class="btn btn-flat btn-warning btn-flat"><i class="fa fa-power-off"></i></span>&nbsp;
                              <a href="'.url()->current().'?action=config&extensionKey='.$extension.'"><span title="'.trans('language.extensions.config').'" class="btn btn-flat btn-primary"><i class="fa fa-gears"></i></span>&nbsp;</a>
                              <span onClick="uninstallExtension($(this),\''.$extension.'\');" title="'.trans('language.extensions.remove').'" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>';
                      }else{
                        $extensionStatus = 0;
                        $extensionStatusTitle = trans('language.extensions.disabled');
                        $extensionAction = '<span onClick="enableExtension($(this),\''.$extension.'\');" title="'.trans('language.extensions.enable').'" type="button" class="btn btn-flat btn-primary"><i class="fa fa-paper-plane"></i></span>&nbsp;
                              <a href="'.url()->current().'?action=config&extensionKey='.$extension.'"><span title="'.trans('language.extensions.config').'" class="btn btn-flat btn-primary"><i class="fa fa-gears"></i></span>&nbsp;</a>
                              <span onClick="uninstallExtension($(this),\''.$extension.'\');" title="'.trans('language.extensions.remove').'" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>';
                      }
                    }
                  @endphp
                    <tr>
                      <td>{{ $extension }}</td>
                      <td>{{ (new $extensionClass)->title }}</td>
                      <td>{{ isset($extensionsInstalled[$extension]['sort'])?$extensionsInstalled[$extension]['sort']:'' }}</td>
                      <td>{{ $extensionStatusTitle }}</td>
                      <td>{!! $extensionAction !!}</td>
                    </tr>
                  @endforeach
                  @endif
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
  function enableExtension(obj,key) {
      obj.button('loading');
      $.ajax({
        type: 'POST',
        dataType:'json',
        url: '{{ route('enableExtension') }}',
        data: {
          "_token": "{{ csrf_token() }}",
          "key":key,
          "group":"{{ $group }}"
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
  function disableExtension(obj,key) {
      obj.button('loading');
      $.ajax({
        type: 'POST',
        dataType:'json',
        url: '{{ route('disableExtension') }}',
        data: {
          "_token": "{{ csrf_token() }}",
          "key":key,
          "group":"{{ $group }}"
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
  function installExtension(obj,key) {
      obj.button('loading');
      $.ajax({
        type: 'POST',
        dataType:'json',
        url: '{{ route('installExtension') }}',
        data: {
          "_token": "{{ csrf_token() }}",
          "key":key,
          "group":"{{ $group }}"
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
  function uninstallExtension(obj,key) {
    var checkstr =  confirm('are you sure you want to uninstall this?');
      if(checkstr == true){
            obj.button('loading');
            $.ajax({
              type: 'POST',
              dataType:'json',
              url: '{{ route('uninstallExtension') }}',
              data: {
                "_token": "{{ csrf_token() }}",
                "key":key,
                "group":"{{ $group }}"
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
</script>
