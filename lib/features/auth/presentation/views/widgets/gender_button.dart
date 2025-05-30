import 'package:flutter/material.dart';

import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({super.key});

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  bool selectMale = false;
  bool selectFeMale = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectMale = true;
              selectFeMale = false;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: selectMale,
            text: 'Male',
            icon: Assets.iconsSmilingBoy,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              selectFeMale = true;
              selectMale = false;
            });
          },

          child: AnimatedContainerWidget(
            whatSelect: selectFeMale,
            text: 'Female',
            icon: Assets.iconsSmilingGirl,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
      ],
    );
  }
}
