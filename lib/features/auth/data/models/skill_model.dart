class SkillModel {
  final int id;
  final String name;
  final String icon;

  SkillModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'],
      name: json['name'],
      icon: json['logo_url'],
    );
  }
}