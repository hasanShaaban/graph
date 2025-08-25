class ProjectEntity {
  final int id;
  final String name;
  final YearEntity year;
  final MajorEntity? major;

  const ProjectEntity({
    required this.id,
    required this.name,
    required this.year,
     this.major,
  });
}

class YearEntity {
  final int id;
  final String yearName;

  const YearEntity({
    required this.id,
    required this.yearName,
  });
}

class MajorEntity {
  final int id;
  final String majorName;

  const MajorEntity({
    required this.id,
    required this.majorName,
  });
}


