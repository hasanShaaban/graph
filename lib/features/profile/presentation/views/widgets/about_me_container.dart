import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/presentation/views/widgets/about_me_header.dart';
import 'package:graph/features/profile/presentation/views/widgets/social_links_list_view.dart';
import 'package:graph/features/profile/presentation/views/widgets/tech_tools_list_view.dart';
import 'package:graph/generated/l10n.dart';

class AboutMeContainer extends StatelessWidget {
  const AboutMeContainer({
    super.key,
    required this.width,
    required this.height,
    required this.lang,
  });

  final double width;
  final double height;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Constants.lightSecondryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutMeHeader(lang: lang),
            Divider(thickness: 1, color: Constants.deviderColor, height: 0),
            SizedBox(height: 10),
            infoRow(
              Assets.iconsGraduationCap,
              '4th year - ${lang.softwareEng}',
            ),
            infoRow(Assets.iconsCakeBirthday, 'january-1-1999'),
            infoRow(Assets.iconsTerminal, lang.techTools),
            TechToolsListView(lang: lang, width: double.infinity, iconSize: 48, listPadding: 10, borderRadius: 14,),
            infoRow(Assets.iconsLink, lang.socialLinks),
            SocilaLinksListView(lang: lang),
            infoRow(Assets.iconsCv, lang.mySV),
            TextButton(onPressed: () {}, child: Text(lang.tapToPreviewTheDocument)) 
          ],
        ),
      ),
    );
  }

  Row infoRow(String icon, String data) {
    return Row(
      children: [SvgPicture.asset(icon), SizedBox(width: 10), Text(data)],
    );
  }
}


