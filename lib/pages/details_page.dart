import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_view_models.dart';
import 'package:provider/provider.dart';
import 'package:hackernews/view_models/comment_list_view_model.dart';
import 'package:hackernews/widgets/comment_list.dart';

class DetailsPage extends StatefulWidget {
  StoryViewModels story;
  DetailsPage({required this.story});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CommentListViewModel>(context, listen: false).getCommentByStory(widget.story);
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentListViewModel>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.title),
      ),
      body: CommentList(comments: vm.comments),
    );
  }
}
