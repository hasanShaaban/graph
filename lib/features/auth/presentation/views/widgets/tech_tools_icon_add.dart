import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class TechToolsIconAdd extends StatelessWidget {
  const TechToolsIconAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Constants.deviderColor,
      ),
      child: SvgPicture.asset(
        Assets.iconsAdd,
        color: Constants.darkSecondryColor,
        fit: BoxFit.none,
      ),
    );
  }
}
