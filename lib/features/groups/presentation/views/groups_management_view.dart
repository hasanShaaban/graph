import 'package:flutter/material.dart';
import 'package:graph/features/follow/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/groups/presentation/views/widget/group_management_drop_down.dart';
import 'package:graph/generated/l10n.dart';

class GroupsManagementView extends StatelessWidget {
  const GroupsManagementView({super.key});
  static const name = 'groupsManagement';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text1: lang.groupsManagement, onPressed: () {}),
        body: SingleChildScrollView(
          child: Column(children: [GroupManagementDropDown(),
          
          ]),
        ),
      ),
    );
  }
}
