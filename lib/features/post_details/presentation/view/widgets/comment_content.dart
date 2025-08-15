// ignore_for_file: deprecated_member_use

import 'package:comment_tree/data/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class CommentContent extends StatelessWidget {
  const CommentContent({
    super.key,
    required this.lang, required this.data,
  });

  final S lang;
  final Comment data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${data.userName}',
          style: AppTextStyle.cairoSemiBold16.copyWith(
            color: Constants2.darkPrimaryColor(context),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Constants2.lightSecondaryColor(context),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft:
                  lang.lang == 'en'
                      ? Radius.zero
                      : Radius.circular(19),
              topRight:
                  lang.lang == 'en'
                      ? Radius.circular(19)
                      : Radius.zero,
              bottomLeft: Radius.circular(19),
              bottomRight: Radius.circular(19),
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            '${data.content}',
            style: AppTextStyle.cairoRegular16.copyWith(
              color: Constants2.darkPrimaryColor(context),
              height: 1.1,
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '1',
              style: AppTextStyle.cairoSemiBold14.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
            SizedBox(width: 5),
            SvgPicture.asset(Assets.iconsReply),
            SizedBox(width: 5),
            Text(
              lang.reply,
              style: AppTextStyle.cairoSemiBold14.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
            SizedBox(width: 15),
            Text(
              '12',
              style: AppTextStyle.cairoSemiBold14.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
            SizedBox(width: 5),
            SvgPicture.asset(
              Assets.iconsHeart,
              width: 15,
              color: Constants2.darkSecondaryColor(context),
            ),
            SizedBox(width: 5),
            Text(
              lang.reply,
              style: AppTextStyle.cairoSemiBold14.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
