import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/tech_tool_container.dart';
import 'package:graph/features/groups/presentation/views/widget/personal_info_column.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: width * 65 / 412,
            height: width * 65 / 412,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.primaryColor, width: 2),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(Assets.imagesProfileImage),
            ),
          ),
      
          CustomCircleContainer(),

          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PesronalInfoColumn(),
              Text(
                'mobile developer + UI-UX',
                style: AppTextStyle.cairoRegular14.copyWith(
                  color: Constants.darkSecondryColor,
                  height: 1.3,
                ),
              ),
            ],
          ),
          Spacer(),
          TechToolContainer(
            width: 40,
            height: 40,
            color: Constants.lightSecondryColor,
            icon: Assets.imagesFlutter,
          ),
        ],
      ),
    );
  }
}


class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Constants.secondryColor, width: 2),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(
          'https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdpcmwlMjBmYWNlfGVufDB8fDB8fHww',
        ),
      ),
    );
  }
}
