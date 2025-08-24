import 'package:graph/features/profile/data/models/skill_model.dart';
import 'package:graph/features/profile/data/models/social_link_model.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.year,
    required super.major,
    required super.bio,
    required super.gender,
    required super.cv,
    required super.image,
    required List<SocialLinkModel>? super.socialLinks,
    required super.rate,
    required List<SkillModel>? super.skills,
    required super.groupId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      year: List<String>.from(json['year'] ?? []),
      major: List<String>.from(json['major'] ?? []),
      bio: json['bio'],
      gender: json['gender'],
      cv: json['cv'],
      image: json['image'],
      socialLinks:
          (json['social_links'] as List<dynamic>?)
              ?.map((e) => SocialLinkModel.fromJson(e))
              .toList() ??
          [],
      rate: json['rate'] != null ? (json['rate'] as num).toDouble() : null,
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => SkillModel.fromJson(e))
              .toList() ??
          [],
      groupId: json['group_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'major': major,
      'bio': bio,
      'gender': gender,
      'cv': cv,
      'image': image,
      'social_links':
          socialLinks?.map((e) => (e as SocialLinkModel).toJson()).toList(),
      'rate': rate,
      'skills': skills?.map((e) => (e as SkillModel).toJson()).toList(),
      'group_id': groupId,
    };
  }
}
