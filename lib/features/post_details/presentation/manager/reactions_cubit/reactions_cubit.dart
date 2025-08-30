import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/post_details/domain/entity/reaction_entity.dart';
import 'package:graph/features/post_details/domain/repo/post_details_repo.dart';

part 'reactions_state.dart';

class ReactionsCubit extends Cubit<ReactionsState> {
  ReactionsCubit(this.postDetailsRepo) : super(ReactionsInitial());
  final PostDetailsRepo postDetailsRepo;

  Future<void> getReactions({required int postId}) async {
    emit(ReactionsLoading());
    final result = await postDetailsRepo.getPostReactions(postId: postId);
    result.fold(
      (l) => emit(ReactionsError(l.errMessage)),
      (r) => emit(ReactionsSuccess(r)),
    );
  }
}
