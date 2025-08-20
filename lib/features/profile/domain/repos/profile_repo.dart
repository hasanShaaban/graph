import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failures, ProfileEntity>> getProfileData();

}