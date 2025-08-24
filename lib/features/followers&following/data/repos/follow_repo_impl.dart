import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/features/followers&following/data/models/follow_data.dart';
import 'package:graph/features/followers&following/data/models/friend_model.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';
import 'package:graph/features/followers&following/domain/repo/follow_repo.dart';

class FollowRepoImpl extends FollowRepo {
  final SecureApiService apiService;

  FollowRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<FriendEntity>>> getFollowers() async {
    try {
      var data = await apiService.get(endPoints: 'followers?');
      final List<dynamic> rawList = data['data'];
      List<FriendModel> response =
          rawList.map((e) => FriendModel.fromJson(e)).toList();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Followers Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Followers exception: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<FriendEntity>>> getFollowing() async {
    try {
      var data = await apiService.get(endPoints: 'followings?');
      final List<dynamic> rawList = data['data'];
      List<FriendModel> response =
          rawList.map((e) => FriendModel.fromJson(e)).toList();

      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Following Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Following exception: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, FollowData>> getFollowData() async {
    try {
      final results = await Future.wait([getFollowers(), getFollowing()]);

      final followersResult = results[0];
      final followingsResult = results[1];

      return followersResult.fold(
        (failure) => left(failure),
        (followers) {
          return followingsResult.fold(
            (failure) => left(failure), 
            (followings) {
              return right(
                FollowData(followers: followers, followings: followings),
              );
            },
          );
        },
      );
    } catch (e) {
      if (e is DioException) {
        prettyLog('Data Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Data exception: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
}
