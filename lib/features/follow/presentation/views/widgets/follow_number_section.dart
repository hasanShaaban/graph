import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';

class FollowNumberSection extends StatelessWidget {
  const FollowNumberSection({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Text('234', style: AppTextStyle.cairoRegular20),
            SizedBox(width: 4),
            Text(text, style: AppTextStyle.cairoRegular20),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(125, 15, 10, 0.1),
          child: Divider(thickness: 1, color: Colors.grey),
        ),
      ],
    );
  }
}
