import 'package:graph/features/main/domain/entity/group_post_entity.dart';

class GroupPostModel extends GroupPostEntity {
  const GroupPostModel({
    required super.id,
    required super.description,
    required super.group,
    required super.skills,
    required super.groupMembers,
  });

  factory GroupPostModel.fromJson(Map<String, dynamic> json) {
    return GroupPostModel(
      id: json['id'] as int,
      description: json['description'] ?? '',
      group: GroupModel.fromJson(json['group']),
      skills: (json['skills'] as List)
          .map((e) => SkillModel.fromJson(e))
          .toList(),
      groupMembers: (json['group_members'] as List)
          .map((e) => GroupMemberModel.fromJson(e))
          .toList(),
    );
  }
}

class GroupModel extends GroupEntity {
  const GroupModel({
    required super.id,
    required super.groupName,
    required super.projectId,
    required super.project,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'] as int,
      groupName: json['group_name'] ?? '',
      projectId: json['project_id'] as int,
      project: json['project'] ?? '',
    );
  }
}

class SkillModel extends SkillEntity {
  const SkillModel({
    required super.id,
    required super.name,
    required super.logoUrl,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      logoUrl: json['logo_url'] ?? '',
    );
  }
}

class GroupMemberModel extends GroupMemberEntity {
  const GroupMemberModel({
    required super.id,
    required super.name,
    required super.profileImageUrl,
    required super.isAdmin,
  });

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      profileImageUrl: json['profile_image_url'] ?? '',
      isAdmin: json['is_admin'] == 1,
    );
  }
}
