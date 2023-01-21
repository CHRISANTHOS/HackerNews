import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_list_view_models.dart';
import 'pages/homePage.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      home: ChangeNotifierProvider(
          create: (BuildContext context) => StoryListViewModel(),
          child: HomePage()),
    );
  }
}
