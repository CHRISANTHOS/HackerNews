import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_list_view_models.dart';
import 'package:hackernews/view_models/story_view_models.dart';
import 'package:provider/provider.dart';
import 'package:hackernews/widgets/story_list.dart';
import 'details_page.dart';
import 'package:hackernews/view_models/comment_list_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _getDetailsPage(StoryViewModels story, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => CommentListViewModel(),
          child: DetailsPage(
            story: story,
          ),
        ),
      ),
    );
  }

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
          IconButton(
              onPressed: () {
                Provider.of<StoryListViewModel>(context, listen: false)
                    .fetchTopStories();
                // print('done');
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: StoryList(
        onSelected: (story) {
          _getDetailsPage(story, context);
        },
      ),
    );
  }
}
