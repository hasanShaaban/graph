import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class CountAndDivider extends StatelessWidget {
  const CountAndDivider({super.key, required this.lang, required this.type});

  final S lang;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type == lang.followers
              ? 'You have 245 ${lang.followers}'
              : 'you are following 245 accounts',
          style: AppTextStyle.cairoSemiBold20.copyWith(
            color: Constants2.darkPrimaryColor(context),
          ),
        ),
        Expanded(
          child: Divider(
            color: Constants2.dividerColor(context),
            indent: 4,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
