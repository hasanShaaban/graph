import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/custom_snack_bar.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_member_cubit/group_member_cubit.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'group_profile_list_view.dart';
import 'groups_drop_down_button.dart';
import 'see_all_groups_button.dart';

class GroupSection extends StatelessWidget {
  const GroupSection({
    super.key,
    required this.lang,
    required this.height,
    required this.width,
  });

  final S lang;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              lang.currentGroup,
              style: AppTextStyle.cairoSemiBold14.copyWith(
                color: Constants2.darkPrimaryColor(context),
              ),
            ),
            Spacer(),
            GroupsDropDownButton(),
            SizedBox(width: 10),
            SeeAllGroupsButton(lang: lang),
          ],
        ),
        SizedBox(height: 10),
        BlocListener<GroupInfoCubit, GroupInfoState>(
          listener: (context, state) {
            if (state is GroupInfoSuccess && state.response.id != 0) {
              context.read<GroupMemberCubit>().getGroupMembers(
                groupId: state.response.id,
              );
            } else if (state is GroupInfoError) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  message: state.errorMessage,
                  backgroundColor: Constants2.darkSecondaryColor(context),
                  textColor: Constants2.lightPrimaryColor(context),
                ),
              );
            }
          },
          child: GroupProfileListView(height: height, width: width, lang: lang),
        ),
      ],
    );
  }
}
