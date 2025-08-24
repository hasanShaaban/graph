// data/models/message_model.dart
import 'package:graph/features/main/domain/entity/user_image_entity.dart';

class UserImageModel extends UserImageEntity {
  const UserImageModel({
    required super.id,
    required super.profileImageUrl,
    required super.role,
  });

  factory UserImageModel.fromJson(Map<String, dynamic> json) {
    final message = json['message'] ?? {};
    return UserImageModel(
      id: message['id'] ?? 0,
      profileImageUrl: message['profile_image_url'] ?? '',
      role: message['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": {
        "id": id,
        "profile_image_url": profileImageUrl,
        "role": role,
      }
    };
  }
}
