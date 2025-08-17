import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../followers&following/presentation/views/follow_view.dart';
import '../../../../../generated/l10n.dart';

class FollowersAndFollowingSection extends StatelessWidget {
  const FollowersAndFollowingSection({
    super.key,
    required this.width,
    required this.lang,
  });

  final double width;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width * 272 / 412 - 24,
      decoration: BoxDecoration(
        color: Constants2.lightSecondaryColor(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FollowersAndFollowingButton(
            title: lang.followers,
            count: '322',
            onTap: () {
              Navigator.pushNamed(
                context,
                FollowView.name,
                arguments: {'type': lang.followers},
              );
            },
          ),
          VerticalDivider(
            color: Constants2.dividerColor(context),
            width: 1,
            thickness: 1.5,
            indent: 7,
            endIndent: 7,
          ),
          FollowersAndFollowingButton(
            title: lang.following,
            count: '412',
            onTap: () {
              Navigator.pushNamed(
                context,
                FollowView.name,
                arguments: {'type': lang.following},
              );
            },
          ),
        ],
      ),
    );
  }
}

class FollowersAndFollowingButton extends StatelessWidget {
  const FollowersAndFollowingButton({
    super.key,
    required this.title,
    required this.count,
    required this.onTap,
  });

  final String title, count;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyle.cairoRegular14.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
            SizedBox(width: 5),
            Text(
              count,
              style: AppTextStyle.cairoSemiBold18.copyWith(
                color: Constants.secondryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
