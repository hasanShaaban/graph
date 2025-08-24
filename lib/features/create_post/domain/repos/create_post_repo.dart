import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/create_post/data/models/new_post_model.dart';


abstract class CreatePostRepo {
    Future<Either<Failures, Map<String, dynamic>>> postNewPost({
      required NewPostModel newPostModel,
    });
     Future<Either<Failures, Map<String, dynamic>>> getAllProject(

  );
}