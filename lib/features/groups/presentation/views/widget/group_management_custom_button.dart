import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class GroupManagementCutomButton extends StatelessWidget {
  const GroupManagementCutomButton({
    super.key,
    required this.height,
    required this.onPressed,
    required this.title,
    required this.icon,
  });
  final double height;
  final VoidCallback onPressed;
  final String title, icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height * 40 / 915,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: EdgeInsets.zero,
            backgroundColor: Constants2.primaryColor(context),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, width: 14),
              SizedBox(width: 5),
              Text(
                title,
                style: AppTextStyle.cairoSemiBold18.copyWith(
                  color: Constants2.lightPrimaryColor(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
