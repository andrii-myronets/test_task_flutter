class Post {
  final String id;
  final String user;
  final String img;
  final String fullImg;
  final String description;

  Post({this.id, this.user, this.img, this.fullImg, this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      user: json['user']['name'] ?? json['user']['username'] ?? 'User',
      img: json['urls']['thumb'],
      fullImg: json['urls']['full'],
      description: json['description'] ?? json['alt_description'] ?? 'photo',
    );
  }
}
