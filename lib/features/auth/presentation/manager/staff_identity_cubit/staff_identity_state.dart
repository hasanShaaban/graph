part of 'staff_identity_cubit.dart';

@immutable
sealed class StaffIdentityState {}

final class StaffIdentityInitial extends StaffIdentityState {}

final class StaffIdentityLoading extends StaffIdentityState {}

final class StaffIdentitySuccess extends StaffIdentityState {
  final Map<String, dynamic> response;

  StaffIdentitySuccess(this.response);
}

final class StaffIdentityFailuer extends StaffIdentityState {
  final String errorMessage;

  StaffIdentityFailuer(this.errorMessage);
}
