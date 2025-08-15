part of 'company_cubit.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyLoading extends CompanyState {}

final class CompanySuccess extends CompanyState {
  final Map<String, dynamic> response;

  CompanySuccess(this.response);
  
}

final class CompanyFailuer extends CompanyState {
  final String errorMessage;

 CompanyFailuer(this.errorMessage);
}


