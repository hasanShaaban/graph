part of 'group_info_cubit.dart';

@immutable
sealed class GroupInfoState {}

final class GroupInfoInitial extends GroupInfoState {}
final class GroupInfoLoading extends GroupInfoState {}
final class GroupInfoSuccess extends GroupInfoState {
  final GroupInfoEntity response;

  GroupInfoSuccess(this.response);
}
final class GroupInfoError extends GroupInfoState {
  final String errorMessage;

  GroupInfoError(this.errorMessage);
}
