part of 'post_new_post_cubit.dart';

@immutable
sealed class PostNewPostState {}

final class PostNewPostInitial extends PostNewPostState {}


final class  PostNewPostLoading extends PostNewPostState {}

final class  PostNewPostSuccess extends PostNewPostState {
  final Map<String, dynamic> response;

   PostNewPostSuccess(this.response);
  
}

final class  PostNewPostFailuer extends PostNewPostState {
  final String errorMessage;

  PostNewPostFailuer(this.errorMessage);
}
