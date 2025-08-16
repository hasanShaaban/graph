// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:graph/features/auth/data/models/credintials_model.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'credintials_state.dart';

class CredintialsCubit extends Cubit<CredintialsState> {
  CredintialsCubit(this.authRepo) : super(CredintialsInitial());
  final AuthRepo authRepo;
  Future<void> credintials({required CredintialsModel credintialsModel}) async{
    emit(CredintialsLoading());
    var result = await authRepo.credintials(credintialsModel: credintialsModel);
    result.fold((failures){
      emit(CredintialsFailuer(failures.errMessage));
    }, (credintials){
      emit(CredintialsSuccess(credintials));
    });
  }
}




