import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/tech_tool_container.dart';
import 'personal_info_column.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.height, required this.width, required this.member});
  final double height, width;
  final GroupMemberEntity member;

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
              border: Border.all(
                color: Constants2.primaryColor(context),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider('http://127.0.0.1:8000${member.image}'),
            ),
          ),

          //CustomCircleContainer(),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PesronalInfoColumn(name: member.name),
              Text(
                '${member.skill.skillName} Developer',
                style: AppTextStyle.cairoRegular14.copyWith(
                  color: Constants2.darkSecondaryColor(context),
                  height: 1.3,
                ),
              ),
            ],
          ),
          Spacer(),
          TechToolContainer(
            name: '',
            width: 40,
            height: 40,
            color: Constants2.lightSecondaryColor(context),
            icon: Assets.imagesFlutter,
          ),
        ],
      ),
    );
  }
}

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({super.key});

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
