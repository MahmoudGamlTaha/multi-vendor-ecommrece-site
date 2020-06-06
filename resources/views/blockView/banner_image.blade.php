  @php
    $banners = \App\Models\Banner::where('status', 1)->sort()->get()
  @endphp
 @if (!empty($banners))
 <script src="{{ asset('js/vue.js') }}"></script>
 <script>
   window.onload = function () {
   var app = new Vue({

     el:'#slider',
     data:{
      images: [],
      banner:"{{ asset($path_file)}}/banner/slide.jpg",
      currentNumber:0,
       timer: null
     },
     computed:{
      currentImage: function() {
      	return "{{ asset($path_file)}}/"+this.images[Math.abs(this.currentNumber) % this.images.length];
      }
     },
     methods:{
       datax:function(){
           //this.images.push('{{$banners[0]->image}}');
           //this.images.push('{{$banners[1]->image}}');
          // this.images.push('{{$banners[2]->image}}');
           this.images.push('/banner/test.jpg');
           this.images.push('/banner/test2.jpg');
           this.images.push('/banner/test3.jpg');
     },
     startRotation:function(){
      this.timer = setInterval(this.next, 3000);
     },
     stopRotation: function() {
            clearTimeout(this.timer);
            this.timer = null;
        },
        next: function() {
            this.currentNumber += 1
        },
        prev: function() {
            this.currentNumber += 1
        }
    
    },
     created() {
       this.datax();
    },
    mounted: function () {
        this.startRotation();
    },
    
   })
  }

 </script>
 <style>
.fade-enter-active, .fade-leave-active {
  transition: all 0.8s ease;
  overflow: hidden;
  visibility: visible;
  opacity: 1;
  position: absolute;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
  visibility: hidden;
}
 </style>
 <!--<script src="{{asset('js/jquery.min.js')}}"></script> sprint 1 -->
 
 <section id="slider"><!--slider-->
    <div class="container">
    <div class="row row-no-gutters">
    <div class="col-md-12">
      <img src="{{ asset($path_file.'')}}/testbanner/test.png" class="top3img"></img> 
      <img src="{{ asset($path_file.'')}}/testbanner/test.png" class="top3img"></img>
       <img src="{{ asset($path_file.'')}}/testbanner/test.png" class="top3img"></img>
    
    </div>
    </div>
    </div>
      <div class="row row-no-gutters">
        <div class="col-sm-8">
        <div style="min-height: 249px;clear:both">
        <transition  name="fade" mode="out-in" tag='div'>
       <div
       v-for="number in [currentNumber]"
       :key='number'
       >
         <img
             :src="currentImage"
             v-on:mouseover="stopRotation"
             v-on:mouseout="startRotation"
             style="height: 249px;"
             />
       </div>
    </transition>
      
        </div>
         <!-- <div class="bxslider"> sprint 1
	           @foreach ($banners as $key => $banner) 
		     	   <div>
                <img data-u="image" src="{{ asset($path_file.'') }}/{{ $banner->image }}"></img>
            </div>
			@endforeach
          </div>   -->
        </div>
      <div class="col-xs-1">
      <img :src="banner" ></img>
      </div>
      </div>
    
  </section><!--/slider-->
 
@endif
