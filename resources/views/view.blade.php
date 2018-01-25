@extends("layouts.app")

@section("content")
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-default">
      @if(count($posts) > 0)
        @foreach($posts->all() as $post)
        <div class="panel-heading"><h2>{{ $post->title}}</h2></div>
        <div class="panel-body">
              <div class="viewpostlikes">
                <form class="" action='{{ url("/like/{$post->id}") }}' method="get">
                  <input type="submit" name="like" value="&#8679;">
                  <span><b>&nbsp;&nbsp;{{ $likeCtr }}</b>&nbsp;&nbsp;Likes</span>
                </form>
                <form class="" action='{{ url("/dislike/{$post->id}") }}' method="get">
                  <input type="submit" name="dislike" value="&#8681;">
                  <span><b>&nbsp;&nbsp;{{ $dislikeCtr }}</b>&nbsp;&nbsp;Dislikes</span>
                </form>

              </div>
              <div class="viewpostinfo">
                <p>{{ $post->text }}</p>
                <p><a href="{{ $post->websitelink }}">More information</a></p>
                <p>{{ date('M j Y, h:i',strtotime($post->updated_at)) }}</p>
              </div>
            @endforeach
          @else
            <p>No post availeble</p>
          @endif
          <form class="" action='{{ url("/comment/{$post->id}") }}' method="post">
            {{csrf_field()}}
            <div class="form-group">
              <textarea id="comment" name="comment" rows="8" class="form-control" cols="80"></textarea>
            </div>
            <div class="form-group">
              <button type="submit" name="button">POST comment</button>
            </div>
          </form>
          @if(count($comments) > 0)
            <div class="comments">
              <h2>COMMENTS</h2>
                @foreach($comments->all() as $comment)
                  <p><h3>&nbsp;{{ $comment->comment }}</h3></p>
                  <b><h6>&nbsp;&nbsp;Posted by {{ $comment->name}}</h6></b>
                  <hr>
                @endforeach
            </div>
          @else
            <h4>Be the first one to comment something</h4>
          @endif
        </div>
    </div>
</div>
@endsection
