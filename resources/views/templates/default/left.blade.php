<!--main left-->
<div class="col-sm-2">
   @section('left')
        <div class="left-sidebar">
      <!--Module left -->
          @isset ($layouts['left'])
              @foreach ( $layouts['left']  as $layout)
                @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
                  @if ($layout->type =='html')
                    {!! $layout->text !!}
                  @elseif($layout->type =='view')
                    @if (view()->exists('blockView.'.$layout->text))
                     @include('blockView.'.$layout->text)
                    @endif
                  @elseif($layout->type =='module')
                    {!! (new $layout->text)->render() !!}
                  @endif
                @endif
              @endforeach
          @endisset
      <!--//Module left -->
      </div>
    @show
</div>
<!--//main left-->
