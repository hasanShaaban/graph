import '../../domain/entity/post_entity.dart';

class NewPostModel extends PostEntity {
  NewPostModel({
    required super.description,
    super.title,
    super.projectId,
    required super.privacy,
    super.image,
    super.mentionIds,
    super.tags, required super.hashIds, required super.newHashtags,
    
  });

  factory NewPostModel.fromJson(Map<String, dynamic> json) {
    return NewPostModel(
      description: json['description'],
      title: json['title'],
      projectId: json['project_id'],
      privacy: json['privacy'],
      image: json['files[]'],
      mentionIds: json['ids[]'],
       hashIds: List<int>.from(json['hash_ids[]'] ?? []), 
       newHashtags: List<String>.from(json['new_hashtags[]'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'project_id': projectId,
      'privacy': privacy,

      'ids[]': mentionIds,
 
      'hash_ids[]': hashIds,
      'new_hashtags[]': newHashtags,
    };
  }
}
