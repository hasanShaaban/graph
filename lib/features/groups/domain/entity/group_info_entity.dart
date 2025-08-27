class GroupInfoEntity {
  final int id;
  final String groupName;
  final String groupProject;
  final bool isAdmin;

  const GroupInfoEntity({
    required this.id,
    required this.groupName,
    required this.groupProject,
    required this.isAdmin,
  });
}
