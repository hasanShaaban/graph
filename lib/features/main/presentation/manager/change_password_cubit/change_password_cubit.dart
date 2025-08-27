import 'package:bloc/bloc.dart';
import 'package:graph/features/main/data/models/change_password_model.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.mainRepo) : super(ChangePasswordInitial());
    final MainRepo mainRepo;
  Future<void> changePassword({required ChangePasswordModel changePasswordModel}) async{
    emit(ChangePasswordLoading());
    var result = await mainRepo.changePassword(changePasswordModel: changePasswordModel);
    result.fold((failures){
      emit(ChangePasswordFailuer(failures.errMessage));
    }, (changePassword){
      emit(ChangePasswordSuccess(changePassword));
    });
  }
}
