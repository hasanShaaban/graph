import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failures, ProfileEntity>> getProfileData();
  Future<Either<Failures, List<NormalPostEntity>>> getProfilePosts();

}