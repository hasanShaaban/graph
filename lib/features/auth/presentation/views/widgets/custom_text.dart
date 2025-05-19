import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';

class customText extends StatelessWidget {
  const customText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          text,
        
          style: AppTextStyle.cairoSemiBold20,
        ),
      ),
    );
  }
}
