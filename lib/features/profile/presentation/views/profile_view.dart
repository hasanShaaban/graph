import 'package:flutter/material.dart';
import 'package:graph/features/profile/presentation/views/widgets/profile_view_body.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String name = 'profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProfileViewBody()));
  }
}

