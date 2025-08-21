part of 'user_image_cubit.dart';

@immutable
sealed class UserImageState {}

final class UserImageInitial extends UserImageState {}

final class UserImageLoading extends UserImageState {}

final class UserImageSuccess extends UserImageState {
  final UserImageEntity response;

  UserImageSuccess(this.response);
}

final class UserImageError extends UserImageState {
  final String errorMessage;

  UserImageError(this.errorMessage);
}