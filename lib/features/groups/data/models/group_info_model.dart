import 'package:graph/features/groups/domain/entity/group_info_entity.dart';

class GroupInfoModel extends GroupInfoEntity {
  const GroupInfoModel({
    required super.id,
    required super.groupName,
    required super.groupProject,
    required super.isAdmin,
  });

  factory GroupInfoModel.fromJson(Map<String, dynamic> json) {
    return GroupInfoModel(
      id: json['id'],
      groupName: json['group_name'] ?? '',
      groupProject: json['group_project'] ?? '',
      isAdmin: (json['is_admin'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'group_name': groupName,
      'group_project': groupProject,
      'is_admin': isAdmin ? 1 : 0,
    };
  }
}

