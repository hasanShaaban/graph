import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class ReactButton extends StatelessWidget {
  const ReactButton({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: -(height * 60 / 890) / 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: width * 60 / 412,
          height: height * 60 / 890,
          decoration: BoxDecoration(
            color: Constants.lightSecondryColor,
            borderRadius: BorderRadius.circular(width * 60 / 412),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.iconsHeart),
                Text('234', style: AppTextStyle.cairoRegular12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
