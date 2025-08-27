
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';

part 'group_member_state.dart';

class GroupMemberCubit extends Cubit<GroupMemberState> {
  GroupMemberCubit(this.groupsRepo) : super(GroupMemberInitial());
  final GroupsRepo groupsRepo;

  Future<void> getGroupMembers({required int groupId}) async {
    emit(GroupMemberLoading());
    var result = await groupsRepo.getGroupMembers(groupId: groupId);
    result.fold(
      (failures) => emit(GroupMemberError(failures.errMessage)),
      (groupMembers) => emit(GroupMemberSuccess(groupMembers)),
    );
  }
}
