import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';

abstract class PublicPostRepo {
  Future<Either<Failures, Map<String, dynamic>>> addReact({required int postId, required int reactId});
  Future<Either<Failures, Map<String, dynamic>>> updateReact({required int postId, required int reactId});
  Future<Either<Failures, Map<String, dynamic>>> removeReact({required int postId});
}