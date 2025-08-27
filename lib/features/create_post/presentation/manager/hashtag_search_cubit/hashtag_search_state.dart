part of 'hashtag_search_cubit.dart';

@immutable
sealed class HashtagSearchState {}

final class HashtagSearchInitial extends HashtagSearchState {}

final class  HashtagSearchLoading extends HashtagSearchState {}

final class  HashtagSearchSuccess extends HashtagSearchState {
  final Map<String, dynamic> response;

  HashtagSearchSuccess(this.response);
  
}

final class HashtagSearchFailuer extends HashtagSearchState {
  final String errorMessage;

HashtagSearchFailuer(this.errorMessage);
}
