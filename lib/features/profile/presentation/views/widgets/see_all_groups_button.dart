import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../../groups/presentation/views/my_group_view.dart';

class SeeAllGroupsButton extends StatelessWidget {
  const SeeAllGroupsButton({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MyGroupView.name);
      },
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
