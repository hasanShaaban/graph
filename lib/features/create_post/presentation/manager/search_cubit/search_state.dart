part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}


final class  SearchLoading extends SearchState {}

final class  SearchSuccess extends SearchState {
  final Map<String, dynamic> response;

  SearchSuccess(this.response);
  
}

final class SearchFailuer extends SearchState {
  final String errorMessage;

 SearchFailuer(this.errorMessage);
}
