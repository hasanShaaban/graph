import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'widget/my_group_view_body.dart';

class MyGroupView extends StatelessWidget {
  const MyGroupView({super.key});
  static const name = 'myGroups';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => GroupInfoCubit(getIt<GroupsRepo>()),
          child: MyGroupViewBody(),
        ),
      ),
    );
  }
}
