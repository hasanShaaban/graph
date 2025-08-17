import 'dart:io';

import 'package:flutter/material.dart';
import 'circular_profile_picture.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';

class FinalTouchesTopSection extends StatelessWidget {
  const FinalTouchesTopSection({
    super.key,
    required this.lang,
    this.image,
    required this.onEditTap,
    required this.gender,
  });

  final S lang;
  final File? image;
  final VoidCallback onEditTap;
  final String gender;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //Container(height: 100),
        AuthAppBar(
          text1: lang.addFinalTouches,
          text2: '',
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        CircularProfilePicture(
          width: width,
          height: height,
          image: image,
          onEditTap: onEditTap,
          gender: gender,
        ),
      ],
    );
  }
}
