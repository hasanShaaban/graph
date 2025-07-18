
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graph/core/utils/app_text_style.dart';

class NameAndBirthDateInfo extends StatelessWidget {
  const NameAndBirthDateInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     SizedBox(height: 10),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Saly Karim', style: AppTextStyle.cairoBold22),
        Icon(Icons.safety_check),
      ],
    ),
    Align(
      alignment: Alignment.center,
      child: Text('January-23-2005'),
    ),
      ],
    );
  }
}
