import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 120 / 890,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Constants2.primaryColor(context),
            Constants2.thirdColor(context),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }
}
