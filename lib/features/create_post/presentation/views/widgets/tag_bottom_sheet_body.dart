import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

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
