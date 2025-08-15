import 'package:dartz/dartz.dart';
import 'package:graph/features/auth/data/models/company_model.dart';
import 'package:graph/features/auth/data/models/credintials_model.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, Map<String, dynamic>>> credintials({
  required CredintialsModel credintialsModel,
  });
  Future<Either<Failures, Map<String, dynamic>>> signup({
    required UserModel userModel,
  });
  Future<Either<Failures, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
   Future<Either<Failures, Map<String, dynamic>>> role({
 required String role
  });
    Future<Either<Failures, Map<String, dynamic>>> company({
 required CompanyModel companyModel,
  });

}
