
import 'package:graph/features/post_details/domain/entity/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required int commentId,
    required String comment,
    required UserModel user,
    required List<ResponseModel> responses,
  }) : super(
          commentId: commentId,
          comment: comment,
          user: user,
          responses: responses,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['comment_id'],
      comment: json['comment'],
      user: UserModel.fromJson(json['user']),
      responses: (json['responses'] as List<dynamic>)
          .map((e) => ResponseModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
      'comment': comment,
      'user': (user as UserModel).toJson(),
      'responses': responses.map((e) => (e as ResponseModel).toJson()).toList(),
    };
  }
}

class ResponseModel extends Response {
  ResponseModel({
    required int responseId,
    required String comment,
    required UserModel user,
  }) : super(
          responseId: responseId,
          comment: comment,
          user: user,
        );

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      responseId: json['response_id'],
      comment: json['comment'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_id': responseId,
      'comment': comment,
      'user': (user as UserModel).toJson(),
    };
  }
}

class UserModel extends User {
  UserModel({
    required int userId,
    required String name,
    required String imageUrl,
    String? role,
  }) : super(
          userId: userId,
          name: name,
          imageUrl: imageUrl,
          role: role,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      name: json['name'],
      imageUrl: json['image_url'],
      role: json['role'], // may be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'image_url': imageUrl,
      'role': role,
    };
  }
}
