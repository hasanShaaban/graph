import 'package:flutter/material.dart';
import 'package:graph/generated/l10n.dart';

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
    final lang = S.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: onSelectStudent,
          child: AnimatedContainerWidget(
            whatSelect: selectStudent,
            text: lang.studentAccount,
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
            text: lang.nonStudentAccount,
            icon: Assets.iconsUserTieHair,
            widthSelected: 310,
            widthNotSelected: 300,
          ),
        ),
      ],
    );
  }
}
