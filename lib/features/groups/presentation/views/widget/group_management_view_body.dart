import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/custom_snack_bar.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/services/providers/personal_data_provider.dart';
import 'package:graph/features/auth/presentation/manager/get_skills_cubit/get_skills_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_member_cubit/group_member_cubit.dart';
import 'package:graph/features/groups/presentation/views/widget/create_group_button.dart';
import 'package:graph/features/groups/presentation/views/widget/group_member_success_body.dart';
import 'package:graph/features/groups/presentation/views/widget/group_memeber_container.dart';
import 'package:graph/features/profile/data/repos/profile_local_data_source.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_stateless_appbar.dart';
import '../../../../../core/widgets/major_and_year_dropdown_buttons_section.dart';
import '../../../../../generated/l10n.dart';

class GroupManagementViewBody extends StatefulWidget {
  const GroupManagementViewBody({super.key,});

  @override
  State<GroupManagementViewBody> createState() =>
      _GroupManagementViewBodyState();
}

class _GroupManagementViewBodyState extends State<GroupManagementViewBody> {
  ProfileLocalDataSource profileLocalDataSource =
      getIt<ProfileLocalDataSource>();
  bool createGroup = false;
  late int  currentProject;
  @override
  
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
                MajorAndYearDropdownButtonsSection(
                  height: height,
                  selectedProject: (value) {
                    currentProject = value;
                  },
                ),
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
                        log(state.response.id.toString());
                        return BlocBuilder<GroupMemberCubit, GroupMemberState>(
                          builder: (context, stateMembers) {
                            if (stateMembers is GroupMemberSuccess) {
                              return GroupMemberSuccessBody(
                                lang: lang,
                                width: width,
                                height: height,
                                members: stateMembers.members,
                                groupId: state.response.id,
                                projectId: currentProject,
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
                                isAdmin: true,
                              ),
                              CreateGroupButton(),
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
