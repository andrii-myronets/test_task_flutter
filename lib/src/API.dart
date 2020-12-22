import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yo_yo/src/PostList.dart';

final String baseUrl =
    'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

Future<PostList> fetchPosts() async {
  final response = await http.get(baseUrl);

  if (response.statusCode == 200) {
    return PostList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
