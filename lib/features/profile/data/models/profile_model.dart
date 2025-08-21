import 'package:graph/features/profile/data/models/skill_model.dart';
import 'package:graph/features/profile/data/models/social_link_model.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required int id,
    required String name,
    required List<String> year,
    required List<String> major,
    required String? bio,
    required String gender,
    required String? cv,
    required String? image,
    required List<SocialLinkModel>? socialLinks,
    required double? rate,
    required List<SkillModel>? skills,
    required int? groupId,
  }) : super(
         id: id,
         name: name,
         year: year,
         major: major,
         bio: bio,
         gender: gender,
         cv: cv,
         image: image,
         socialLinks: socialLinks,
         rate: rate,
         skills: skills,
         groupId: groupId,
       );

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
