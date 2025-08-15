import 'package:flutter/widgets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants2.lightSecondaryColor(context),
        ),
        width: MediaQuery.of(context).size.width * 76 / 412,
        height: 40,
        child: Center(
          child: Text(
            lang.post,
            style: AppTextStyle.cairoSemiBold18.copyWith(
              color: Constants2.darkSecondaryColor(context),
            ),
          ),
        ),
      ),
    );
  }
}
