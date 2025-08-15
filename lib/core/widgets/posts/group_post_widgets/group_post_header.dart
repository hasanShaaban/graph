import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/generated/l10n.dart';
import 'package:intl/intl.dart';

class GroupPostHeader extends StatelessWidget {
  const GroupPostHeader({
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileImage(
          width: width,
          height: height,
          imageWidth: 60,
          imageHeight: 60,
          borderThick: 2,
          borderColor: Constants2.primaryColor(context),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasan Shaaban',
              style: AppTextStyle.cairoSemiBold18.copyWith(
                color: Constants2.darkPrimaryColor(context),
                height: 1.1,
              ),
            ),
            Text(
              DateFormat(
                'MMM d, yyyy – h:mm a',
              ).format(DateTime.parse("2024-06-20T12:30:00")),
              style: AppTextStyle.cairoRegular12.copyWith(
                color: Constants2.darkSecondaryColor(context),
                height: 0.9,
              ),
            ),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            elevation: 2,
            backgroundColor: Constants2.lightSecondaryColor(context),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Text(
            lang.join,
            style: AppTextStyle.cairoSemiBold16.copyWith(
              color: Constants2.darkSecondaryColor(context),
            ),
          ),
        ),
      ],
    );
  }
}
