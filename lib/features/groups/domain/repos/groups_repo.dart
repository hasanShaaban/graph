import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';

abstract class GroupsRepo {
  Future<Either<Failures, List<ProjectEntity>>> getProjects({required int yearId, int? majorId});
}