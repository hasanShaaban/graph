
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';

class NormalPostModel extends NormalPostEntity {
  const NormalPostModel({
    required super.postId,
    required super.description,
    required super.files,
    required super.users,
    super.title,
    super.project,
    required super.privacy,
    required super.createdAt,
    required super.reactionsCount,
    required super.commentsCount,
    required super.isAdmin,
  });

  factory NormalPostModel.fromJson(Map<String, dynamic> json) {
    return NormalPostModel(
      postId: json['post_id'],
      description: json['description'] ?? '',
      files: List<String>.from(json['files'] ?? []),
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e))
              .toList() ??
          [],
      title: json['title'],
      project: json['project'],
      privacy: json['privacy'] ?? 'public',
      createdAt: json['created_at'] ?? '',
      reactionsCount: json['reactions_count'] ?? 0,
      commentsCount: json['comments_count'] ?? 0,
      isAdmin: (json['is_admin'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
      'description': description,
      'files': files,
      'users': users.map((u) => (u as UserModel).toJson()).toList(),
      'title': title,
      'project': project,
      'privacy': privacy,
      'created_at': createdAt,
      'reactions_count': reactionsCount,
      'comments_count': commentsCount,
      'is_admin': isAdmin ? 1 : 0,
    };
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      profileImageUrl: json['profile_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_image_url': profileImageUrl,
    };
  }
}

