@extends('layouts.app')

@section('content')
<div class="container">
  <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading forms">
                  <span class="l va" >Home page</span>
                  <form class="l" action="{{ url('home/old')}}" method="get">
                    <input type="submit" class="b button4" name="submit" value="Old">
                  </form>
                  <form class="l" action="{{ url('home/new')}}" method="get">
                    <input type="submit" class="b button4" name="submit" value="New">
                  </form>
                  <form class="l" action="{{ url('home/title')}}" method="get">
                    <input type="submit" class="b button4" name="submit" value="Title">
                  </form>
                  <form class="r" action="{{ url('/search')}}" method="post">
                    <button class="search" type="submit" name="submit">&#128269;</button>
                    <input class="l search" type="text" name="search" value="Search...">
                    {{ csrf_field() }}
                  </form>
                  <div class="p"></div>
                </div>

                @if (session('status'))
                    <div class="panel-body">
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                    </div>
                @endif
              @if(count($posts) > 0)
              <?php $number = 0; ?>
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
              @else
                <div class="panel-body">
                  <p>No post availeble</p>
                </div>
              @endif
            </div>
            <form class="" action='{{ url("home/all") }}' method="post">
              {{ csrf_field() }}
              <center><input class="b more button4" type="submit" name="more" value="More"></center>
            </form>
        </div>
  </div>
</div>
@endsection
