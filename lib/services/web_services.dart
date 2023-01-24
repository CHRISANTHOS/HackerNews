import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hackernews/models/story.dart';
import 'package:http/http.dart' as http;
import 'package:hackernews/models/comment.dart';

class WebService{

  Future<Story> _getStories(int storyId)async{
    final url = 'https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty';
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      final story = jsonDecode(response.body);
      print(story);
      return Story.fromJson(story);
    }else{
      throw Exception('Can\'t get story');
    }
  }

  Future<List<Story>> fetchTopStories()async{
    const url = 'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty';

    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      Iterable storyIds = jsonDecode(response.body);
      print(storyIds);
      return Future.wait(storyIds.take(10).map((id) {
        return _getStories(id);
      }));
    }else{
      throw Exception('can\'t get data');
    }

  }

  Future<List<Comment>> getCommentById(Story story)async{

    return Future.wait(story.commentIds.map((comment)async{
      final url = 'https://hacker-news.firebaseio.com/v0/item/$comment.json?print=pretty';
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final Map<String, dynamic> comments = jsonDecode(response.body);
        return Comment.fromJson(comments);
      }else{
        throw Exception('no comments');
      }
    }).toList());
  }


}