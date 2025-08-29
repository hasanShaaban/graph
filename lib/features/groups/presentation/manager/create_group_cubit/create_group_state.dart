part of 'create_group_cubit.dart';

@immutable
sealed class CreateGroupState {}

final class CreateGroupInitial extends CreateGroupState {}
final class CreateGroupSuccess extends CreateGroupState {
  final String message;
  CreateGroupSuccess(this.message);
}
final class CreateGroupError extends CreateGroupState {
  final String errorMessage;
  CreateGroupError(this.errorMessage);
}
final class CreateGroupLoading extends CreateGroupState {}
