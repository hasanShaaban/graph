import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';

class PesronalInfoColumn extends StatelessWidget {
  const PesronalInfoColumn({super.key, required this.name});
  
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyle.cairoSemiBold18.copyWith(height: 0.8),
        ),
        
      ],
    );
  }
}

