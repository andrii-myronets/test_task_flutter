import 'package:flutter/material.dart';
import 'package:yo_yo/src/API.dart';
import 'package:yo_yo/src/ShowLoading.dart';
import 'package:yo_yo/src/createListView.dart';

class ListDisplay extends StatefulWidget {
  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return ShowLoading();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return createListView(snapshot.data.posts, context);
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
      ),
      body: futureBuilder,
    );
  }
}
