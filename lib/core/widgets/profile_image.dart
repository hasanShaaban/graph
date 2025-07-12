import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.width,
    required this.height,
    required this.imageWidth,
    required this.imageHeight,
    required this.borderThick,
    this.borderColor = Constants.lightPrimaryColor,
  });

  final double width, imageWidth;
  final double height, imageHeight, borderThick;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * imageWidth / 412,
      height: width * imageWidth / 412,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor!, width: borderThick),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(Assets.imagesProfileImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
