import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'package:graph/features/profile/presentation/views/widgets/profile_picture.dart';

import '../../../../../generated/l10n.dart';

class EditProfileTopSec extends StatelessWidget {
   EditProfileTopSec({
    super.key,
    required this.lang,
   
    required this.onEditTap,
    required this.gender,
    required this.onDelete,  this.text,this.newHeight,required this.profile
  });

  final S lang;
   final  ProfileEntity profile;
  final VoidCallback onEditTap;
  final String gender;
  String? text;

double? newHeight;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AuthAppBar(
          text1: text ?? lang.addFinalTouches,
          text2: '',
          onPressed: () {
            Navigator.pop(context);
          },
          height: newHeight,
        ),

        ProfilePicture(
          width: width,
          height: height,
          profile: profile,
          onEditTap: onEditTap,
          gender: gender,
          onDelete: onDelete,
          lang: lang,
        ),
      ],
    );
  }
}
