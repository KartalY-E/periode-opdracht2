<?php if (Auth::check()): ?>

@extends("layouts.app")
@section('content')
  <div class="container">
    <div class="post">
      <div class="col-md-9 col-md-offset-0">
        @if(count($errors) > 0)
          @foreach($errors->all() as $error)
          <div class="alert alert-danger">{{$error}}</div>
          @endforeach
        @endif
        @if(session('response'))
          <div class="alert alert-succes"><b>{{session('response')}}</b></div>
        @endif
          <div class="panel panel-default">
              <div class="panel-heading">Create Post</div>
              <div class="panel-body">
                <form class="form-horizontal" method="POST" action="{{ url('addpost') }}">
                    {{ csrf_field() }}

                    <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                        <label for="title" class="col-md-4 control-label">Title</label>

                        <div class="col-md-6">
                            <input id="title" type="text" class="form-control" name="title" value="{{ old('title') }}" required autofocus>

                            @if ($errors->has('title'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group{{ $errors->has('text') ? ' has-error' : '' }}">
                        <label for="text" class="col-md-4 control-label">text</label>

                        <div class="col-md-6">
                            <textarea id="text" name="text" rows="8" cols="50"></textarea>
                            @if ($errors->has('text'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('text') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group{{ $errors->has('websitelink') ? ' has-error' : '' }}">
                        <label for="websitelink" class="col-md-4 control-label">websitelink</label>

                        <div class="col-md-6">
                            <input id="websitelink" type="string" class="form-control" name="websitelink">
                            @if ($errors->has('websitelink'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('websitelink') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8 col-md-offset-4">
                            <button type="submit" class="btn btn-primary">
                                Submit
                            </button>
                        </div>
                    </div>
                </form>
              </div>
          </div>
      </div>
    </div>
  </div>
@endsection
<?php endif; ?>
<?php if (!Auth::check()) { ?>
  @section("content")
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading">Login or register pls</div>
        </div>
    </div>
  @endsection

<?php } ?>
