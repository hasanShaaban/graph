import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Constants2.lightSecondaryColor(context),
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: width * 40 / 412,
      height: width * 40 / 412,
      onPressed: () {},
      child: SvgPicture.asset(Assets.iconsTrash1, width: 18, color: Colors.red),
    );
  }
}
