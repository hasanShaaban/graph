import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/auth_repo_impl.dart';
import '../../../domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> signup({required UserModel userModel}) async {
    emit(SignupLoading());
    var restult = await authRepo.signup(userModel: userModel);
    restult.fold(
      (failures) {
        emit(SignupFailuer(failures.errMessage));
      },
      (signup) {
        emit(SignupSuccess(signup));
      },
    );
  }
}
