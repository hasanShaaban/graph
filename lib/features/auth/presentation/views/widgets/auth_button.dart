import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

// this button will be used in the authentication screens
class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        backgroundColor: Constants.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.cairoBold22.copyWith(
              color: Constants.lightPrimaryColor,
            ),
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            Assets.iconsArrowRightToBracket,
            color: Constants.lightPrimaryColor,
          ),
        ],
      ),
    );
  }
}
