  part of 'verification_cubit_cubit.dart';

  @immutable
  sealed class VerificationCubitState {}

  final class VerificationCubitInitial extends VerificationCubitState {}



  final class VerificationLoading extends VerificationCubitState {}

  final class VerificationSuccess extends VerificationCubitState {
    final Map<String, dynamic> response;

    VerificationSuccess(this.response);
    
  }

  final class VerificationFailuer extends VerificationCubitState {
    final String errorMessage;

    VerificationFailuer(this.errorMessage);
  }

