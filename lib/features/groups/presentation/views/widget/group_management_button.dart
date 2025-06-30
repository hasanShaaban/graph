import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';

class GroupManagementButton extends StatelessWidget {
  const GroupManagementButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 40/412,
      height: height * 40/915,
      decoration: BoxDecoration(
        color: Constants.lightSecondryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: IconButton(
        splashRadius: 20,
        onPressed: () {},
        icon: SvgPicture.asset(Assets.iconsLeadManagement),
      ),
    );
  }
}
