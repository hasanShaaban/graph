
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/groups/domain/entity/group_info_entity.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';

part 'group_info_state.dart';

class GroupInfoCubit extends Cubit<GroupInfoState> {
  final GroupsRepo groupsRepo;
  GroupInfoCubit(this.groupsRepo) : super(GroupInfoInitial());

  Future<void> getGroupInfo({required int projectId}) async {
    emit(GroupInfoLoading());
    var result = await groupsRepo.getGroupInfo(projectId: projectId);
    result.fold(
      (failures) => emit(GroupInfoError(failures.errMessage)),
      (groupInfo) => emit(GroupInfoSuccess(groupInfo)),
    );
  }
}
