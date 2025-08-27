import 'package:graph/features/groups/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.name,
    required super.year,
    super.major,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'] ?? '',
      year: YearModel.fromJson(json['year']),
      major: json['major'] == null ? null : MajorModel.fromJson(json['major']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': (year as YearModel).toJson(),
      'major':major != null ? (major as MajorModel).toJson() : null,
    };
  }
}

class YearModel extends YearEntity {
  const YearModel({required super.id, required super.yearName});

  factory YearModel.fromJson(Map<String, dynamic> json) {
    return YearModel(id: json['id'], yearName: json['Year_name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'Year_name': yearName};
  }
}

class MajorModel extends MajorEntity {
  const MajorModel({required super.id, required super.majorName});

  factory MajorModel.fromJson(Map<String, dynamic> json) {
    return MajorModel(id: json['id'], majorName: json['Major_name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'Major_name': majorName};
  }
}
