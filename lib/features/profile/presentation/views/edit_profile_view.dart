import 'package:flutter/material.dart';
import 'package:graph/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const name = 'EditProfileView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: EditProfileViewBody()));
  }
}