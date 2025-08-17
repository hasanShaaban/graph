import 'package:flutter/material.dart';
import 'widgets/follow_view_body.dart';

class FollowView extends StatelessWidget {
  const FollowView({super.key, required this.type});
  static const String name = 'FollowersView';
  final String type;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: FollowViewBody(type: type,)));
  }
}


