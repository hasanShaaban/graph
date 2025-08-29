import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.mainRepo) : super(LogoutInitial());
  final MainRepo mainRepo;

  Future<void> logout() async {
    emit(LoutLoading());
    var result = await mainRepo.logout();
    result.fold(
      (failures) {
        log(
          'LogoutCubit: failure = ${failures.errMessage}',
          name: 'LogoutCubit',
        );
        emit(LogoutError(failures.errMessage));
      },
      (logout) {
        log(logout.toString());
        emit(LogoutSuccess(logout));
      },
    );
  }
}
