part of 'post_skills_cubit.dart';

@immutable
sealed class PostSkillsState {}

final class PostSkillsInitial extends PostSkillsState {}


final class PostSkillsLoading extends PostSkillsState {}

final class PostSkillsSuccess extends PostSkillsState {
  final Map<String, dynamic> response;

  PostSkillsSuccess(this.response);
  
}

final class PostSkillsFailuer extends PostSkillsState {
  final String errorMessage;

PostSkillsFailuer(this.errorMessage);
}

