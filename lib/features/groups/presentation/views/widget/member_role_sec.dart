import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';

class MemberRoleSec extends StatelessWidget {
  const MemberRoleSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Role:'),
        Column(
          children: [
            
          ],
        ),
       SvgPicture.asset(Assets.iconsAdd),
      ],
    );
  }
}