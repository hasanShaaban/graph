import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'staff_identity_state.dart';

class StaffIdentityCubit extends Cubit<StaffIdentityState> {
  StaffIdentityCubit(this.authRepo) : super(StaffIdentityInitial());
  final AuthRepo authRepo;
  Future<void> staffIdentity({required File image}) async {
    emit(StaffIdentityLoading());
    var restult = await authRepo.staffIdentity(image: image);
    restult.fold(
      (failures) {
        emit(StaffIdentityFailuer(failures.errMessage));
      },
      (signup) {
        emit(StaffIdentitySuccess(signup));
      },
    );
  }
}
