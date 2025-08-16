part of 'credintials_cubit.dart';

@immutable
sealed class CredintialsState {}

final class CredintialsInitial extends CredintialsState {}


final class CredintialsLoading extends CredintialsState {}

final class CredintialsSuccess extends CredintialsState {
  final Map<String, dynamic> response;

  CredintialsSuccess(this.response);
  
}

final class CredintialsFailuer extends CredintialsState {
  final String errorMessage;

 CredintialsFailuer(this.errorMessage);
}
