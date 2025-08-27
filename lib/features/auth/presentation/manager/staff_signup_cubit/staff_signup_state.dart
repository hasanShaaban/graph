part of 'staff_signup_cubit.dart';

@immutable
sealed class StaffSignupState {}

final class StaffSignupInitial extends StaffSignupState {}

final class StaffSignupLoading extends StaffSignupState {}

final class StaffSignupSuccess extends StaffSignupState {
  final Map<String, dynamic> response;

  StaffSignupSuccess(this.response);
  
}

final class StaffSignupFailuer extends StaffSignupState {
  final String errorMessage;

  StaffSignupFailuer(this.errorMessage);
}

