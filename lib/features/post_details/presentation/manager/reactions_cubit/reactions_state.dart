part of 'reactions_cubit.dart';

@immutable
sealed class ReactionsState {}

final class ReactionsInitial extends ReactionsState {}
final class ReactionsLoading extends ReactionsState {}
final class ReactionsSuccess extends ReactionsState {
  final List<ReactionEntity> reactions;

  ReactionsSuccess(this.reactions);
}
final class ReactionsError extends ReactionsState {
  final String errorMessage;

  ReactionsError(this.errorMessage);
}
