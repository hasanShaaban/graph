
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/groups/data/models/project_model.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';

class GroupsRepoImpl extends GroupsRepo{

  final PublicApiService publicApiService;

  GroupsRepoImpl(this.publicApiService);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getProjects({required int yearId, int? majorId}) async{
    try{
      var data = await publicApiService.get(endPoints: 'projects_list?', data: {'year_id': yearId, 'major_id': majorId});
      final List<ProjectEntity> response = (data as List).map((e) => ProjectModel.fromJson(e)).toList();
      prettyLog('Project Response ${response[0]}');
      return right(response);
    }catch (e) {
      if (e is DioException) {
        prettyLog('Project Response ${e.message}');
        return left(ServerFailure.fromDioError(e));
        
      }
      prettyLog('Project Response ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
}

