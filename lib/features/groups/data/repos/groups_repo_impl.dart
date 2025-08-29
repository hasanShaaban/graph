import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/groups/data/models/group_info_model.dart';
import 'package:graph/features/groups/data/models/group_member_model.dart';
import 'package:graph/features/groups/data/models/project_model.dart';
import 'package:graph/features/groups/domain/entity/group_info_entity.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';
import 'package:graph/features/profile/data/repos/profile_local_data_source.dart';

class GroupsRepoImpl extends GroupsRepo {
  final PublicApiService publicApiService;
  final SecureApiService secureApiService;
  final ProfileLocalDataSource profileLocalDataSource;

  GroupsRepoImpl(
    this.publicApiService,
    this.profileLocalDataSource,
    this.secureApiService,
  );

  @override
  Future<Either<Failures, List<ProjectEntity>>> getProjects({
    required int yearId,
    int? majorId,
  }) async {
    int major = await profileLocalDataSource.getStudentMajor();
    prettyLog('YearId: $yearId, MajorId: $majorId');
    try {
      var data = await publicApiService.get(
        endPoints: 'projects_list?',
        data: {'year_id': yearId, 'major_id': majorId ?? major},
      );
      final List<ProjectModel> response =
          (data['data'] as List)
              .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
              .toList();

      prettyLog('Project Response ${response[0]}');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Project Response ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Project Response ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GroupInfoEntity>> getGroupInfo({
    required int projectId,
  }) async {
    try {
      var data = await secureApiService.get(
        endPoints: 'groupsByProject?',
        data: {'project_id': projectId},
      );
      final GroupInfoModel response = GroupInfoModel.fromJson(
        data['data'].isNotEmpty
            ? data['data'][0]
            : {'id': 0, 'groupName': '', 'groupProject': '', 'isAdmin': false},
      );
      prettyLog('Project Response $response');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<GroupMemberEntity>>> getGroupMembers({
    required int groupId,
  }) async {
    try {
      var data = await secureApiService.get(
        endPoints: 'group/member/$groupId?',
      );
      final List<GroupMemberModel> response =
          (data['data'] as List)
              .map((e) => GroupMemberModel.fromJson(e as Map<String, dynamic>))
              .toList();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> createGroup({
    required int projectId,
    required int skillID,
  }) async {
    try {
      var data = await secureApiService.post(
        endPoint: 'groups_Create?',
        data: {'group_name': 'groupName', 'project_id': projectId, 'skill_id': skillID},
      );
      prettyLog('Group created successfully');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
}
