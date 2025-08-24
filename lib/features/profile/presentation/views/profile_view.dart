import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';
import 'package:graph/features/profile/presentation/manager/profile_posts/profile_posts_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String name = 'profile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileViewBody(),
      ),
    );
  }
}
