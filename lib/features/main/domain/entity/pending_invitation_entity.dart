
class PendingInvitationEntity {
  final int invitationId;
  final String groupName;
  final String senderUser;
  final int projectId;
  final String projectName;
  final Skill skill;

  PendingInvitationEntity({
    required this.invitationId,
    required this.groupName,
    required this.senderUser,
    required this.projectId,
    required this.projectName,
    required this.skill,
  });
}



class Skill {
  final int skillId;
  final String skillName;
  final String logoUrl;

  Skill({
    required this.skillId,
    required this.skillName,
    required this.logoUrl,
  });
}