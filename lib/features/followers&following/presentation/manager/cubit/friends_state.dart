part of 'friends_cubit.dart';

@immutable
sealed class FriendsState {}

final class FriendsInitial extends FriendsState {}
final class FriendsLoading extends FriendsState {}
final class FriendsSuccess extends FriendsState {
  final FollowData follow;

  FriendsSuccess(this.follow);
}
final class FriendsError extends FriendsState {
  final String errorMessage;

  FriendsError(this.errorMessage);
}
