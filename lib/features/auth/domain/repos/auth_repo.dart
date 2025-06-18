import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserModel>> signup({required UserModel userModel});
}
