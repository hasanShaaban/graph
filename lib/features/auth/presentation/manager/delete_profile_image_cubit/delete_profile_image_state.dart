part of 'delete_profile_image_cubit.dart';

@immutable
sealed class DeleteProfileImageState {}

final class DeleteProfileImageInitial extends DeleteProfileImageState {}

final class DeleteProfileImageLoading extends DeleteProfileImageState {}

final class DeleteProfileImageSuccess extends DeleteProfileImageState {
  final Map<String, dynamic> response;

 DeleteProfileImageSuccess(this.response);
  
}

final class DeleteProfileImageFailuer extends DeleteProfileImageState {
  final String errorMessage;

  DeleteProfileImageFailuer(this.errorMessage);
}

