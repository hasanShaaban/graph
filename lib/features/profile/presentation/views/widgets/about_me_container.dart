import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import 'about_me_header.dart';
import 'cvpdf.dart';
import 'social_links_list_view.dart';
import 'tech_tools_list_view.dart';
import '../../../../../generated/l10n.dart';

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
        color: Constants2.lightSecondaryColor(context),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutMeHeader(lang: lang),
            Divider(
              thickness: 1,
              color: Constants2.dividerColor(context),
              height: 0,
            ),
            SizedBox(height: 10),
            infoRow(
              Assets.iconsGraduationCap,
              '4th year - ${lang.softwareEng}',
            ),
            SizedBox(height: 5),
            infoRow(Assets.iconsCakeBirthday, 'january-1-1999'),
            SizedBox(height: 5),
            infoRow(Assets.iconsTerminal, lang.techTools),
            TechToolsListView(
              lang: lang,
              width: double.infinity,
              iconSize: 48,
              listPadding: 10,
              borderRadius: 14,
            ),
            SizedBox(height: 5),
            infoRow(Assets.iconsLink, lang.socialLinks),
            SocilaLinksListView(lang: lang),
            SizedBox(height: 5),
            infoRow(Assets.iconsCv, lang.mySV),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, CVPDF.name);
              },
              child: Text(lang.tapToPreviewTheDocument),
            ),
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
