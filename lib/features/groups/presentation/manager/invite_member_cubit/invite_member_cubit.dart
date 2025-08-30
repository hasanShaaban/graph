import 'package:bloc/bloc.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';
import 'package:meta/meta.dart';

part 'invite_member_state.dart';

class InviteMemberCubit extends Cubit<InviteMemberState> {
  InviteMemberCubit(this.groupsRepo) : super(InviteMemberInitial());
  final GroupsRepo groupsRepo;

  Future<void> inviteMember({
    required int projectId,
    required int skillID,
    required int groupId,
    required int userId,
  }) async {
    emit(InviteMemberLoading());
    var result = await groupsRepo.inviteMember(projectId: projectId, skillID: skillID, groupId: groupId, userId: userId);
    result.fold((failuer) => emit(InviteMemberError(failuer.errMessage)), (response)=>emit(InviteMemberSuccess(response['message'])));
  }
}
