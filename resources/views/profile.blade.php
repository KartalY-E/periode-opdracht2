  @extends("layouts.app")

  @section("content")
<?php if (Auth::check()) { ?>
  <div class="col-md-8 col-md-offset-2">
      @if(session('response'))
        <div class="panel panel-default">
          <div class="alert"><b>{{session('response')}}</b></div>
        </div>
      @endif
      <div class="panel panel-default">
          <div class="panel-heading">Profile details</div>
          <div class="panel-body">
            <p>
              {{ Auth::user()->name }}
              <br>{{ Auth::user()->email }}
            </p>
          </div>
      </div>
      @if(count($posts) > 0)
        <div class="panel panel-default">
          <div class="panel-heading">
            My posts
          </div>
          <?php $number = 0 ;?>
        @foreach($posts->all() as $post)
          <div class="postinfo">
            <div class="postlikes">
              <form class="" action='{{ url("/view/{$post->id}")}}' method="get">
                <button type="submit" class="rb" name="button">{{ $number = $number + 1 }}</button>
              </form>
            </div>
            <div class="posttext">
              <h4><a href='{{ url("/view/{$post->id}") }}'>{{substr($post->title,0,90)}}</a></h4>
              <p>{{substr($post->text,0,50) . " . . ." }}</p>
              <p>{{date('M j Y, h:i',strtotime($post->updated_at))}}</p>
            </div>
          </div>
          <div class="hr">
              <hr>
          </div>
        @endforeach
      </div>
      @else
        <div class="panel panel-default">
          <p>No post availeble</p>
        </div>
      @endif

  </div>
<?php }else { ?>
  <div class="col-md-8 col-md-offset-2">
      <div class="panel panel-default">
          <div class="panel-heading">Login or register pls</div>
      </div>
  </div>
<?php } ?>
@endsection
