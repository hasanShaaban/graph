import 'package:flutter/material.dart';
import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class StudentOrNotButton extends StatefulWidget {
  const StudentOrNotButton({super.key});

  @override
  State<StudentOrNotButton> createState() => _StudentOrNotButtonState();
}

class _StudentOrNotButtonState extends State<StudentOrNotButton> {
  bool selectStudent = false;
  bool selectNonStudent = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectStudent = true;
              selectNonStudent = false;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: selectStudent,
            text: 'Student Account',
            icon: Assets.iconsUserGraduate,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            setState(() {
              selectStudent = false;
              selectNonStudent = true;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: selectNonStudent,
            text: ' Non-Student Account',
            icon: Assets.iconsUserTieHair,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
      ],
    );
  }
}
