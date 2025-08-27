import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import 'custom_text_cairo16_semi_bold.dart';

class FinalTouchesStudySpacializationSec extends StatelessWidget {
  const FinalTouchesStudySpacializationSec({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextCairo16SemiBold(text: text1),

        Flexible(
          child: Text(
            text2,
            style: AppTextStyle.cairoSemiBold18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
