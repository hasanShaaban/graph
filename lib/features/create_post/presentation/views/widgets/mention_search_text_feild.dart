import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class MentionSearchTextFeild extends StatelessWidget {
  const MentionSearchTextFeild({
    super.key,
    required this.lang,
    required this.controller,
    required this.onChanged,
  });
  final S lang;
  final TextEditingController controller;
  final void Function(String query) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        height: 45,
        child: TextField(
          controller: controller,
           onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,

            hintText: lang.search,
            hintStyle: AppTextStyle.cairoRegular18.copyWith(
              color: Constants2.darkSecondaryColor(context),
            ),
            contentPadding: EdgeInsets.only(top: 10),
            fillColor: Constants2.lightSecondaryColor(context),

            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildFocusedBorder(context),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(11),
              child: SvgPicture.asset(Assets.iconsSearch),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }

  OutlineInputBorder buildFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: BorderSide(
        width: 2,
        color: Constants2.darkSecondaryColor(context),
      ),
    );
  }
}
