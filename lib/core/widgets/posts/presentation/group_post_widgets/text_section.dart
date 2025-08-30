import 'package:flutter/widgets.dart';
import '../../../../utils/app_text_style.dart';
import '../../../../utils/constants.dart';

import '../../../../../generated/l10n.dart';
import 'package:graph/core/widgets/expandable_text.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.lang,
    required this.project,
    required this.discreption,
  });

  final S lang;
  final String project, discreption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              lang.project,
              style: AppTextStyle.cairoSemiBold16.copyWith(
                color: Constants2.secondaryColor(context),
              ),
            ),
            Text(
              ': $project',
              style: AppTextStyle.cairoSemiBold16.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
          ],
        ),
        ExpandableText(discreption, trimLines: 3),
      ],
    );
  }
}
