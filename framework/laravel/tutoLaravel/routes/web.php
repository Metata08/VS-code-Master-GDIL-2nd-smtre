<?php

use App\Models\Post;
use GuzzleHttp\Psr7\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return  view('welcome');
});

Route::prefix('/blog')->name('blog.')->group(function () {

    Route::get('/', [App\Http\Controllers\BlogController::class ,'index']
    /* function () {


        $post = new App\Models\Post();
    $post->title='Mon second article';
    $post->slug='mon-second article';
    $post->content='Mon contenu';
    $post->save();
        $post= Post::all(['title','content']) ;

        $post = Post::paginate(1);
        dd($post);

        return $post;

        return view('welcome');
    } */)->name('index');

    Route::get('/{slug}-{id}', [App\Http\Controllers\BlogController::class ,'show']/* function (string $slug, string $id, Request $request) {
        

    } */)->where([
        'id' => '[0-9]+',
        'slug' => '[a-z0-9\-]+'
    ])->name('show');
});
