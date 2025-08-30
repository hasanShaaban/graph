import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../data/models/new_post_model.dart';
import '../../../domain/repos/create_post_repo.dart';
import 'package:meta/meta.dart';

part 'post_new_post_state.dart';

class PostNewPostCubit extends Cubit<PostNewPostState> {
  PostNewPostCubit(this.createPostRepo) : super(PostNewPostInitial());
  final CreatePostRepo createPostRepo;
  Future<void> postNewPost({required NewPostModel newPostModel}) async {

    log('starting .......');
    emit(PostNewPostLoading());
    var result = await createPostRepo.postNewPost(newPostModel: newPostModel);

    result.fold(
      (failures) {
        log(" Post failed with error: ${failures.errMessage}");
        emit(PostNewPostFailuer(failures.errMessage));
      },
      (credintials) {
        log('psost succedded with response: $credintials');
        print(" Post succeeded with response: $credintials");
        emit(PostNewPostSuccess(credintials));
      },
    );

    log("Finished postNewPost.");
  }
}
