
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit(this.groupsRepo) : super(CreateGroupInitial());
  final GroupsRepo groupsRepo;

  Future<void> createGroup({required int projectId, required int skillID}) async {
    emit(CreateGroupLoading());
    var result = await groupsRepo.createGroup(projectId: projectId, skillID: skillID);
    result.fold(
      (failures) => emit(CreateGroupError(failures.errMessage)),
      (groupInfo) => emit(CreateGroupSuccess('success')),
    );
  }
}
