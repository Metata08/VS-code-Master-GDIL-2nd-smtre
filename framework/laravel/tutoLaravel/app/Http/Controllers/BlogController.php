<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

use App\Models\Post;
use Illuminate\Contracts\View\View;

class BlogController extends Controller
{
    public function index():View{
    //    $post = Post::paginate(25);
        return view('blog.index',[
            'posts'=> Post::paginate(perPage: 1)
        ]);
    }

    public function show(string $slug , string $id):RedirectResponse | view     {
        $post = Post::findOrFail($id);
        if ($post->slug !== $slug) {
            return to_route('blog.show', ['slug' => $post->slug, 'id' => $post->id]);
        }
        return view('blog.show',['post'=>$post]) ;

    }
}
