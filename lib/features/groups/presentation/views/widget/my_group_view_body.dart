import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_member_cubit/group_member_cubit.dart';
import 'package:graph/features/groups/presentation/views/widget/rate_button.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_stateless_appbar.dart';
import '../../../../../core/widgets/major_and_year_dropdown_buttons_section.dart';
import 'group_management_button.dart';
import 'list_view_item.dart';
import 'rate_row.dart';
import '../../../../../generated/l10n.dart';

class MyGroupViewBody extends StatefulWidget {
  const MyGroupViewBody({super.key});

  @override
  State<MyGroupViewBody> createState() => _MyGroupViewBodyState();
}

class _MyGroupViewBodyState extends State<MyGroupViewBody> {
  bool isadmin = true;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomStatelessAppbar(lang: lang, title: lang.myGroups),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: MajorAndYearDropdownButtonsSection(height: height),
                  ),
                  SizedBox(width: 10),

                  isadmin
                      ? GroupManagementButton(width: width, height: height)
                      : Container(),
                ],
              ),
              BlocConsumer<GroupInfoCubit, GroupInfoState>(
                listener: (context, state) {
                  if (state is GroupInfoSuccess) {
                    if (state.response.id != 0) {
                      setState(() {
                        isadmin = state.response.isAdmin;
                      });
                      context.read<GroupMemberCubit>().getGroupMembers(
                        groupId: state.response.id,
                      );
                    }
                    else{
                      setState(() {
                        isadmin = true;
                      });
                    }
                  }
                },
                builder: (context, state) {
                  if (state is GroupInfoSuccess) {
                    if (state.response.id != 0) {
                      return BlocBuilder<GroupMemberCubit, GroupMemberState>(
                        builder: (context, memberState) {
                          if (memberState is GroupMemberSuccess) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 10),
                                RateButton(),
                                SizedBox(height: 10),
                                ...List.generate(
                                  memberState.members.length,
                                  (index) => ListViewItem(
                                    member: memberState.members[index],
                                    height: height,
                                    width: width,
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Constants2.darkPrimaryColor(context),
                                ),
                                RateRow(),
                              ],
                            );
                          } else if (memberState is GroupMemberError) {
                            return Text(memberState.errorMessage);
                          } else {
                            return Text('loading . . . ');
                          }
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(height: height / 2 - 250),
                          SvgPicture.asset(
                            Assets.iconsDrawerEmpty,
                            width: 90,
                            color: Constants2.darkPrimaryColor(context),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              'You don\'t have group for this project yet',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.cairoSemiBold16,
                            ),
                          ),
                        ],
                      );
                    }
                  } else if (state is GroupInfoError) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: height / 2 - 200),
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
