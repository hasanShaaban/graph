import 'package:graph/features/post_details/domain/entity/reaction_entity.dart';

class ReactionModel extends ReactionEntity {
  ReactionModel({
    required int reactionId,
    required String reaction,
    required List<UserModel> users,
  }) : super(
          reactionId: reactionId,
          reaction: reaction,
          users: users,
        );

  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(
      reactionId: json['reaction_id'],
      reaction: json['reaction'],
      users: (json['user'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reaction_id': reactionId,
      'reaction': reaction,
      'user': users.map((e) => (e as UserModel).toJson()).toList(),
    };
  }
}

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String profileImageUrl,
    required String role,
  }) : super(
          id: id,
          name: name,
          profileImageUrl: profileImageUrl,
          role: role,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profile_image_url'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_image_url': profileImageUrl,
      'role': role,
    };
  }
}
