import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/generated/l10n.dart';
import 'package:intl/intl.dart';

class PublicPost extends StatelessWidget {
  const PublicPost({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
  });
  final S lang;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Constants.lightSecondryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            Row(
              children: [
                ProfileImage(
                  width: width,
                  height: height,
                  imageWidth: 55,
                  imageHeight: 55,
                  borderThick: 1,
                ),
                Column(
                  children: [
                    Text(
                      'Hasan Shaaban',
                      style: AppTextStyle.cairoSemiBold18.copyWith(
                        color: Constants.darkPrimaryColor,
                      ),
                    ),
                    Text(DateFormat('MMM d, yyyy – h:mm a').format(DateTime.parse("2024-06-20T12:30:00")))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
