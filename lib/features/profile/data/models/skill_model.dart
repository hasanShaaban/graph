import 'package:graph/features/profile/domain/entity/skill_entity.dart';

class SkillModel extends SkillEntity {
  const SkillModel({
    required int id,
    required String name,
    required String logoUrl,
  }) : super(id: id, name: name, logoUrl: logoUrl);

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo_url': logoUrl,
    };
  }
}