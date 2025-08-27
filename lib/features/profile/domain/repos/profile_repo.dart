import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failures, ProfileEntity>> getProfileData();

}