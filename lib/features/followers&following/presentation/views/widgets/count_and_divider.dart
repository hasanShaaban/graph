import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class CountAndDivider extends StatelessWidget {
  const CountAndDivider({
    super.key,
    required this.lang, required this.type,
  });

  final S lang;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type == lang.followers ?
          'You have 245 ${lang.followers}' :'you are following 245 accounts',
          style: AppTextStyle.cairoSemiBold20
              .copyWith(color: Constants.darkPrimaryColor),
        ),
        Expanded(
          child: Divider(
            color: Constants.deviderColor,
            indent: 4,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}