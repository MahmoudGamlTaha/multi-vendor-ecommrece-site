@extends($theme.'.shop_layout')

@section('main')

<section >
    <div class="container">
        <div class="row">
            <h2 class="title text-center">{{ $title }}</h2>
            {!! $entry_currently->content !!}
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ $entry_currently->category->getUrl() }}">{{ $entry_currently->category->title }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
