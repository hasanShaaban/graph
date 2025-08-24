class ProjectEntity {
  final int id;
  final String name;
  final String description;
  final int? majorId;
  final int? yearId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    this.majorId,
    this.yearId,
    required this.createdAt,
    required this.updatedAt,
  });
}


