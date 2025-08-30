part of 'comment_cubit.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}
final class CommentLoading extends CommentState {}
final class CommentSuccess extends CommentState {
  final List<CommentEntity> comments;
  CommentSuccess(this.comments);
}
final class CommentError extends CommentState {
  final String errorMessage;
  CommentError(this.errorMessage);
}
