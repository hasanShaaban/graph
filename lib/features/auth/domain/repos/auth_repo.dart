import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, Map<String,dynamic>>> signup({required UserModel userModel});
}
