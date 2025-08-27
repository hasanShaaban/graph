import 'package:flutter/widgets.dart';

import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/constants.dart';

class DividLine extends StatelessWidget {
  const DividLine({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppTextStyle.cairoRegular12),
        SizedBox(width: 3),
        Expanded(
          child: Container(
            height: 1,
            color: Constants2.darkPrimaryColor(context),
          ),
        ),
      ],
    );
  }
}
