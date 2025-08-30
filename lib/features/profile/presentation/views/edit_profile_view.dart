import 'package:flutter/material.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.profile,
  });
  static const name = 'EditProfileView';
    final ProfileEntity profile;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: EditProfileViewBody(profile: profile,)));
  }
}