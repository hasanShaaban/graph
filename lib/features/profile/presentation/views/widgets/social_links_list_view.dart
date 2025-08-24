import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/features/profile/domain/entity/social_link_entity.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../generated/l10n.dart';

class SocilaLinksListView extends StatelessWidget {
  const SocilaLinksListView({
    super.key,
    required this.lang,
    required this.links,
  });

  final S lang;
  final List<SocialLinkEntity> links;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: links.length,
        itemBuilder: (context, index) {
          final link = links[index];
          final iconPath = socialLinksMap[link.name.toLowerCase()];

          if (iconPath == null) return Container();

          return Padding(
            padding: EdgeInsets.only(
              right: lang.lang == 'en' ? 20 : 0,
              left: lang.lang == 'ar' ? 20 : 0,
            ),
            child: InkWell(
              onTap: () async {
                final Uri uri = Uri.parse(link.link);
                final launched = await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                );
                if (!launched) {
                  prettyLog('Could not launch $uri');
                }
              },
              child: SvgPicture.asset(iconPath),
            ),
          );
        },
      ),
    );
  }
}

final Map<String, String> socialLinksMap = {
  'facebook': Assets.iconsFacebook,
  'instagram': Assets.iconsInstagram,
  'linkedin': Assets.iconsLinkedin,
  'github': Assets.iconsGithub,
};
