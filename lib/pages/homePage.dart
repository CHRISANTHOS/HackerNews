import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_list_view_models.dart';
import 'package:provider/provider.dart';
import 'package:hackernews/widgets/story_list.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<StoryListViewModel>(context, listen: false).fetchTopStories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
        actions: [
          IconButton(onPressed: (){
            Provider.of<StoryListViewModel>(context, listen: false).fetchTopStories();
            // print('done');
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: StoryList(),
    );
  }
}
