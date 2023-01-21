
import 'package:hackernews/models/story.dart';

class StoryViewModels{

  Story story;

  StoryViewModels({required this.story});

  String get title{
    return story.title;
  }
  String get url{
    return story.url;
  }

}