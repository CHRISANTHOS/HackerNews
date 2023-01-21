import 'package:hackernews/models/story.dart';
import 'package:hackernews/services/web_services.dart';

import 'story_view_models.dart';
import 'package:flutter/cupertino.dart';

class StoryListViewModel extends ChangeNotifier{

  List<StoryViewModels> stories = <StoryViewModels>[];

  Future<void> fetchTopStories()async{
   List<Story> storyNews = await WebService().fetchTopStories();
   stories = storyNews.map((story) => StoryViewModels(story: story)).toList();
   notifyListeners();
  }


}