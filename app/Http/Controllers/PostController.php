<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Comment;
use App\Like;
use App\Dislike;
use App\Profile;
use DB;
use Auth;
class PostController extends Controller
{
    public function updateprofile(Request $request)
    {
      $this->validate($request,[
        'name' => 'required',
        'email' => 'required|string|email|max:255|unique:users'
      ]);

      return view("/home")->with("response",' Profile updated succesfully');
    }
    public function addpost(Request $request)
    {
      $this->validate($request,[
        'title' => 'required',
        'text' => 'required',
        'websitelink' => 'required',
      ]);
      $postes = new Post;
      $postes->title       = $request->input('title');
      $postes->text        = $request->input('text');
      $postes->websitelink = $request->input('websitelink');
      $postes->point = 0;
      $postes->user_id = Auth::user()->id;
      $postes->save();

      //return Auth::user()->id;
      return redirect("/post")->with("response",' Post Added Succesfully');
    }
    public function postviewpage($post_id)
    {
      $posts = Post::where("id","=",$post_id)->get();
      $likesPost = Post::find($post_id);
      $likeCtr = Like::where(['post_id' => $likesPost->id])->count();
      $dislikeCtr = DisLike::where(['post_id' => $likesPost->id])->count();
      $comments =DB::table("users")
      ->join("comments","users.id","=","comments.user_id")
      ->join("posts","comments.post_id","=","posts.id")
      ->select("users.name","comment")
      ->where(["posts.id" => $post_id])
      ->get();
      return view("view",['posts' => $posts ,'comments' => $comments , 'likeCtr' => $likeCtr ,'dislikeCtr'=> $dislikeCtr]);
    }

    public function comment(Request $request,$post_id)
    {
      $this->validate($request , [
        "comment" => "required"]);
      $comment = new Comment;
      $comment->user_id =Auth::user()->id;
      $comment->post_id = $post_id;
      $comment->comment = $request->input("comment");
      $comment->save();

      return redirect("/view/{$post_id}")->with("respone","comment added");
    }
    public function like($id)
    {
      $loggedinuser = Auth::user()->id;
      $like_user = Like::where(['user_id' => $loggedinuser, 'post_id' => $id])->first();
      if(empty($like_user->user_id)){
        $user_id = Auth::user()->id;
        $email = Auth::user()->email;
        $post_id = $id;
        $like = new Like;
        $like->user_id = $user_id;
        $like->email = $email;
        $like->post_id = $post_id;
        $like->save();
        return redirect("/view/{$id}");
      }
      else {

        return redirect("/view/{$id}");
      }
    }
    public function dislike($id)
    {
      $loggedinuser = Auth::user()->id;
      $like_user = Dislike::where(['user_id' => $loggedinuser, 'post_id' => $id])->first();
      if(empty($like_user->user_id)){
        $user_id = Auth::user()->id;
        $email = Auth::user()->email;
        $post_id = $id;
        $like = new Dislike;
        $like->user_id = $user_id;
        $like->email = $email;
        $like->post_id = $post_id;
        $like->save();
        return redirect("/view/{$id}");
      }
      else {

        return redirect("/view/{$id}");
      }
    }
    public function search(Request $request)
    {
      $search = $request->input("search");
      $posts = Post::where("title",'LIKE','%'.$search.'%')->get();
      return view("search",['posts' => $posts , 'search' => $search]);
    }
}
