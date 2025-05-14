@extends('base')

@section('title','Accueil du blog')


@section('content')

<h1>Mon Blog</h1>
@foreach ($posts as $post )
<article>
    <h2>{{ $post->title }}</h2>
    <p>
        {{ $post->content }}
    </p>
    <p><a class="btn bg-primary text-white" href="{{ route('blog.show',['slug'=>$post->slug,'id'=>$post->id]) }}">Voullez vous lire la suite</a></p>
</article>


@endforeach
 <div class="container"> <h3>
{{ $posts->links() }}
    
 </h3></div>
@endsection