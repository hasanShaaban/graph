import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/widgets/posts/domain/repos/public_post_repo.dart';

part 'react_state.dart';

class ReactCubit extends Cubit<ReactState> {
  ReactCubit(this.publicPostRepo) : super(ReactInitial());
  final PublicPostRepo publicPostRepo;

  Future<void> addReact({required int postId, required int reactId}) async {
    emit(ReactLoading());
    var result = await publicPostRepo.addReact(
      postId: postId,
      reactId: reactId,
    );
    result.fold(
      (failuer) => emit(ReactError(failuer.errMessage)),
      (response) => emit(ReactSuccess(response['message'])),
    );
  }

  Future<void> removeReact({required int postId}) async {
    emit(ReactLoading());
    var result = await publicPostRepo.removeReact(postId: postId);
    result.fold(
      (failuer) => emit(ReactError(failuer.errMessage)),
      (response) => emit(ReactSuccess(response['message'])),
    );
  }

  Future<void> updateReact({required int postId, required int reactId}) async {
    emit(ReactLoading());
    var result = await publicPostRepo.updateReact(
      postId: postId,
      reactId: reactId,
    );
    result.fold(
      (failuer) => emit(ReactError(failuer.errMessage)),
      (response) => emit(ReactSuccess(response['message'])),
    );
  }
}
