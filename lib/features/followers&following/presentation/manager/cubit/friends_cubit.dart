import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/followers&following/data/models/follow_data.dart';
import 'package:graph/features/followers&following/domain/repo/follow_repo.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this.followRepo) : super(FriendsInitial());

  final FollowRepo followRepo;

  Future<void> getFirends() async {
    emit(FriendsLoading());

    final result = await followRepo.getFollowData();

    result.fold(
      (failures) => emit(FriendsError(failures.errMessage)),
      (followData) => emit(FriendsSuccess(followData)),
    );
  }
}
