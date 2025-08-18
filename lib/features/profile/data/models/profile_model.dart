import 'package:graph/features/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required int id,
    required String name,
    required String year,
    required String major,
    String? bio,
    required String gender,
    String? cv,
    String? image,
    Map<String, dynamic>? socialLinks,
    double? rate,
    List<String>? skills,
    int? groupId,
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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      year: json['year'] ?? '',
      major: json['major'] ?? '',
      bio: json['bio'],
      gender: json['gender'] ?? '',
      cv: json['cv'],
      image: json['image'],
      socialLinks: json['social_links'],
      rate: (json['rate'] != null) ? double.tryParse(json['rate'].toString()) : null,
      skills: (json['skills'] != null) ? List<String>.from(json['skills']) : null,
      groupId: json['group_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "year": year,
      "major": major,
      "bio": bio,
      "gender": gender,
      "cv": cv,
      "image": image,
      "social_links": socialLinks,
      "rate": rate,
      "skills": skills,
      "group_id": groupId,
    };
  }
}
