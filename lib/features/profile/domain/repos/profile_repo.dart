import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entity/profile_entity.dart';

import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failures, ProfileEntity>> getProfileData();
  Future<Either<Failures, ProfileEntity>> getUserProfileData(int id);
  Future<Either<Failures, List<NormalPostEntity>>> getProfilePosts();

}