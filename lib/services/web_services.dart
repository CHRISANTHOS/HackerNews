import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hackernews/models/story.dart';
import 'package:http/http.dart' as http;

class WebService{

  Future<Story> _getStories(int storyId)async{
    final url = 'https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      final story = jsonDecode(response.body);
      return Story.fromJson(story);
    }else{
      throw Exception('Can\'t get story');
    }
  }
  
  Future<List<Story>> fetchTopStories()async{
    const url = 'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty';

    http.Response response = await http.get(Uri.parse(url));
    print(response.isRedirect);
    if(response.statusCode == 200){
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(storyIds.take(5).map((id) {
        print('done');
        return _getStories(id);
      }));
    }else{
      throw Exception('can\'t get data');
    }

  }


}