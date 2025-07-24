import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      floating: true,
      snap: true,
      titleSpacing: 20,
      collapsedHeight: height * 80 / 915,
      backgroundColor: Constants.lightPrimaryColor,
      title: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SvgPicture.asset(
          Assets.iconsMainLogo,
          width: width * 105 / 412,
        ),
      ),
      actions: [
        SvgPicture.asset(Assets.iconsCircleUser, color: Constants.primaryColor),
        SizedBox(width: 20),
        SvgPicture.asset(Assets.iconsChat),
        SizedBox(width: 20),
        
      ],
    );
  }
}

