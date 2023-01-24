class Comment{

  final String text;
  final int commentId;

  Comment({required this.text, required this.commentId});

  factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(text: json['text'] ?? '', commentId: json['id']);
  }

}