
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../../domain/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    var restult = await profileRepo.getProfileData();
    restult.fold(
      (failure) => emit(ProfileError(failure.errMessage)),
      (response) => emit(ProfileSuccess(response)),
    );
  }
}
