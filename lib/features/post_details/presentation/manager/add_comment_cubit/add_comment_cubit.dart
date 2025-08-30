import 'package:bloc/bloc.dart';
import 'package:graph/features/post_details/domain/repo/post_details_repo.dart';
import 'package:meta/meta.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.postDetailsRepo) : super(AddCommentInitial());

 final PostDetailsRepo postDetailsRepo;

 Future<void> addComment({required int postId, required String comment}) async {
    emit(AddCommentLoading());
    final result = await postDetailsRepo.addComment(postId: postId, comment: comment);
    result.fold(
      (l) => emit(AddCommentError(l.errMessage)),
      (r) => emit(AddCommentSuccess(r['message'])),
    );
  }
}
