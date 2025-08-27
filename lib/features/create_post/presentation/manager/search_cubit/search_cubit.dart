import 'package:bloc/bloc.dart';
import '../../../domain/repos/create_post_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.createPostRepo) : super(SearchInitial());
 final CreatePostRepo createPostRepo;
  Future<void> search({required String name, }) async {
        if (name.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    var restult = await createPostRepo.postSearch(name: name);
    restult.fold(
      (failures) {
        emit(SearchFailuer(failures.errMessage));
      },
      (search) {
        emit(SearchSuccess(search));
      },
    );
  }
}
