import 'package:hackernews/models/comment.dart';

class CommentViewModel {

  Comment comment;
  CommentViewModel({required this.comment});

  String get text{
    return comment.text;
  }
  int get id{
    return comment.commentId;
  }
}