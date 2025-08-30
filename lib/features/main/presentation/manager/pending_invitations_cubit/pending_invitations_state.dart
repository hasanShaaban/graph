part of 'pending_invitations_cubit.dart';

@immutable
sealed class PendingInvitationsState {}

final class PendingInvitationsInitial extends PendingInvitationsState {}
final class PendingInvitationsLoading extends PendingInvitationsState {}
final class PendingInvitationsSuccess extends PendingInvitationsState {
  final List<PendingInvitationEntity> response;

  PendingInvitationsSuccess(this.response);
}
final class PendingInvitationsError extends PendingInvitationsState {
  final String errorMessage;

  PendingInvitationsError(this.errorMessage);
}
