import 'package:bloc/bloc.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_posts_state.dart';

class ProfilePostsCubit extends Cubit<ProfilePostsState> {
  ProfilePostsCubit(this.profileRepo) : super(ProfilePostsInitial());
  final ProfileRepo profileRepo;

  Future<void> getProfilePosts() async {
    emit(ProfilePostsLoading());
    var restult = await profileRepo.getProfilePosts();
    restult.fold(
      (failure) => emit(ProfilePostsError(failure.errMessage)),
      (response) => emit(ProfilePostsSuccess(response)),
    );
  }
}
