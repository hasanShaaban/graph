import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../generated/l10n.dart';

class PendingPageBody extends StatelessWidget {
  const PendingPageBody({super.key, required this.lang});
  final S lang;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lang.peinding, style: AppTextStyle.cairoSemiBold24),
          SizedBox(height: 8),
          Divider(color: Constants2.darkPrimaryColor(context), height: 1, thickness: 1,),
        ],
      ),
    );
  }
}
