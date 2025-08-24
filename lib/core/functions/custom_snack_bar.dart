
import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';

SnackBar customSnackBar({
  required String message,
  required Color backgroundColor,
  required Color textColor,
  IconData icon = Icons.error,
}) {
  return SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon, color: textColor),
            SizedBox(width: 10),
            Text(
              message,
              style: AppTextStyle.cairoSemiBold16.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    ),
  );
}
