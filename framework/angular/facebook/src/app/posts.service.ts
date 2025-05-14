import { Injectable } from '@angular/core';8
interface Post {
  id: number;
  author: string;
  content: string;
  likes: number;
  comments: string[];
}

@Injectable({ providedIn: 'root' })
export class PostsService {
  private posts: Post[] = [
    {
      id: 1,
      author: 'John Doe',
      content: 'Bonjour le monde !',
      likes: 15,
      comments: []
    }
  ];

  getPosts() {
    return this.posts;
  }
}