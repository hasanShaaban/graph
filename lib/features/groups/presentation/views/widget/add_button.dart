import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onTap});
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: SvgPicture.asset(
              Assets.iconsAdd,
              color: Constants2.darkSecondaryColor(context),
            ),
          ),
        ),
      ),
    );
  }
}
