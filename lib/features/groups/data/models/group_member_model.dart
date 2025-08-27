import 'package:graph/features/groups/domain/entity/group_member_entity.dart';

class GroupMemberModel extends GroupMemberEntity {
  const GroupMemberModel({
    required super.name,
    required super.image,
    required super.skill,
    required super.isAdmin,
  });

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      skill: SkillModel.fromJson(json['skill']),
      isAdmin: (json['is_admin'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'skill': (skill as SkillModel).toJson(),
      'is_admin': isAdmin ? 1 : 0,
    };
  }
}

class SkillModel extends SkillEntity {
  const SkillModel({
    required super.skillName,
    required super.skillLogo,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      skillName: json['skill_name'] ?? '',
      skillLogo: json['skill_logo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skill_name': skillName,
      'skill_logo': skillLogo,
    };
  }
}
