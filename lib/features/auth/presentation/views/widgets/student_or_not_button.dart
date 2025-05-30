import 'package:flutter/material.dart';

import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class StudentOrNotButton extends StatelessWidget {
  const StudentOrNotButton({
    super.key,
    required this.selectStudent,
    required this.selectNonStudent,
    required this.onSelectStudent,
    required this.onSelectNotStudent,
  });

  final bool selectStudent;

  final bool selectNonStudent;
  final VoidCallback onSelectStudent;
  final VoidCallback onSelectNotStudent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onSelectStudent,
          child: AnimatedContainerWidget(
            whatSelect: selectStudent,
            text: 'Student Account',
            icon: Assets.iconsUserGraduate,
            widthSelected: 310,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: onSelectNotStudent,
          child: AnimatedContainerWidget(
            whatSelect: selectNonStudent,
            text: ' Non-Student Account',
            icon: Assets.iconsUserTieHair,
            widthSelected: 310,
            widthNotSelected: 300,
          ),
        ),
      ],
    );
  }
}
