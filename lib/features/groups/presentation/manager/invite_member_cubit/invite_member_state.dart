part of 'invite_member_cubit.dart';

@immutable
sealed class InviteMemberState {}

final class InviteMemberInitial extends InviteMemberState {}
final class InviteMemberLoading extends InviteMemberState {}
final class InviteMemberSuccess extends InviteMemberState {
  final String message;
  InviteMemberSuccess(this.message);
}
final class InviteMemberError extends InviteMemberState {
  final String errorMessage;

  InviteMemberError(this.errorMessage);
}
