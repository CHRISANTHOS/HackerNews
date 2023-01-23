import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_list_view_models.dart';
import 'package:provider/provider.dart';

class StoryList extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<StoryListViewModel>(context);

    return ListView.builder(
        itemCount: vm.stories.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(vm.stories[index].title),
            trailing: Text('${vm.stories[index].commentsId.length}'),
          );
        });
  }
}
