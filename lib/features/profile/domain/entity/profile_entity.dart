import '../../../auth/data/models/signup_data_model.dart';

import 'skill_entity.dart';
import 'social_link_entity.dart';


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
  
  ProfileEntity copyWith({
    String? name,
    String? bio,
    String? gender,
    List<String>? year,
    List<String>? major,
    List<SkillEntity>? skills,
    List<SocialLinkEntity>? socialLinks,
    String? cv,
    String? image,
    int? id,
    double? rate,
    int? groupId,
  }) {
    return ProfileEntity(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      year: year ?? this.year,
      major: major ?? this.major,
      skills: skills ?? this.skills,
      socialLinks: socialLinks ?? this.socialLinks,
      cv: cv ?? this.cv,
      image: image ?? this.image,
      id: id ?? this.id,
      rate: rate ?? this.rate,
      groupId: groupId ?? this.groupId,
    );
  }
  factory ProfileEntity.fromSignup(SignupDataModel signupData) {
    return ProfileEntity(
      name: "${signupData.firstName} ${signupData.lastName}",
      bio: "",
      gender: signupData.gender ?? "Male",
      year: [signupData.studyYear ?? ""],
      major: [signupData.specialization ?? ""],
      skills: [],
      socialLinks: [],
      cv: "",
      image: "",
      id: 0,
      rate: 0,
      groupId: 0,
    );
  }
}
