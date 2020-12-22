import 'package:flutter/material.dart';
import 'package:yo_yo/src/DetailScreen.dart';

Widget createListView(List items, context) {
  return ListView(
    shrinkWrap: true,
    primary: false,
    physics: BouncingScrollPhysics(),
    children: items.map((post) {
      return ListTile(
        leading: SizedBox(
          height: 100.0,
          width: 100.0,
          child: Image.network(post.img, fit: BoxFit.cover),
        ),
        title: Text('Autor: ${post.user}'),
        subtitle: Text('Description: ${post.description}'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        post: post,
                      )));
        },
      );
    }).toList(),
  );
}
