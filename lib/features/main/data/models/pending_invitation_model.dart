import 'package:graph/features/main/domain/entity/pending_invitation_entity.dart';

class PendingInvitationModel extends PendingInvitationEntity {
  PendingInvitationModel({
    required int invitationId,
    required String groupName,
    required String senderUser,
    required int projectId,
    required String projectName,
    required SkillModel skill,
  }) : super(
          invitationId: invitationId,
          groupName: groupName,
          senderUser: senderUser,
          projectId: projectId,
          projectName: projectName,
          skill: skill,
        );

  factory PendingInvitationModel.fromJson(Map<String, dynamic> json) {
    return PendingInvitationModel(
      invitationId: json['invitation_id'],
      groupName: json['group_name'],
      senderUser: json['sender_user'],
      projectId: json['project_id'],
      projectName: json['project_name'],
      skill: SkillModel.fromJson(json['skill']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invitation_id': invitationId,
      'group_name': groupName,
      'sender_user': senderUser,
      'project_id': projectId,
      'project_name': projectName,
      'skill': (skill as SkillModel).toJson(),
    };
  }
}


class SkillModel extends Skill {
  SkillModel({
    required int skillId,
    required String skillName,
    required String logoUrl,
  }) : super(
          skillId: skillId,
          skillName: skillName,
          logoUrl: logoUrl,
        );

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      skillId: json['skill_id'],
      skillName: json['skill_name'],
      logoUrl: json['logo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skill_id': skillId,
      'skill_name': skillName,
      'logo_url': logoUrl,
    };
  }
}