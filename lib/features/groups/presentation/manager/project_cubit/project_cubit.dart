
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this.groupsRepo) : super(ProjectInitial());

  final GroupsRepo groupsRepo;

  Future<void> getProjects({required int yearId, int? majorId}) async {
    emit(ProjectLoading());
    var result = await groupsRepo.getProjects(yearId: yearId, majorId: majorId);
    result.fold(
      (failures) => emit(ProjectError(failures.errMessage)),
      (projects) => emit(ProjectSuccess(projects)),
    );
  }
}
