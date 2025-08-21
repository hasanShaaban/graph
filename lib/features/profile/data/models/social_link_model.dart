import 'package:graph/features/profile/domain/entity/social_link_entity.dart';

class SocialLinkModel extends SocialLinkEntity {
  const SocialLinkModel({
    required int id,
    required String name,
    required String link,
  }) : super(id: id, name: name, link: link);

  factory SocialLinkModel.fromJson(Map<String, dynamic> json) {
    return SocialLinkModel(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'link': link,
    };
  }
}