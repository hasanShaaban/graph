import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class PesronalInfoColumn extends StatelessWidget {
  const PesronalInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Ahmad Ali',
          style: AppTextStyle.cairoSemiBold18.copyWith(height: 0.8),
        ),
        Text(
          '4th Year - Software Engineering',
          style: AppTextStyle.cairoRegular14.copyWith(
            color: Constants.darkSecondryColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
