import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
   final AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var restult = await authRepo.login(email: email, password: password);
    restult.fold(
      (failures) {
        emit(LoginFailuer(failures.errMessage));
      },
      (signup) {
        emit(LoginSuccess(signup));
      },
    );
  }
}
