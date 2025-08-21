part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileEntity profileEntity;
  ProfileSuccess(this.profileEntity);
}
final class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError(this.errorMessage);
}
