import 'package:dartz/dartz.dart';
import 'package:graph/features/main/data/models/change_password_model.dart';
import 'package:graph/features/main/domain/entity/group_post_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entity/user_image_entity.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/main/domain/entity/pending_invitation_entity.dart';
import 'package:graph/features/main/domain/entity/user_image_entity.dart';

abstract class MainRepo {
    Future<Either<Failures, UserImageEntity>> getUserProfileImage();
      Future<Either<Failures, Map<String, dynamic>>> changePassword({
    required  ChangePasswordModel changePasswordModel,
  });
  Future<Either<Failures, Map<String, dynamic>>> logout();
    Future<Either<Failures, List<NormalPostEntity>>> getMainPagePosts();
    Future<Either<Failures, List<GroupPostEntity>>> getGroupsPagePosts();
    Future<Either<Failures, List<PendingInvitationEntity>>> getPendingInvitations();
    Future<Either<Failures, Map<String, dynamic>>> invitationResponse({required int invitationId, required String response});
}