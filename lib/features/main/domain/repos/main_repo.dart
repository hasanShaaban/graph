import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/main/domain/entity/user_image_entity.dart';

abstract class MainRepo {
    Future<Either<Failures, UserImageEntity>> getUserProfileImage();
}