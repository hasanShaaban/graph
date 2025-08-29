part of 'get_all_project_cubit.dart';

@immutable
sealed class GetAllProjectState {}

final class GetAllProjectInitial extends GetAllProjectState {}

final class GetAllProjectLoading extends GetAllProjectState {}

final class GetAllProjectSuccess extends GetAllProjectState {
  final Map<String, dynamic> response;

GetAllProjectSuccess(this.response);
  
}

final class GetAllProjectFailuer extends GetAllProjectState {
  final String errorMessage;

 GetAllProjectFailuer(this.errorMessage);
}

