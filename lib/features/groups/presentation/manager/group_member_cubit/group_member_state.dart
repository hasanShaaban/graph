part of 'group_member_cubit.dart';

@immutable
sealed class GroupMemberState {}

final class GroupMemberInitial extends GroupMemberState {}
final class GroupMemberLoading extends GroupMemberState {}
final class GroupMemberSuccess extends GroupMemberState {
  final List<GroupMemberEntity> members;

  GroupMemberSuccess(this.members);
}
final class GroupMemberError extends GroupMemberState {
  final String errorMessage;

  GroupMemberError(this.errorMessage);
}
