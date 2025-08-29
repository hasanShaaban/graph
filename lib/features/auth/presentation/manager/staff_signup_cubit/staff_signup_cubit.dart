import 'package:bloc/bloc.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'staff_signup_state.dart';

class StaffSignupCubit extends Cubit<StaffSignupState> {
  StaffSignupCubit(this.authRepo) : super(StaffSignupInitial());
   final AuthRepo authRepo;
  Future<void> staffSignup({required UserModel userModel}) async {
    emit(StaffSignupLoading());
    var restult = await authRepo.staff(userModel: userModel);
    restult.fold(
      (failures) {
        emit(StaffSignupFailuer(failures.errMessage));
      },
      (signup) {
        emit(StaffSignupSuccess(signup));
      },
    );
  }
}
