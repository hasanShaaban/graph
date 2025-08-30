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
    this.enable,
  });
  final double height;
  final VoidCallback onPressed;
  final String title, icon;
  final bool? enable;

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
            backgroundColor:
                enable != null
                    ? !enable!
                        ? Constants2.darkSecondaryColor(context)
                        : Constants2.primaryColor(context)
                    : Constants2.primaryColor(context),
          ),
          onPressed:
              enable != null
                  ? enable!
                      ? onPressed
                      : null
                  : onPressed,
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
