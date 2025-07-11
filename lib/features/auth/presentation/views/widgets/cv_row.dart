
import 'package:flutter/material.dart';
import 'custom_text_cairo16_semi_bold.dart';
import 'next_button.dart';

class CVRow extends StatelessWidget {
  const CVRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextCairo16SemiBold(text: 'Change your CV:'),
        SizedBox(width: 10),
        Expanded(
          child: NextButton(
            onPressed: () {},
            height: 40,
            title: 'tap to select a document',
          ),
        ),
      ],
    );
  }
}
