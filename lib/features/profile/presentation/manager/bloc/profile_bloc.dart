import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  ProfileBloc(this.profileRepo) : super(ProfileInitial()) {
    on<GetProfileDataEvent>((event, emit) async {
      emit(ProfileLoading());
      var result = await profileRepo.getProfileData();
      result.fold(
        (failure) => emit(ProfileError(failure.errMessage)),
        (response) => emit(ProfileSuccess(response)),
      );
    });
  }
}
