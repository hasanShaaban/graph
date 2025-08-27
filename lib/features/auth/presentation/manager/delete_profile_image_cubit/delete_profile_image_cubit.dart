import 'package:bloc/bloc.dart';
import '../../../domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'delete_profile_image_state.dart';

class DeleteProfileImageCubit extends Cubit<DeleteProfileImageState> {
  DeleteProfileImageCubit(this.authRepo) : super(DeleteProfileImageInitial());
  final AuthRepo authRepo;
  Future<void> deleteProfilePhoto() async {
    emit(DeleteProfileImageLoading());
    var restult = await authRepo.deleteProfilePhoto();
    restult.fold(
      (failures) {
        emit(DeleteProfileImageFailuer(failures.errMessage));
      },
      (signup) {
        emit(DeleteProfileImageSuccess(signup));
      },
    );
  }
}
