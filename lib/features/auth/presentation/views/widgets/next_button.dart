import 'package:flutter/material.dart';
import 'package:graph/generated/l10n.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

// this button will be used in the authentication screens
class NextButton extends StatelessWidget {
  const NextButton({super.key, this.title, required this.onPressed});
  final String? title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
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
            title ?? lang.next,
            style: AppTextStyle.cairoBold22.copyWith(
              color: Constants.lightPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
