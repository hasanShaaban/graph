part of 'get_skills_cubit.dart';

@immutable
sealed class GetSkillsState {}

final class GetSkillsInitial extends GetSkillsState {}

final class GetSkillsLoading extends GetSkillsState {}

final class GetSkillsSuccess extends GetSkillsState {
  final List<dynamic> response;

GetSkillsSuccess(this.response);
  
}

final class GetSkillsFailuer extends GetSkillsState {
  final String errorMessage;

 GetSkillsFailuer(this.errorMessage);
}



