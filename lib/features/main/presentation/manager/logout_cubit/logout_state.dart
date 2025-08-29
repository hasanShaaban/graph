part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {
  final Map<String,dynamic> response;

  LogoutSuccess(this.response);
}

final class LogoutError extends LogoutState {
  final String errorMessage;

  LogoutError(this.errorMessage);
}