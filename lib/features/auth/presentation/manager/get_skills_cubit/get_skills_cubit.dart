import 'package:bloc/bloc.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'get_skills_state.dart';

class GetSkillsCubit extends Cubit<GetSkillsState> {
  GetSkillsCubit(this.authRepo) : super(GetSkillsInitial());
  final AuthRepo authRepo;
  Future<void> getSkills() async {
    emit(GetSkillsLoading());
    var restult = await authRepo.getSkills();
    restult.fold(
      (failures) {
        emit(GetSkillsFailuer(failures.errMessage));
      },
      (signup) {
        emit(GetSkillsSuccess(signup));
      },
    );
  }
}
