import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final String text;
  final String icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: AppTextStyle.cairoSemiBold18.copyWith(
                color: Constants2.darkPrimaryColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
