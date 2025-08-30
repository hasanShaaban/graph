class ReactionEntity {
  final int reactionId;
  final String reaction;
  final List<User> users;

  ReactionEntity({
    required this.reactionId,
    required this.reaction,
    required this.users,
  });
}

class User {
  final int id;
  final String name;
  final String profileImageUrl;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.role,
  });
}