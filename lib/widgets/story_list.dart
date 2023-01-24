import 'package:flutter/material.dart';
import 'package:hackernews/view_models/story_list_view_models.dart';
import 'package:hackernews/view_models/story_view_models.dart';
import 'package:provider/provider.dart';

class StoryList extends StatelessWidget {

  final Function(StoryViewModels) onSelected;
  StoryList({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StoryListViewModel>(context);

    return ListView.builder(
        itemCount: vm.stories.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              onSelected(vm.stories[index]);
            },
            title: Text(vm.stories[index].title),
            trailing: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text('${vm.stories[index].commentsId.length}', style: TextStyle(color: Colors.white),),
            ),
          );
        });
  }
}
