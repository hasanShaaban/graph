import 'package:flutter/material.dart';
import '../../../follow/presentation/views/widgets/custom_app_bar.dart';
import 'widget/group_management_drop_down.dart';
import '../../../../generated/l10n.dart';

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
