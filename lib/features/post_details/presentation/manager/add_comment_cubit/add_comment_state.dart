part of 'add_comment_cubit.dart';

@immutable
sealed class AddCommentState {}

final class AddCommentInitial extends AddCommentState {}
final class AddCommentLoading extends AddCommentState {}
final class AddCommentSuccess extends AddCommentState {
  final String message;
  AddCommentSuccess(this.message);
}
final class AddCommentError  extends AddCommentState {
  final String errorMessage;

  AddCommentError(this.errorMessage); 
}
