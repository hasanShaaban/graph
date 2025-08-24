
class NormalPostEntity {
  final int postId;
  final String description;
  final List<String> files;
  final List<UserEntity> users;
  final String? title;
  final String? project;
  final String privacy;
  final String createdAt;
  final int reactionsCount;
  final int commentsCount;
  final bool isAdmin;

  const NormalPostEntity({
    required this.postId,
    required this.description,
    required this.files,
    required this.users,
    this.title,
    this.project,
    required this.privacy,
    required this.createdAt,
    required this.reactionsCount,
    required this.commentsCount,
    required this.isAdmin,
  });
}

class UserEntity {
  final int id;
  final String name;
  final String profileImageUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.profileImageUrl,
  });
}
