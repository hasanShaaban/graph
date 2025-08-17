

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';

class CustomTextCairo16SemiBold extends StatelessWidget {
  const CustomTextCairo16SemiBold({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.cairoSemiBold16);
  }
}
