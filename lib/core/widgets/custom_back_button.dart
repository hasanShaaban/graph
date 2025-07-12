import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key, required this.lang, this.color});

  final S lang;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: SizedBox(
          height: 24,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              lang.lang == 'en'
                  ? Assets.iconsArrowLeft
                  : Assets.iconsArrowRight,
              color: color ?? Constants.lightPrimaryColor,
              width: 14,
            ),
          ),
        ),
      ),
    );
  }
}
