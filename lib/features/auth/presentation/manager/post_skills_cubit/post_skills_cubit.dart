import 'package:bloc/bloc.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'post_skills_state.dart';

class PostSkillsCubit extends Cubit<PostSkillsState> {
  PostSkillsCubit(this.authRepo) : super(PostSkillsInitial());
  
  final AuthRepo authRepo;

  Future<void> PostSkills(Map<String,List<int>> chosenTool) async {
    emit(PostSkillsLoading());
    var restult = await authRepo.postSkills(chosenTools: chosenTool);
    restult.fold(
      (failures) {
        emit(PostSkillsFailuer(failures.errMessage));
      },
      (postSkills) {
        emit(PostSkillsSuccess(postSkills));
      },
    );
  }
}
