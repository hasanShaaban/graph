import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'member_role_sec.dart';

class MemberContainer extends StatelessWidget {
  const MemberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('group member 1'),
              IconButton(onPressed: () {}, icon: Icon(Icons.minimize)),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Constants.secondryColor,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdpcmwlMjBmYWNlfGVufDB8fDB8fHww',
                        ),
                      ),
                    ),

                    SizedBox(width: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmad Ali',
                          style: AppTextStyle.cairoRegular18.copyWith(
                            height: 1.3,
                          ),
                        ),
                        Text(
                          '4th Year - Software Engineering',
                          style: AppTextStyle.cairoRegular14.copyWith(
                            height: 1.3,
                          ),
                        ),
                        Text(
                          'mobile developer + UI-UX',
                          style: AppTextStyle.cairoRegular14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        MemberRoleSec(),
        
        ],
      ),
    );
  }
}
