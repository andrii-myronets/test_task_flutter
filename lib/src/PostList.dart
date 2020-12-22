import 'package:yo_yo/src/Post.dart';

class PostList {
  final List<Post> posts;

  PostList({this.posts});

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = List<Post>();
    posts = parsedJson.map((item) => Post.fromJson(item)).toList();
    return new PostList(
      posts: posts,
    );
  }
}
