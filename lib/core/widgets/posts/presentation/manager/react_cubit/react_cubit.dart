import 'package:bloc/bloc.dart';
import 'package:graph/core/widgets/posts/domain/repos/public_post_repo.dart';
import 'package:meta/meta.dart';

part 'react_state.dart';

class ReactCubit extends Cubit<ReactState> {
  ReactCubit(this.publicPostRepo) : super(ReactInitial());
  final PublicPostRepo publicPostRepo;
  
  Future<void> addReact({required int postId, required int reactId}) async {
    emit(ReactLoading());
    var result = await publicPostRepo.addReact(postId: postId, reactId: reactId);
    result.fold((failuer) => emit(ReactError(failuer.errMessage)), (response)=> emit(ReactSuccess(response['message'])));
  }
}
