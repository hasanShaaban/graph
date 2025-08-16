part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final Map<String, dynamic> response;

  LoginSuccess(this.response);
  
}

final class LoginFailuer extends LoginState {
  final String errorMessage;

  LoginFailuer(this.errorMessage);
}
