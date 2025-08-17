import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../generated/l10n.dart';

class SocilaLinksListView extends StatelessWidget {
  const SocilaLinksListView({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: socialLinks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: lang.lang == 'en' ? 20 : 0,
              left: lang.lang == 'ar' ? 20 : 0,
            ),
            child: SvgPicture.asset(socialLinks[index]),
          );
        },
      ),
    );
  }
}

List socialLinks = [
  Assets.iconsFacebook,
  Assets.iconsInstagram,
  Assets.iconsLinkedin,
  Assets.iconsGithub,
];