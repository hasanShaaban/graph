import 'package:graph/features/groups/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required int id,
    required String name,
    required String description,
    int? majorId,
    int? yearId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          name: name,
          description: description,
          majorId: majorId,
          yearId: yearId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      majorId: json['major_id'],
      yearId: json['year_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "major_id": majorId,
      "year_id": yearId,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}
