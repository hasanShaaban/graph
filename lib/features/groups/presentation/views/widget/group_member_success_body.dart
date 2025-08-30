import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/custom_snack_bar.dart';
import 'package:graph/core/functions/show_friends_bottom_sheet.dart';
import 'package:graph/core/services/providers/followers_provider.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';
import 'package:graph/features/groups/data/models/group_member_model.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import 'package:graph/features/groups/presentation/manager/invite_member_cubit/invite_member_cubit.dart';
import 'package:graph/features/groups/presentation/views/widget/group_management_custom_button.dart';
import 'package:graph/features/groups/presentation/views/widget/group_memeber_container.dart';
import 'package:graph/features/groups/presentation/views/widget/group_vacancy_section.dart';
import 'package:graph/features/groups/presentation/views/widget/remove_button.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberSuccessBody extends StatefulWidget {
  const GroupMemberSuccessBody({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
    required this.members,
    required this.groupId,
    required this.projectId,
  });

  final S lang;
  final double width;
  final double height;
  final List<GroupMemberEntity> members;
  final int groupId, projectId;

  @override
  State<GroupMemberSuccessBody> createState() => _GroupMemberSuccessBodyState();
}

class _GroupMemberSuccessBodyState extends State<GroupMemberSuccessBody> {
  late List<GroupMemberEntity> members;
  late int skillId, memberId;

  @override
  void initState() {
    members =
        widget.members
            .map(
              (m) => GroupMemberModel(
                name: m.name,
                image: m.image,
                skill: m.skill,
                isAdmin: m.isAdmin,
              ),
            )
            .toList();
    super.initState();
  }

  bool get canSave {
    return members.every(
      (m) => m.skill.skillLogo.isNotEmpty && m.skill.skillName.isNotEmpty,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          members.length,
          (index) => GroupMemberContainer(
            lang: widget.lang,
            width: widget.width,
            height: widget.height,
            name: members[index].name,
            image: members[index].image,
            skill: members[index].skill,
            isAdmin: members[index].isAdmin,
            onSkillSelected: (skill) {
              setState(() {
                members[index] = members[index].copyWith(skill: skill);
              });
            },
            returnedSkillId: (id) {
              skillId = id;
            },
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            GroupManagementCutomButton(
              height: widget.height,
              onPressed: () async {
                final friends = context.read<FollowersProvider>().followers;
                FriendEntity? selectedFriend; // Track the selected one

                FriendEntity? selected = await showFriendsBottomSheet(
                  context,
                  friends,
                  selectedFriend,
                );

                if (selected != null) {
                  memberId = selected.id;
                  setState(() {
                    members.add(
                      GroupMemberModel(
                        name: selected.name,
                        image: selected.profileImageUrl,
                        skill: SkillModel(skillName: '', skillLogo: ''),
                        isAdmin: false,
                      ),
                    );
                  });
                }
              },
              title: widget.lang.addMember,
              icon: Assets.iconsUserAdd,
            ),
            SizedBox(width: 10),
            BlocConsumer<InviteMemberCubit, InviteMemberState>(
              listener: (context, state) {
                if (state is InviteMemberSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(
                      message: state.message,
                      backgroundColor: Constants2.primaryColor(context),
                      textColor: Constants2.lightPrimaryColor(context),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return GroupManagementCutomButton(
                  height: widget.height,
                  onPressed: () {
                    context.read<InviteMemberCubit>().inviteMember(
                      projectId: widget.projectId,
                      skillID: skillId,
                      groupId: widget.groupId,
                      userId: memberId,
                    );
                  },
                  title: widget.lang.Save,
                  icon: Assets.iconsBookmark,
                  enable: canSave,
                );
              },
            ),
            SizedBox(width: 10),
            RemoveButton(width: widget.width),
          ],
        ),
        SizedBox(height: 10),
        Divider(thickness: 1, color: Constants2.dividerColor(context)),
        SizedBox(height: 10),
        GroupVacancySection(width: widget.width, lang: widget.lang),
      ],
    );
  }
}
