import 'package:bloc/bloc.dart';
import 'package:graph/features/post_details/domain/entity/comment_entity.dart';
import 'package:graph/features/post_details/domain/repo/post_details_repo.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.postDetailsRepo) : super(CommentInitial());
  final PostDetailsRepo postDetailsRepo;

  Future<void> getPostComments({required int postId}) async {
    emit(CommentLoading());
    final result = await postDetailsRepo.getPostComments(postId: postId);
    result.fold(
      (l) => emit(CommentError(l.errMessage)),
      (r) => emit(CommentSuccess(r)),
    );
  }
}
