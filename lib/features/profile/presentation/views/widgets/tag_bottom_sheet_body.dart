import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/generated/l10n.dart';

class TagBottomSheetBody extends StatelessWidget {
  const TagBottomSheetBody({super.key, required this.lang});
  final S lang;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(lang.addSomeTags, style: AppTextStyle.cairoSemiBold18),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
