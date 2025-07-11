import 'package:flutter/material.dart';
import 'package:graph/features/groups/presentation/views/widget/group_management_view_body.dart';

class GroupManagementView extends StatelessWidget {
  const GroupManagementView({super.key});
  static const name = 'GroupManagementView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: GroupManagementViewBody()));
  }
}
