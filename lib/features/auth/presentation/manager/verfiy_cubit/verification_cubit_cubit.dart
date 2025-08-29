import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verification_cubit_state.dart';

class VerificationCubit extends Cubit<VerificationCubitState> {
  VerificationCubit(this.authRepo) : super(VerificationCubitInitial());
  final AuthRepo authRepo;
  Future<void> verifyOtp(String code) async {
    emit(VerificationLoading());
    var restult = await authRepo.verifyOtp(otp: code);
    restult.fold(
      (failures) {
  
        emit(VerificationFailuer(failures.errMessage));
        log(failures.errMessage);
      },
      (signup) {
        emit(VerificationSuccess(signup));
      },
    );
  }
}
