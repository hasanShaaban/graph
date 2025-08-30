import 'package:flutter/material.dart';
import 'package:graph/features/main/domain/entity/group_post_entity.dart';
import '../../../utils/appAssets.dart';
import '../../../utils/constants.dart';
import '../../../../features/profile/presentation/views/widgets/group_member_info.dart';
import '../../../../generated/l10n.dart';

class GroupMembersListView extends StatelessWidget {
  const GroupMembersListView({
    super.key,
    required this.height,
    required this.width,
    required this.lang,
    required this.members,
  });

  final double height;
  final double width;
  final S lang;
  final List<GroupMemberEntity> members;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 75 / 890,
      width: width,
      child: ListView.builder(
        itemCount: members.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(
                right: lang.lang == 'en' ? 10 : 0,
                left: lang.lang == 'ar' ? 10 : 0,
              ),
              child: GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => GroupMemberInfo(lang: lang),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Constants2.primaryColor(context),
                      radius: 65 / 2,
                      backgroundImage: NetworkImage(
                        members[index].profileImageUrl,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
