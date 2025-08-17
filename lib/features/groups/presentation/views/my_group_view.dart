import 'package:flutter/material.dart';
import 'widget/my_group_view_body.dart';


class MyGroupView extends StatelessWidget {
  const MyGroupView({super.key});
  static const name = 'myGroups';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: MyGroupViewBody()));
  }
}


