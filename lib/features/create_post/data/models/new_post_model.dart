import '../../domain/entity/post_entity.dart';

class NewPostModel extends PostEntity {
  NewPostModel({
    required super.description,
    super.title,
    super.projectId,
    required super.privacy,
    super.image,
    super.mentionIds,
    super.tags,
  });

  factory NewPostModel.fromJson(Map<String, dynamic> json) {
    return NewPostModel(
      description: json['description'],
      title: json['title'],
      projectId: json['project_id'],
      privacy: json['privacy'],
      image: json['files[]'],
      mentionIds: json['ids[]'],
      tags: json['ids[]'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': description,
      'project_id': projectId,
      'privacy': privacy,

      'ids[]': mentionIds,
      'ids[]': tags,
    };
  }
}
