import 'package:bloc/bloc.dart';
import '../../../domain/repos/create_post_repo.dart';
import 'package:meta/meta.dart';

part 'hashtag_search_state.dart';

class HashtagSearchCubit extends Cubit<HashtagSearchState> {
  HashtagSearchCubit(this.createPostRepo) : super(HashtagSearchInitial());
  final CreatePostRepo createPostRepo;
  Future<void> hashtagSearch({required String name, }) async {
        if (name.isEmpty) {
      emit(HashtagSearchInitial());
      return;
    }
    emit(HashtagSearchLoading());
    var restult = await createPostRepo.getHashtagSearch(name: name);
    restult.fold(
      (failures) {
        emit(HashtagSearchFailuer(failures.errMessage));
      },
      (search) {
        emit(HashtagSearchSuccess(search));
      },
    );
  }
}
