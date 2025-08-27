import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/groups/domain/entity/group_info_entity.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';

abstract class GroupsRepo {
  Future<Either<Failures, List<ProjectEntity>>> getProjects({required int yearId, int? majorId});
  Future<Either<Failures, GroupInfoEntity>> getGroupInfo({required int projectId});
  Future<Either<Failures, List<GroupMemberEntity>>> getGroupMembers({required int groupId});
}

