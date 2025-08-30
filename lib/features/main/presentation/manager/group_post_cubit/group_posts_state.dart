part of 'group_posts_cubit.dart';

@immutable
sealed class GroupPostsState {}

final class GroupPostsInitial extends GroupPostsState {}

final class GroupPostsLoading extends GroupPostsState {}

final class GroupPostsSuccess extends GroupPostsState {
  final List<GroupPostEntity> posts;

  GroupPostsSuccess(this.posts);
}

final class GroupPostsError extends GroupPostsState {
  final String errorMessage;

  GroupPostsError(this.errorMessage);
}
