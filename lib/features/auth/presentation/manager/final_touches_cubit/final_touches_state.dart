part of 'final_touches_cubit.dart';

@immutable
sealed class FinalTouchesState {}

final class FinalTouchesInitial extends FinalTouchesState {}

final class FinalTouchesLoading extends FinalTouchesState {}

final class FinalTouchesSuccess extends FinalTouchesState {
  final List<dynamic> response;

  FinalTouchesSuccess(this.response);
  
}

final class FinalTouchesFailuer extends FinalTouchesState {
  final String errorMessage;

  FinalTouchesFailuer(this.errorMessage);
}

