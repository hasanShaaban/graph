part of 'react_cubit.dart';

@immutable
sealed class ReactState {}

final class ReactInitial extends ReactState {}
final class ReactLoading extends ReactState {}
final class ReactSuccess extends ReactState {
  final String message;
  ReactSuccess(this.message);
}
final class ReactError extends ReactState {
  final String message;
  ReactError(this.message);
}
