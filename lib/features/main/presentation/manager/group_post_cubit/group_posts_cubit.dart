import 'package:bloc/bloc.dart';
import 'package:graph/features/main/domain/entity/group_post_entity.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

part 'group_posts_state.dart';

class GroupPostsCubit extends Cubit<GroupPostsState> {
  GroupPostsCubit(this.mainRepo) : super(GroupPostsInitial());
  final MainRepo mainRepo;

  Future<void> getGroupsPagePosts() async {
    emit(GroupPostsLoading());
    var result = await mainRepo.getGroupsPagePosts();
    result.fold(
      (l) => emit(GroupPostsError(l.errMessage)),
      (r) => emit(GroupPostsSuccess(r)),
    );
  }
}
