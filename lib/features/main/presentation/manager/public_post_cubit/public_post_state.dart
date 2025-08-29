part of 'public_post_cubit.dart';

@immutable
sealed class PublicPostState {}

final class PublicPostInitial extends PublicPostState {}
final class PublicPostLoading extends PublicPostState {}
final class PublicPostSuccess extends PublicPostState {
  final List<NormalPostEntity> posts;

  PublicPostSuccess(this.posts);
}
final class PublicPostError extends PublicPostState {
  final String errorMessage;

  PublicPostError(this.errorMessage);
}
