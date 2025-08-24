import 'package:bloc/bloc.dart';
import 'package:graph/features/create_post/domain/repos/create_post_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_project_state.dart';

class GetAllProjectCubit extends Cubit<GetAllProjectState> {
  GetAllProjectCubit(this.createPostRepo) : super(GetAllProjectInitial());
  final CreatePostRepo createPostRepo;
  Future<void> getAllProjects() async {
    emit(GetAllProjectLoading());
    var restult = await createPostRepo.getAllProject();
    restult.fold(
      (failures) {
        emit(GetAllProjectFailuer(failures.errMessage));
      },
      (signup) {
        emit(GetAllProjectSuccess(signup));
      },
    );
  }
}
