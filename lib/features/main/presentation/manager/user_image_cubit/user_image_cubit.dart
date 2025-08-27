import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/user_image_entity.dart';
import '../../../domain/repos/main_repo.dart';

part 'user_image_state.dart';

class UserImageCubit extends Cubit<UserImageState> {
  UserImageCubit(this.mainRepo) : super(UserImageInitial());
  final MainRepo mainRepo;

  Future<void> getUserImage() async {
    emit(UserImageLoading());
    var result = await mainRepo.getUserProfileImage();
    result.fold(
      (failure) => emit(UserImageError(failure.errMessage)),
      (response) => emit(UserImageSuccess(response)),
    );
  }
}
