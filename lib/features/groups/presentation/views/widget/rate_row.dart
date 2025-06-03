
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/generated/l10n.dart';

class RateRow extends StatelessWidget {
  const RateRow({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${lang.teamRate}: 25', style: AppTextStyle.cairoRegular18),
        SizedBox(width: 6),
        SvgPicture.asset(Assets.iconsStarRate),
      ],
    );
  }
}
