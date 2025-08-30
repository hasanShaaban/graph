import 'package:bloc/bloc.dart';
import 'package:graph/features/create_post/data/models/hashtag_model.dart';
import 'package:graph/features/create_post/domain/repos/create_post_repo.dart';
import 'package:graph/features/create_post/presentation/manager/hashtag_search_cubit/hashtag_search_state.dart';

class PostHashtagSearchCubit extends Cubit<PostHashtagSearchState> {
  final CreatePostRepo createPostRepo;

  PostHashtagSearchCubit(this.createPostRepo) : super(PostHashtagSearchInitial());

  Future<void> postHashtagSearch({required String name}) async {
  if (name.isEmpty) {
    emit(PostHashtagSearchInitial());
    return;
  }

  emit(PostHashtagSearchLoading());

  try {
    final result = await createPostRepo.postHashtagSearch(name: name);

    result.fold(
      (failure) {
        emit(PostHashtagSearchFailure(failure.toString()));
      },
      (data) {
        // حول الـ Map لــ HashtagModel
        final hashtags = HashtagModel.fromJson(data);
        emit(PostHashtagSearchSuccess(hashtags));
      },
    );
  } catch (e) {
    emit(PostHashtagSearchFailure(e.toString()));
  }
}

}
