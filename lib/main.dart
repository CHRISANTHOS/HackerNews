import 'package:flutter/material.dart';
import 'pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      home: HomePage(),
    );
  }
}
