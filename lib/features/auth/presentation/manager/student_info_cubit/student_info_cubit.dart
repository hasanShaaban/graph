import 'package:bloc/bloc.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'student_info_state.dart';

class StudentInfoCubit extends Cubit<StudentInfoState> {
  StudentInfoCubit(this.authRepo) : super(StudentInfoInitial());
  final AuthRepo authRepo;
  Future<void> getStudentInfo() async {
    emit(StudentInfoLoading());
    var restult = await authRepo.getStudentInfo();
    restult.fold(
      (failures) {
        emit(StudentInfoFailuer(failures.errMessage));
      },
      (signup) {
        emit(StudentInfoSuccess(signup));
      },
    );
  }
}
