<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Like;
use App\Dislike;
use DB;
use Auth;

class HomeController extends Controller
{

    public function index()
    {
      $posts = Post::paginate(4);
      $likeCtr = 1;
      return view('home',['posts' => $posts]);
    }
    public function showmore()
    {
      $posts = Post::paginate(8);
      return view('home',['posts' => $posts]);
    }
    public function old()
    {
      $posts = Post::orderBy('created_at','asc')->get();
      return view('home',['posts' => $posts]);
    }
    public function new()
    {
      $posts = Post::orderBy('created_at', 'desc')->get();
      return view('home',['posts' => $posts]);
    }
    public function title()
    {
      $posts = Post::orderBy('title')->get();
      return view('home',['posts' => $posts]);
    }
    //**************************************************************************
    public function profile()
    {
      $posts = DB::table('posts')->where('user_id',Auth::user()->id)->get();
      return view('profile',['posts' => $posts]);
    }
    //**************************************************************************
    public function upvotepost($post_id)
    {
      DB::table('posts')->whereId($post_id)->increment('point');
      return view('view/{$post_id}');
    }
    public function downvotepost($post_id)
    {
      DB::table('posts')->whereId($post_id)->decrement('point');
      $posts = Post::paginate(4);
      return view('home',['posts' => $posts]);
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function homefrompost()
    {
      return view("home");
    }
}
