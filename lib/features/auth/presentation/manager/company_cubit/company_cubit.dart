import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import '../../../data/models/company_model.dart';
import '../../../domain/repos/auth_repo.dart';


part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.authRepo) : super(CompanyInitial());

  final AuthRepo authRepo;

  Future<void> Company({required CompanyModel companyModel}) async {
    emit(CompanyLoading());
    var restult = await authRepo.company(companyModel: companyModel);
    restult.fold(
      (failures) {
        emit(CompanyFailuer(failures.errMessage));
      },
      (signupCompany) {
        emit(CompanySuccess(signupCompany));
      },
    );
  }
}
