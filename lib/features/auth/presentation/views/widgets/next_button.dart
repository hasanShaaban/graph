import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

// this button will be used in the authentication screens
class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.title,
    required this.onPressed,
    this.isLoading = false,
    this.height,
  });
  final String? title;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, height ?? 60),
        backgroundColor: Constants.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? SizedBox(
                width: 24,
                height: 25,
                child: CircularProgressIndicator(),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title ?? lang.next,
                    style:
                        height != null
                            ? AppTextStyle.cairoRegular12.copyWith(
                              color: Constants.lightPrimaryColor,
                            )
                            : AppTextStyle.cairoBold22.copyWith(
                              color: Constants.lightPrimaryColor,
                            ),
                  ),
                ],
              ),
    );
  }
}
