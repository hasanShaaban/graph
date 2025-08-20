import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/profile/domain/entity/skill_entity.dart';
import 'package:graph/features/profile/domain/entity/social_link_entity.dart';
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
    required this.year,
    required this.major,
    this.skills,
    this.links,
    this.cv,
  });

  final double width;
  final double height;
  final S lang;

  final String year, major;
  final List<SkillEntity>? skills;
  final List<SocialLinkEntity>? links;
  final String? cv;

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
            infoRow(Assets.iconsGraduationCap, '$year - $major'),
            SizedBox(height: 10),
            infoRow(Assets.iconsCakeBirthday, 'january-1-1999'),
            SizedBox(height: 10),
            infoRow(Assets.iconsTerminal, lang.techTools),
            TechToolsListView(
              lang: lang,
              width: double.infinity,
              iconSize: 48,
              listPadding: 10,
              borderRadius: 14,
              skills: skills,
            ),
            SizedBox(height: 10),
            infoRow(Assets.iconsLink, lang.socialLinks),
            links != null && links!.isNotEmpty
                ? SocilaLinksListView(lang: lang, links: links!,)
                : Row(children: [Text('no links yet')]),
            SizedBox(height: 10),
            infoRow(Assets.iconsCv, lang.mySV),
            cv != null
                ? TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CVPDF.name, arguments: cv!);
                  },
                  child: Text(lang.tapToPreviewTheDocument),
                )
                : Text('no CV loaded yet'),
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
