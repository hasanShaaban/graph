import 'package:flutter/material.dart';
import '../../../../profile/data/models/person_model.dart';
import '../../../../../core/utils/app_text_style.dart';

class CustomUserListView extends StatelessWidget {
   CustomUserListView({super.key, this.person});
  Person? person;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
          person!.image,
            //'https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdpcmwlMjBmYWNlfGVufDB8fDB8fHww',
          ),

          //https://plus.unsplash.com/premium_photo-1668895511243-1696733f4fcb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybCUyMGZhY2V8ZW58MHx8MHx8fDA%3D
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              person!.name ,
              style: AppTextStyle.cairoRegular18.copyWith(height: 1),
            ),
           // Text('Teacher', style: AppTextStyle.cairoRegular14),
          ],
        ),
      ],
    );
  }
}
