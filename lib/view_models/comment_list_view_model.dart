import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hackernews/services/web_services.dart';
import 'package:hackernews/view_models/story_view_models.dart';
import 'comment_view_model.dart';

class CommentListViewModel extends ChangeNotifier{

  List<CommentViewModel> comments = <CommentViewModel>[];

  Future<void> getCommentByStory(StoryViewModels story)async{
    final results = await WebService().getCommentById(story.story);
    comments = results.map((item) => CommentViewModel(comment: item)).toList();
    notifyListeners();
  }

}

