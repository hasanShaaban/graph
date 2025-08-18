class ProfileEntity {
  final int id;
  final String name;
  final String year;
  final String major;
  final String? bio;
  final String gender;
  final String? cv;
  final String? image;
  final Map<String, dynamic>? socialLinks; // flexible
  final double? rate;
  final List<String>? skills;
  final int? groupId;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.year,
    required this.major,
    this.bio,
    required this.gender,
    this.cv,
    this.image,
    this.socialLinks,
    this.rate,
    this.skills,
    this.groupId,
  });
}
