import 'package:bloc/bloc.dart';
import 'package:graph/features/main/domain/entity/pending_invitation_entity.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

part 'pending_invitations_state.dart';

class PendingInvitationsCubit extends Cubit<PendingInvitationsState> {
  PendingInvitationsCubit(this.mainRepo) : super(PendingInvitationsInitial());

  final MainRepo mainRepo;

  Future<void> getPendingInvitations() async {
    emit(PendingInvitationsLoading());
    var result = await mainRepo.getPendingInvitations();
    result.fold(
      (failuer) => emit(PendingInvitationsError(failuer.errMessage)),
      (response) => emit(PendingInvitationsSuccess(response)),
    );
  }
}
