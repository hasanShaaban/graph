import 'package:flutter/widgets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/expandable_text.dart';
import 'package:graph/generated/l10n.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              ': algorithm',
              style: AppTextStyle.cairoSemiBold16.copyWith(
                color: Constants2.darkSecondaryColor(context),
              ),
            ),
          ],
        ),
        ExpandableText('Great! You\'re describing a custom image layout widget similar to Facebook\'s post image style. Here\'s how you can create a custom FacebookImageLayout widget in Flutter that handles your custom image layout. for your custom image layout.', trimLines: 3,),
      ],
    );
  }
}
