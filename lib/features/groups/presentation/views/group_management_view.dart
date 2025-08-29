import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';
import 'package:graph/features/groups/presentation/manager/invite_member_cubit/invite_member_cubit.dart';
import 'widget/group_management_view_body.dart';

class GroupManagementView extends StatelessWidget {
  const GroupManagementView({super.key});
  static const name = 'GroupManagementView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => InviteMemberCubit(getIt<GroupsRepo>()),
          child: GroupManagementViewBody(),
        ),
      ),
    );
  }
}
