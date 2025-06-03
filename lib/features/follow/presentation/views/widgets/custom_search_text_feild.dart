import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          filled: true,

          hintText: lang.search,
          hintStyle: AppTextStyle.cairoBold18.copyWith(
            fontWeight: FontWeight.normal,
          ),
          contentPadding: EdgeInsets.only(top: 10),
          fillColor: Constants.lightSecondryColor,

          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildFocusedBorder(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset(Assets.iconsSearch),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),

      borderSide: const BorderSide(
        width: 2,
        color: Constants.darkSecondryColor,
      ),
    );
  }
}
