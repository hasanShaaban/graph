class GroupPostEntity {
  final int id;
  final String description;
  final GroupEntity group;
  final List<SkillEntity> skills;
  final List<GroupMemberEntity> groupMembers;

  const GroupPostEntity({
    required this.id,
    required this.description,
    required this.group,
    required this.skills,
    required this.groupMembers,
  });
}

class GroupEntity {
  final int id;
  final String groupName;
  final int projectId;
  final String project;

  const GroupEntity({
    required this.id,
    required this.groupName,
    required this.projectId,
    required this.project,
  });
}

class SkillEntity {
  final int id;
  final String name;
  final String logoUrl;

  const SkillEntity({
    required this.id,
    required this.name,
    required this.logoUrl,
  });
}

class GroupMemberEntity {
  final int id;
  final String name;
  final String profileImageUrl;
  final bool isAdmin;

  const GroupMemberEntity({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.isAdmin,
  });
}
