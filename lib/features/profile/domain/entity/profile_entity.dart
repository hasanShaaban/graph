import 'package:graph/features/profile/domain/entity/skill_entity.dart';
import 'package:graph/features/profile/domain/entity/social_link_entity.dart';


class ProfileEntity {
  final int id;
  final String name;
  final List<String> year;
  final List<String> major;
  final String? bio;
  final String gender;
  final String? cv;
  final String? image;
  final List<SocialLinkEntity>? socialLinks;
  final double? rate;
  final List<SkillEntity>? skills;
  final int? groupId;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.year,
    required this.major,
    required this.bio,
    required this.gender,
    required this.cv,
    required this.image,
    required this.socialLinks,
    required this.rate,
    required this.skills,
    required this.groupId,
  });
}
