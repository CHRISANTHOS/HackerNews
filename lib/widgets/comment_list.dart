import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackernews/view_models/comment_view_model.dart';
import 'package:html_unescape/html_unescape.dart';

class CommentList extends StatelessWidget {
  final List<CommentViewModel> comments;
  CommentList({super.key, required this.comments});

  HtmlUnescape unescape = HtmlUnescape();

  String _formatText(String text){
    String formattedText = unescape.convert(text ?? '');
    return formattedText.isNotEmpty ? formattedText.substring(0, min(300, formattedText.length)) : '';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('${index + 1}')),
            title: Text(_formatText(comments[index].text)),
          );
        });
  }
}
