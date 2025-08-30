class CommentEntity {
  final int commentId;
  final String comment;
  final User user;
  final List<Response> responses;

  CommentEntity({
    required this.commentId,
    required this.comment,
    required this.user,
    required this.responses,
  });
}

class Response {
  final int responseId;
  final String comment;
  final User user;

  Response({
    required this.responseId,
    required this.comment,
    required this.user,
  });
}

class User {
  final int userId;
  final String name;
  final String imageUrl;
  final String? role;

  User({
    required this.userId,
    required this.name,
    required this.imageUrl,
    this.role,
  });
}
