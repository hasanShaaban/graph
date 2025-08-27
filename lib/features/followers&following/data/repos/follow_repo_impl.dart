import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/pritty_log.dart';
import '../models/friend_model.dart';
import '../../domain/entity/friend_entity.dart';
import '../../domain/repo/follow_repo.dart';

class FollowRepoImpl extends FollowRepo{
  final SecureApiService apiService;

  FollowRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<FriendEntity>>> getFollowers() async{
    try{
      var data = await apiService.get(endPoints: 'followers?');
      List<FriendModel> response = data['data'].map((e) => FriendModel.fromJson(e)).toList();
      prettyLog(response.map((e) => e.toJson()));
      return right(response);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<FriendEntity>>> getFollowing() {
    // TODO: implement getFollowing
    throw UnimplementedError();
  }
}