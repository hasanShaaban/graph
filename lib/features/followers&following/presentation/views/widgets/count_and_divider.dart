import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class CountAndDivider extends StatelessWidget {
  const CountAndDivider({super.key, required this.lang, required this.type, required this.count});

  final S lang;
  final String type;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type == lang.followers
              ? 'You have $count ${lang.followers}'
              : 'you are following $count accounts',
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

