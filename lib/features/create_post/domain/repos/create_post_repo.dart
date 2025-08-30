import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/new_post_model.dart';


abstract class CreatePostRepo {
    Future<Either<Failures, Map<String, dynamic>>> postNewPost({
      required NewPostModel newPostModel,
    });
     Future<Either<Failures, Map<String, dynamic>>> getAllProject(

  );
      Future<Either<Failures, Map<String, dynamic>>> postSearch({
      required String name,
    });
     Future<Either<Failures, Map<String, dynamic>>> postHashtagSearch({
    required String name,
  });
}