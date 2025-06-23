import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class TechToolsListView extends StatelessWidget {
  const TechToolsListView({super.key, required this.lang, required this.width, required this.iconSize, required this.listPadding, required this.borderRadius});
  final S lang;
  final double width, iconSize, listPadding, borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: lang.lang == 'en' ? listPadding : 0,
              left: lang.lang == 'ar' ? listPadding : 0,
            ),
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: Constants.lightPrimaryColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(child: SvgPicture.asset(tools[index], width: 32,)),
          );
        },
      ),
    );
  }
}

List tools = [
  Assets.imagesDart,
  Assets.imagesFlutter,
  Assets.imagesVisualStudioCode,
  Assets.imagesFirebase,
  Assets.imagesFigma,
  Assets.imagesGit,
  Assets.imagesPython,
  Assets.imagesJs,
];
