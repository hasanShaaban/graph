import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/providers/group_provider.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/groups/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';

class CreateGroupButton extends StatelessWidget {
  const CreateGroupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor: Constants2.primaryColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {
        final groupProvider = context.read<GroupProvider>();
        final cubit = context.read<CreateGroupCubit>();
        prettyLog(
          'ProjectId: ${groupProvider.projectId}, SkillId: ${groupProvider.skillId}',
        );

        if (groupProvider.projectId != null && groupProvider.skillId != null) {
          cubit.createGroup(
            projectId: groupProvider.projectId!,
            skillID: groupProvider.skillId!,
          );
        }
      },
      child: BlocConsumer<CreateGroupCubit, CreateGroupState>(
        listener: (context, state) {
          if (state is CreateGroupSuccess) {
            context.read<GroupInfoCubit>().getGroupInfo(
              projectId: context.read<GroupProvider>().projectId!,
            );
          }
        },
        builder: (context, state) {
          if(state is CreateGroupLoading){
            return Text('Creating...');
          }else{
            return Text(
            'Create',
            style: AppTextStyle.cairoSemiBold14.copyWith(
              color: Constants2.lightPrimaryColor(context),
            ),
          );
          }
        },
      ),
    );
  }
}
