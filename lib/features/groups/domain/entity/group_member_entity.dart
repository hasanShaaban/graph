class GroupMemberEntity {
  final String name;
  final String image;
  final SkillEntity skill;
  final bool isAdmin;

  const GroupMemberEntity({
    required this.name,
    required this.image,
    required this.skill,
    required this.isAdmin,
  });
}

class SkillEntity {
  final String skillName;
  final String skillLogo;

  const SkillEntity({
    required this.skillName,
    required this.skillLogo,
  });
}
