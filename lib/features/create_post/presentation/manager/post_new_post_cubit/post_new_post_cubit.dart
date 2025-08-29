import 'package:bloc/bloc.dart';
import '../../../data/models/new_post_model.dart';
import '../../../domain/repos/create_post_repo.dart';
import 'package:meta/meta.dart';

part 'post_new_post_state.dart';

class PostNewPostCubit extends Cubit<PostNewPostState> {
  PostNewPostCubit(this.createPostRepo) : super(PostNewPostInitial());
  final CreatePostRepo createPostRepo;
  Future<void> postNewPost({required NewPostModel newPostModel}) async {
    print(" Starting postNewPost...");
    print(" Post Data:");
    print(" title: ${newPostModel.title}");
    print(" description: ${newPostModel.description}");
    print(" projectId: ${newPostModel.projectId}");
    print(" privacy: ${newPostModel.privacy}");
    print(" mentionIds: ${newPostModel.mentionIds}");
    print(" image: ${newPostModel.image}");

    emit(PostNewPostLoading());
    var result = await createPostRepo.postNewPost(newPostModel: newPostModel);

    result.fold(
      (failures) {
        print(" Post failed with error: ${failures.errMessage}");
        emit(PostNewPostFailuer(failures.errMessage));
      },
      (credintials) {
        
        print(" Post succeeded with response: $credintials");
        emit(PostNewPostSuccess(credintials));
      },
    );

    print("Finished postNewPost.");
  }
}
