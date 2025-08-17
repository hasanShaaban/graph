import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class AlertDialogActionButton extends StatelessWidget {
  const AlertDialogActionButton({
    super.key,
    required this.lang,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor, required this.borderRadius,
  });

  final S lang;

  final String icon;
  final String text;
  final Color color;
  final Color iconColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, width: 16, color: iconColor),
            SizedBox(width: 2),
            Text(
              text,
              style: AppTextStyle.cairoRegular14.copyWith(color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}