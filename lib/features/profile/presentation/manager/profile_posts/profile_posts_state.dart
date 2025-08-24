part of 'profile_posts_cubit.dart';

@immutable
sealed class ProfilePostsState {}

final class ProfilePostsInitial extends ProfilePostsState {}
final class ProfilePostsLoading extends ProfilePostsState {}
final class ProfilePostsSuccess extends ProfilePostsState {
  final List<NormalPostEntity> posts;
  ProfilePostsSuccess(this.posts);
}
final class ProfilePostsError extends ProfilePostsState {
  final String errorMessage;
  ProfilePostsError(this.errorMessage);
}
