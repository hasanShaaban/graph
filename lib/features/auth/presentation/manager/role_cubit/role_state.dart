part of 'role_cubit.dart';

@immutable
sealed class RoleState {}

final class RoleInitial extends RoleState {}

final class RoleLoading extends RoleState {}

final class RoleSuccess extends RoleState {
  final Map<String, dynamic> response;

  RoleSuccess(this.response);
  
}

final class RoleFailuer extends RoleState {
  final String errorMessage;

  RoleFailuer(this.errorMessage);
}

