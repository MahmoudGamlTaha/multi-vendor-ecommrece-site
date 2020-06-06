@if(Session::has('import_success'))
    <div class="alert alert-success">
        <b>List product success:</b><br>
        @foreach (Session::get('import_success') as $detail)
            {{ $detail }}<br>
        @endforeach
    </div>
@endif
@if(Session::has('import_error'))
    <div class="alert alert-danger">
        <b>List product success:</b><br>
        @foreach (Session::get('import_error') as $detail)
            {{ $detail }}<br>
        @endforeach
</div>
@endif

<form method="post" action="" enctype="multipart/form-data">
<div>
{{ trans('language.process.productImport_text') }}: <a href="{{ asset('format/importProduct.xlsx') }}">Download HERE</a>
</div>
<div class="col-md-6 input-group file-caption-main ">
  <div class="form-group {!! !$errors->has('import_file') ?: 'has-error' !!}">
    <input type="file" name="import_file" class="form-control-file">
    @if($errors->has('import_file'))
        <span class="help-block">{{ $errors->first('import_file') }}</span>
    @endif
  </div>
</div>
{{ csrf_field() }}
<div class="btn-group">
    <button type="submit" class="btn btn-primary" style="width: 100px;">Submit</button>
</div>
</form>
