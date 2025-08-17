import 'package:flutter/material.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/tech_tool_container.dart';
import '../../../../../generated/l10n.dart';

class TechToolsListView extends StatelessWidget {
  const TechToolsListView({
    super.key,
    required this.lang,
    required this.width,
    required this.iconSize,
    required this.listPadding,
    required this.borderRadius,
  });
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

            child: TechToolContainer(
              width: iconSize,
              height: iconSize,
              color: Constants2.lightPrimaryColor(context),
              icon: tools[index],
            ),
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
