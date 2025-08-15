import 'package:bloc/bloc.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'role_state.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit(this.authRepo) : super(RoleInitial());
  final AuthRepo authRepo;
  Future<void> setRole({required String role,}) async {
    emit(RoleLoading());
    var restult = await authRepo.role(role: role);
    restult.fold(
      (failures) {
        emit(RoleFailuer(failures.errMessage));
      },
      (signup) {
        emit(RoleSuccess(signup));
      },
    );
  }
}
