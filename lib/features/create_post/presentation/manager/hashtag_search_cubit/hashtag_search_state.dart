import 'package:graph/features/create_post/data/models/hashtag_model.dart';


import 'package:flutter/material.dart';

@immutable
sealed class PostHashtagSearchState {}

final class PostHashtagSearchInitial extends PostHashtagSearchState {}

final class PostHashtagSearchLoading extends PostHashtagSearchState {}

final class PostHashtagSearchSuccess extends PostHashtagSearchState {
  final HashtagModel hashtags;

  PostHashtagSearchSuccess(this.hashtags);
}

final class PostHashtagSearchFailure extends PostHashtagSearchState {
  final String errorMessage;

  PostHashtagSearchFailure(this.errorMessage);
}
