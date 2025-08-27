import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/constants.dart';

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SvgPicture.asset(icon, color: Constants2.darkPrimaryColor(context)),
              const SizedBox(width: 10),
              Text(
                text,
                style: AppTextStyle.cairoSemiBold18.copyWith(
                  color: Constants2.darkPrimaryColor(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
