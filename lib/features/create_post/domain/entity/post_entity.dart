import 'dart:io';

class PostEntity {
  final String description;
  final String? title;
  final int? projectId;
  final String privacy;
  final List<File>? image;
    final List<int>? mentionIds; 

  PostEntity( {required this.description,  this.title,  this.projectId, required this.privacy,  this.image,this.mentionIds,});
  
}