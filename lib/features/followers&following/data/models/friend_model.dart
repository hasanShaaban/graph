// data/models/friend_model.dart

import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';

class FriendModel extends FriendEntity {
  const FriendModel({
    required super.id,
    required super.name,
    required super.profileImageUrl,
    required super.role,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profile_image_url'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "profile_image_url": profileImageUrl,
      "role": role,
    };
  }
}
