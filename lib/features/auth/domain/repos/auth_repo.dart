import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graph/features/auth/data/models/social_links_model.dart';
import '../../data/models/company_model.dart';
import '../../data/models/credintials_model.dart';
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
  Future<Either<Failures, Map<String, dynamic>>> role({required String role});
  Future<Either<Failures, Map<String, dynamic>>> company({
    required CompanyModel companyModel,
  });
  Future<Either<Failures, List<dynamic>>> bio({required String bio});
  Future<Either<Failures, Map<String, dynamic>>> profileImage({
    required File image,
  });
    Future<Either<Failures, Map<String, dynamic>>> addSocialLinks ({
    required List<SocialLinksModel> socialLinksModel,
  });
}
