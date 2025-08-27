import 'package:dartz/dartz.dart';
import 'package:graph/features/main/data/models/change_password_model.dart';
import '../../../../core/errors/failures.dart';
import '../entity/user_image_entity.dart';

abstract class MainRepo {
    Future<Either<Failures, UserImageEntity>> getUserProfileImage();
      Future<Either<Failures, Map<String, dynamic>>> changePassword({
    required  ChangePasswordModel changePasswordModel,
  });
  Future<Either<Failures, Map<String, dynamic>>> logout();
}