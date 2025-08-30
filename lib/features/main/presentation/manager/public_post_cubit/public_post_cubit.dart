import 'package:bloc/bloc.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

part 'public_post_state.dart';

class PublicPostCubit extends Cubit<PublicPostState> {
  PublicPostCubit(this.mainRepo) : super(PublicPostInitial());
  final MainRepo mainRepo;

  Future<void> getMainPagePosts() async {
    emit(PublicPostLoading());
    var restult = await mainRepo.getMainPagePosts();
    restult.fold(
      (failuer) => emit(PublicPostError(failuer.errMessage)),
      (posts) => emit(PublicPostSuccess(posts)),
    );
  }
}
