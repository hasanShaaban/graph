part of 'project_cubit.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}
final class ProjectLoading extends ProjectState {}
final class ProjectSuccess extends ProjectState {
  final List<ProjectEntity> response;

  ProjectSuccess(this.response);
}
final class ProjectError extends ProjectState {
  final String errorMessage;

  ProjectError(this.errorMessage);
}
