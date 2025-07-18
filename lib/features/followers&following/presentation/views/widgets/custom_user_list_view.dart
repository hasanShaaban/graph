

import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';

class CustomUserListView extends StatelessWidget {
  const CustomUserListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
            'https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdpcmwlMjBmYWNlfGVufDB8fDB8fHww',
          ),
    
          //https://plus.unsplash.com/premium_photo-1668895511243-1696733f4fcb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybCUyMGZhY2V8ZW58MHx8MHx8fDA%3D
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saly Karim',
              style: AppTextStyle.cairoRegular18.copyWith(height: 1),
            ),
            Text('Teacher', style: AppTextStyle.cairoRegular14),
          ],
        ),
      ],
    );
  }
}
