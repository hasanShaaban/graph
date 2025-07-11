import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class FollowSearchTextField extends StatelessWidget {
  const FollowSearchTextField({super.key, required this.lang});
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
      
            hintText: lang.search,
            hintStyle: AppTextStyle.cairoRegular18.copyWith(
              color: Constants.darkSecondryColor,
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
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
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
