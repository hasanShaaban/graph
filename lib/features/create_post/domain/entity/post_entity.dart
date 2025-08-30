import 'dart:io';

class PostEntity {
  final String description;
  final String? title;
  final int? projectId;
  final String privacy;
  final List<File>? image;
    final List<int>? mentionIds; 
      final List<int>? tags; 
         final List<int>? hashIds;      
 final List<String>? newHashtags;

  PostEntity(  {required this.description,  this.title,  this.projectId, required this.privacy,  this.image,this.mentionIds,this.tags,required this.hashIds,required this.newHashtags,});
  
}