import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_view_models.dart';

class DetailsPage extends StatelessWidget {
  StoryViewModels story;
  DetailsPage({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
    );
  }
}
