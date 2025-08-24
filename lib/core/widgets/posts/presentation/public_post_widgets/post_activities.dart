import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_text_style.dart';
import '../../../../utils/constants.dart';

class PostActivities extends StatelessWidget {
  const PostActivities({super.key, required this.icon, required this.count});

  final String icon, count;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(icon, color: Constants2.darkPrimaryColor(context)),
        SizedBox(width: 5),
        Text(count, style: AppTextStyle.cairoRegular12.copyWith(height: 1)),
      ],
    );
  }
}