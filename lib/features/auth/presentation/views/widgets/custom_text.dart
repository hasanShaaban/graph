import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Text(text, style: AppTextStyle.cairoSemiBold20),
    );
  }
}
