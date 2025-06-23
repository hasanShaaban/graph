import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class SeeAllGroupsButton extends StatelessWidget {
  const SeeAllGroupsButton({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        lang.seeAll,
        style: AppTextStyle.cairoRegular14.copyWith(
          color: Constants.secondryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
