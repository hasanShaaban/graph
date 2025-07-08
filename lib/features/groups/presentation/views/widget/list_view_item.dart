import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/tech_tool_container.dart';
import 'package:graph/features/groups/presentation/views/widget/personal_info_column.dart';

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

