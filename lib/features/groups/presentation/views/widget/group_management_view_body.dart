import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/custom_snack_bar.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/services/providers/group_provider.dart';
import 'package:graph/core/services/providers/personal_data_provider.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/auth/presentation/manager/get_skills_cubit/get_skills_cubit.dart';
import 'package:graph/features/groups/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_member_cubit/group_member_cubit.dart';
import 'package:graph/features/profile/data/repos/profile_local_data_source.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_stateless_appbar.dart';
import '../../../../../core/widgets/major_and_year_dropdown_buttons_section.dart';
import 'group_management_custom_button.dart';
import 'group_memeber_container.dart';
import 'group_vacancy_section.dart';
import 'remove_button.dart';
import '../../../../../generated/l10n.dart';

class GroupManagementViewBody extends StatefulWidget {
  const GroupManagementViewBody({super.key});

  @override
  State<GroupManagementViewBody> createState() =>
      _GroupManagementViewBodyState();
}

class _GroupManagementViewBodyState extends State<GroupManagementViewBody> {
  ProfileLocalDataSource profileLocalDataSource =
      getIt<ProfileLocalDataSource>();
  bool createGroup = false;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomStatelessAppbar(lang: lang, title: lang.groupsManagement),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                MajorAndYearDropdownButtonsSection(height: height),
                SizedBox(height: 15),
                BlocConsumer<GroupInfoCubit, GroupInfoState>(
                  listener: (context, state) {
                    if (state is GroupInfoSuccess) {
                      context.read<GetSkillsCubit>().getSkills();
                      if (state.response.id != 0) {
                        context.read<GroupMemberCubit>().getGroupMembers(
                          groupId: state.response.id,
                        );
                      } else {
                        createGroup = false;
                      }
                    } else if (state is GroupInfoError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          message: state.errorMessage,
                          backgroundColor: Constants2.darkSecondaryColor(
                            context,
                          ),
                          textColor: Constants2.lightPrimaryColor(context),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GroupInfoSuccess) {
                      if (state.response.id != 0) {
                        return BlocBuilder<GroupMemberCubit, GroupMemberState>(
                          builder: (context, stateMembers) {
                            if (stateMembers is GroupMemberSuccess) {
                              return Column(
                                children: [
                                  ...List.generate(
                                    stateMembers.members.length,
                                    (index) => GroupMemberContainer(
                                      lang: lang,
                                      width: width,
                                      height: height,
                                      name: stateMembers.members[index].name,
                                      image: stateMembers.members[index].image,
                                      skill: stateMembers.members[index].skill,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      GroupManagementCutomButton(
                                        height: height,
                                        onPressed: () {},
                                        title: lang.addMember,
                                        icon: Assets.iconsUserAdd,
                                      ),
                                      SizedBox(width: 10),
                                      GroupManagementCutomButton(
                                        height: height,
                                        onPressed: () {},
                                        title: lang.Save,
                                        icon: Assets.iconsBookmark,
                                      ),
                                      SizedBox(width: 10),
                                      RemoveButton(width: width),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    thickness: 1,
                                    color: Constants2.dividerColor(context),
                                  ),
                                  SizedBox(height: 10),
                                  GroupVacancySection(width: width, lang: lang),
                                ],
                              );
                            } else if (stateMembers is GroupMemberError) {
                              return Text(stateMembers.errorMessage);
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      } else {
                        if (!createGroup) {
                          return Column(
                            children: [
                              Text(
                                'you don\'t have group for this project yet',
                              ),

                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Constants2.lightSecondaryColor(context),
                                ),
                                onPressed: () {
                                  setState(() {
                                    createGroup = true;
                                  });
                                },
                                child: Text('Creat One'),
                              ),
                            ],
                          );
                        } else {
                          final personalData =
                              context.watch<PersonalDataProvider>();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GroupMemberContainer(
                                lang: lang,
                                width: width,
                                height: height,
                                name: personalData.username,
                                image: personalData.userImage,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  backgroundColor: Constants2.primaryColor(
                                    context,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {
                                  final groupProvider =
                                      context.read<GroupProvider>();
                                  final cubit =
                                      context.read<CreateGroupCubit>();
                                  prettyLog(
                                    'ProjectId: ${groupProvider.projectId}, SkillId: ${groupProvider.skillId}',
                                  );

                                  if (groupProvider.projectId != null &&
                                      groupProvider.skillId != null) {
                                    cubit.createGroup(
                                      projectId: groupProvider.projectId!,
                                      skillID: groupProvider.skillId!,
                                    );
                                  }
                                },
                                child: Text(
                                  'Create',
                                  style: AppTextStyle.cairoSemiBold14.copyWith(
                                    color: Constants2.lightPrimaryColor(
                                      context,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    } else if (state is GroupInfoError) {
                      return Text(state.errorMessage);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
