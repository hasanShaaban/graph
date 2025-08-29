part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}


final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final Map<String, dynamic> response;

  ChangePasswordSuccess(this.response);
  
}

final class ChangePasswordFailuer extends ChangePasswordState {
  final String errorMessage;

 ChangePasswordFailuer(this.errorMessage);
}
